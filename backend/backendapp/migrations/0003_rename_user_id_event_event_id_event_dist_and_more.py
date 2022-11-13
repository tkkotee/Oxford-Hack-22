# Generated by Django 4.1.3 on 2022-11-12 23:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backendapp', '0002_event_delete_customuser'),
    ]

    operations = [
        migrations.RenameField(
            model_name='event',
            old_name='user_id',
            new_name='event_id',
        ),
        migrations.AddField(
            model_name='event',
            name='dist',
            field=models.FloatField(blank=True, max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='event',
            name='latitude',
            field=models.CharField(default='', max_length=200),
        ),
        migrations.AddField(
            model_name='event',
            name='longitude',
            field=models.CharField(default='', max_length=200),
        ),
        migrations.AddField(
            model_name='event',
            name='username',
            field=models.CharField(default='', max_length=200),
        ),
    ]
