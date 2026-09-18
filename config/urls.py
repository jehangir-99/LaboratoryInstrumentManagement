from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static
from django.shortcuts import redirect


def root_redirect(request):

    if request.user.is_authenticated:
        return redirect('dashboard:dashboard')

    return redirect('accounts:login')


urlpatterns = [

    path(
        'admin/',
        admin.site.urls
    ),

    path(
        '',
        root_redirect,
        name='root'
    ),

    path(
        'accounts/',
        include('accounts.urls')
    ),

    path(
        'instruments/',
        include('instruments.urls')
    ),

    path(
        'calibrations/',
        include('calibrations.urls')
    ),

    path(
        'maintenance/',
        include('maintenance.urls')
    ),

    path(
        'suppliers/',
        include('suppliers.urls')
    ),

    path(
        'locations/',
        include('locations.urls')
    ),

    path(
        'reports/',
        include('reports.urls')
    ),

    path(
        'dashboard/',
        include('dashboard.urls')
    ),

]


if settings.DEBUG:

    urlpatterns += static(
        settings.MEDIA_URL,
        document_root=settings.MEDIA_ROOT
    )