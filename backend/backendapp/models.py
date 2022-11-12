from django.db import models
from django.contrib.auth.models import AbstractUser

#class CustomUser(AbstractUser):
    
 #   email = models.EmailField(unique=True)

class Event(models.Model):

    USERNAME_FIELD = 'user_id'
    REQUIRED_FIELDS = ('title', 'start_time', 'end_time', 'user_id')

    title = models.CharField(max_length=200)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    
    ### get from CustomUser user_id
    user_id = models.CharField(max_length=200)

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
