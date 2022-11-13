from django.db import models
from django.contrib.auth.models import AbstractUser

class Event(models.Model):

    USERNAME_FIELD = 'event_id'
    REQUIRED_FIELDS = ('event_id', 'title', 'start_time', 'end_time', 'username', 'longitude', 'latitude', 'dist')

    event_id = models.CharField(max_length=200)
    title = models.CharField(max_length=200)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    longitude = models.CharField(max_length=200, default='')
    latitude = models.CharField(max_length=200, default='')

    # non-compulsory distance field - to be changed in views.py
    dist = models.FloatField(max_length=200, blank=True, null=True)
    is_in_range = models.BooleanField(default=False)

    ### get from CustomUser user_id
    username = models.CharField(max_length=200, default='')

    @property
    def is_anonymous(self):
        """
        Always return False. This is a way of comparing User objects to
        anonymous users.
        """
        return False

    @property
    def is_authenticated(self):
        """
        Always return False. This is a way of comparing User objects to
        anonymous users.
        """
        return False


class LinkRequest(models.Model):
    USERNAME_FIELD = 'req_id'
    REQUIRED_FIELDS = ('req_id', 'a_user_id', 'b_user_id', 'user_id')

    req_id = models.CharField(max_length=200)
    a_user_id = models.CharField(max_length=200)
    b_user_id = models.CharField(max_length=200)
    a_event_id = models.CharField(max_length=200)
    b_event_id = models.CharField(max_length=200)

    @property
    def is_anonymous(self):
        """
        Always return False. This is a way of comparing User objects to
        anonymous users.
        """
        return False

    @property
    def is_authenticated(self):
        """
        Always return False. This is a way of comparing User objects to
        anonymous users.
        """
        return False
