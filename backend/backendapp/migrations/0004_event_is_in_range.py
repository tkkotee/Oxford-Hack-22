# Generated by Django 4.1.3 on 2022-11-13 00:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backendapp', '0003_rename_user_id_event_event_id_event_dist_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='is_in_range',
            field=models.BooleanField(default=False),
        ),
    ]