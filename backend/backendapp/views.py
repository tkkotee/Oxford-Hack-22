from django.shortcuts import render
from geopy import distance
from django.contrib.auth.models import User, Group
from .models import Event
from rest_framework import viewsets
from rest_framework import permissions
from backendapp.serializers import UserSerializer, GroupSerializer, EventSerializer


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
        longitude, latitude = float(getattr(this_event, 'longitude')), float(getattr(this_event, 'latitude'))
        all_events = Event.objects.all()

        for event in all_events.iterator():
            setattr(event, 'dist', distance.distance((longitude, latitude), (getattr(event, 'longitude'), getattr(event, 'latitude'))).km)
            
            if getattr(event, 'dist') <= 1:
                # event.is_in_range = True
                setattr(event, 'is_in_range', True)
                event.save(update_fields=['is_in_range'])
        

        setattr(this_event, 'is_in_range', False)
        this_event.save(update_fields=['is_in_range'])

        return Event.objects.filter(is_in_range = True)
    