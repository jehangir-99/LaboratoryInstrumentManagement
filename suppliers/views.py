from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.shortcuts import get_object_or_404, redirect, render

from accounts.decorators import role_required

from .forms import SupplierForm
from .models import Supplier


@login_required
def supplier_list(request):

    suppliers = Supplier.objects.all()

    query = request.GET.get('q', '').strip()

    if query:
        suppliers = suppliers.filter(
            Q(name__icontains=query)
            | Q(contact_person__icontains=query)
            | Q(phone__icontains=query)
            | Q(email__icontains=query)
        )

    context = {
        'suppliers': suppliers,
        'query': query,
    }

    return render(
        request,
        'suppliers/supplier_list.html',
        context
    )


@login_required
def supplier_detail(request, pk):

    supplier = get_object_or_404(
        Supplier,
        pk=pk
    )

    return render(
        request,
        'suppliers/supplier_detail.html',
        {
            'supplier': supplier
        }
    )


@login_required
@role_required(
    'administrator',
    'laboratory_manager'
)
def supplier_create(request):

    if request.method == 'POST':

        form = SupplierForm(request.POST)

        if form.is_valid():

            supplier = form.save()

            messages.success(
                request,
                'Supplier added successfully.'
            )

            return redirect(
                'suppliers:supplier_detail',
                pk=supplier.pk
            )

    else:

        form = SupplierForm()

    return render(
        request,
        'suppliers/supplier_form.html',
        {
            'form': form
        }
    )


@login_required
@role_required(
    'administrator',
    'laboratory_manager'
)
def supplier_update(request, pk):

    supplier = get_object_or_404(
        Supplier,
        pk=pk
    )

    if request.method == 'POST':

        form = SupplierForm(
            request.POST,
            instance=supplier
        )

        if form.is_valid():

            supplier = form.save()

            messages.success(
                request,
                'Supplier updated successfully.'
            )

            return redirect(
                'suppliers:supplier_detail',
                pk=supplier.pk
            )

    else:

        form = SupplierForm(
            instance=supplier
        )

    return render(
        request,
        'suppliers/supplier_form.html',
        {
            'form': form,
            'supplier': supplier
        }
    )


@login_required
@role_required('administrator')
def supplier_delete(request, pk):

    supplier = get_object_or_404(
        Supplier,
        pk=pk
    )

    if request.method == 'POST':

        supplier.delete()

        messages.success(
            request,
            'Supplier deleted successfully.'
        )

        return redirect(
            'suppliers:supplier_list'
        )

    return render(
        request,
        'suppliers/supplier_confirm_delete.html',
        {
            'supplier': supplier
        }
    )