from django.shortcuts import render
from geopy import distance
from django.contrib.auth.models import User, Group
from .models import Event
from rest_framework import viewsets
from rest_framework import permissions
from backendapp.serializers import UserSerializer, GroupSerializer, EventSerializer
import json
import requests


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]

class EventViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Event.objects.all()
    serializer_class = EventSerializer
    permission_classes = [permissions.IsAuthenticated]

class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAuthenticated]

class CustomEventViewSet(viewsets.ModelViewSet):
    model = Event
    serializer_class = EventSerializer

    def get_queryset(self):

        return Event.objects.filter(username=self.kwargs['username'])

class LocalEventViewSet(viewsets.ModelViewSet):
    model = Event
    serializer_class = EventSerializer

    def get_queryset(self):
        event_id = self.kwargs['event_id']
        this_event = Event.objects.get(event_id=event_id)
        idquery = '''query Profile {
                    profile(request: {handle: "''' + str(this_event.username) +'''"}) {
                    id
                name
            }
        }'''
        url = 'https://api.lens.dev'
        p = requests.post(url, json={'query': idquery})
        profileId = str(json.loads(p.text)['data']['profile']['id'])
        # profileId = "0x01"
        query = '''query Followers {
          followers(request: { 
                        profileId: "'''+ profileId +'''",
                     }) {
               items {
              wallet {
                defaultProfile {
                  id
                  name
                  handle
                  ownedBy
                }
              }
            }
          }
        }'''
        user = {"user": this_event.username}
        r = requests.post(url, json={'query': query})
        print(query)
        result = json.loads(r.text)
        print(result)
        following = [i['wallet']['defaultProfile']['handle'] for i in result['data']['followers']['items']]
        print(following)

        longitude, latitude = float(getattr(this_event, 'longitude')), float(getattr(this_event, 'latitude'))
        start_time, end_time = getattr(this_event, 'start_time'), getattr(this_event, 'end_time')
        all_events = Event.objects.all()

        for event in all_events.iterator():
            setattr(event, 'is_in_range', False)
            event.save(update_fields=['is_in_range'])
            setattr(event, 'dist', distance.distance((latitude, longitude), (getattr(event, 'latitude'), getattr(event, 'longitude'))).km)
            if getattr(event, 'dist') <= 1 and (getattr(event, 'username') in following) and start_time <= getattr(event, 'end_time') and end_time >= getattr(event, 'start_time'):
                # event.is_in_range = True
                setattr(event, 'is_in_range', True)
                event.save(update_fields=['is_in_range'])
                event.save(update_fields=['dist'])
        

        setattr(this_event, 'is_in_range', False)
        this_event.save(update_fields=['is_in_range'])

        return Event.objects.filter(is_in_range = True)

from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.response import Response

class CustomAuthToken(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)
        return Response({
            'token': token.key,
            'username': user.username,
        })