from django import forms

from .models import Location


class LocationForm(forms.ModelForm):

    class Meta:
        model = Location

        fields = [
            'name',
            'building',
            'room',
            'description',
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

            'description': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 4,
                'placeholder': 'Location description',
            }),
        }