from django.urls import path
from . import views


app_name = 'instruments'


urlpatterns = [
    path('', views.instrument_list, name='instrument_list'),
    path('add/', views.instrument_create, name='instrument_create'),
    path('<int:pk>/', views.instrument_detail, name='instrument_detail'),
    path('<int:pk>/edit/', views.instrument_update, name='instrument_update'),
    path('<int:pk>/delete/', views.instrument_delete, name='instrument_delete'),
]