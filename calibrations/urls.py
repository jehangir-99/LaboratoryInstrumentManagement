from django.urls import path

from . import views


app_name = 'calibrations'


urlpatterns = [

    path(
        '',
        views.calibration_list,
        name='calibration_list'
    ),

    path(
        'add/',
        views.calibration_create,
        name='calibration_create'
    ),

    path(
        '<int:pk>/',
        views.calibration_detail,
        name='calibration_detail'
    ),

    path(
        '<int:pk>/edit/',
        views.calibration_update,
        name='calibration_update'
    ),

    path(
        '<int:pk>/delete/',
        views.calibration_delete,
        name='calibration_delete'
    ),
]