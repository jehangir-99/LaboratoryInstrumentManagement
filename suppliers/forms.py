from django import forms

from .models import Supplier, Location


class SupplierForm(forms.ModelForm):

    class Meta:
        model = Supplier

        fields = [
            'name',
            'contact_person',
            'phone',
            'email',
            'address',
            'website',
            'notes',
        ]

        widgets = {
            'name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Supplier name',
            }),

            'contact_person': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Contact person',
            }),

            'phone': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Phone number',
            }),

            'email': forms.EmailInput(attrs={
                'class': 'form-control',
                'placeholder': 'Email address',
            }),

            'address': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 3,
                'placeholder': 'Supplier address',
            }),

            'website': forms.URLInput(attrs={
                'class': 'form-control',
                'placeholder': 'https://example.com',
            }),

            'notes': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 4,
                'placeholder': 'Additional notes',
            }),
        }


class LocationForm(forms.ModelForm):

    class Meta:
        model = Location

        fields = [
            'name',
            'building',
            'room',
        ]

        widgets = {
            'name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Location name',
            }),

            'building': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Building name',
            }),

            'room': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Room number',
            }),
        }