from django.contrib import messages
from django.contrib.auth import login
from django.contrib.auth.models import User
from django.contrib.auth.views import LoginView, LogoutView
from django.shortcuts import redirect, render
from django.urls import reverse_lazy

from .forms import UserRegistrationForm
from .models import UserProfile


class UserLoginView(LoginView):

    template_name = 'accounts/login.html'

    redirect_authenticated_user = True

    def get_success_url(self):
        return reverse_lazy('dashboard:dashboard')


class UserLogoutView(LogoutView):

    next_page = reverse_lazy('accounts:login')


def register(request):

    if request.user.is_authenticated:
        return redirect('dashboard:dashboard')

    if request.method == 'POST':

        form = UserRegistrationForm(request.POST)

        if form.is_valid():

            user = User.objects.create_user(
                username=form.cleaned_data['username'],
                first_name=form.cleaned_data['first_name'],
                last_name=form.cleaned_data['last_name'],
                email=form.cleaned_data['email'],
                password=form.cleaned_data['password'],
            )

            UserProfile.objects.create(
                user=user,
                role=form.cleaned_data['role'],
                phone=form.cleaned_data['phone'],
                department=form.cleaned_data['department'],
            )

            messages.success(
                request,
                'Account created successfully. Please log in.'
            )

            return redirect('accounts:login')

    else:

        form = UserRegistrationForm()

    return render(
        request,
        'accounts/register.html',
        {
            'form': form,
        }
    )