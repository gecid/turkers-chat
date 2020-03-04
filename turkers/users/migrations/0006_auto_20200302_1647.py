# Generated by Django 2.2.8 on 2020-03-02 19:47
from uuid import uuid4
from django.db import migrations


def populate_turkers_ids(apps, schema_editor):
    User = apps.get_model("users", "User")
    for turker in User.objects.filter(user_type="TK", uuid=None):
        turker.uuid = uuid4()
        turker.save()


class Migration(migrations.Migration):

    dependencies = [
        ("users", "0005_user_uuid"),
    ]

    operations = [migrations.RunPython(populate_turkers_ids)]