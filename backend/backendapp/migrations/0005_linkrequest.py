# Generated by Django 4.1.3 on 2022-11-13 01:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("backendapp", "0004_event_is_in_range"),
    ]

    operations = [
        migrations.CreateModel(
            name="LinkRequest",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("req_id", models.CharField(max_length=200)),
                ("a_user_id", models.CharField(max_length=200)),
                ("b_user_id", models.CharField(max_length=200)),
                ("a_event_id", models.CharField(max_length=200)),
                ("b_event_id", models.CharField(max_length=200)),
            ],
        ),
    ]
