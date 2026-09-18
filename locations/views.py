from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.shortcuts import get_object_or_404, redirect, render

from accounts.decorators import role_required

from .forms import LocationForm
from .models import Location


@login_required
def location_list(request):

    locations = Location.objects.all()

    query = request.GET.get('q', '').strip()

    if query:
        locations = locations.filter(
            Q(name__icontains=query)
            | Q(building__icontains=query)
            | Q(room__icontains=query)
            | Q(description__icontains=query)
        )

    context = {
        'locations': locations,
        'query': query,
    }

    return render(
        request,
        'locations/location_list.html',
        context
    )


@login_required
def location_detail(request, pk):

    location = get_object_or_404(
        Location,
        pk=pk
    )

    return render(
        request,
        'locations/location_detail.html',
        {
            'location': location
        }
    )


@login_required
@role_required(
    'administrator',
    'laboratory_manager'
)
def location_create(request):

    if request.method == 'POST':

        form = LocationForm(request.POST)

        if form.is_valid():

            location = form.save()

            messages.success(
                request,
                'Location added successfully.'
            )

            return redirect(
                'locations:location_detail',
                pk=location.pk
            )

    else:

        form = LocationForm()

    return render(
        request,
        'locations/location_form.html',
        {
            'form': form
        }
    )


@login_required
@role_required(
    'administrator',
    'laboratory_manager'
)
def location_update(request, pk):

    location = get_object_or_404(
        Location,
        pk=pk
    )

    if request.method == 'POST':

        form = LocationForm(
            request.POST,
            instance=location
        )

        if form.is_valid():

            location = form.save()

            messages.success(
                request,
                'Location updated successfully.'
            )

            return redirect(
                'locations:location_detail',
                pk=location.pk
            )

    else:

        form = LocationForm(
            instance=location
        )

    return render(
        request,
        'locations/location_form.html',
        {
            'form': form,
            'location': location
        }
    )


@login_required
@role_required('administrator')
def location_delete(request, pk):

    location = get_object_or_404(
        Location,
        pk=pk
    )

    if request.method == 'POST':

        location.delete()

        messages.success(
            request,
            'Location deleted successfully.'
        )

        return redirect(
            'locations:location_list'
        )

    return render(
        request,
        'locations/location_confirm_delete.html',
        {
            'location': location
        }
    )