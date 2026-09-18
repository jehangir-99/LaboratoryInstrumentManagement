from django.urls import path
from .views import dashboard
from . import views

app_name = 'dashboard'

urlpatterns = [
    path(
        '',
        dashboard,
        name='dashboard'
    ),
]