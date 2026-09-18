from functools import wraps

from django.contrib import messages
from django.shortcuts import redirect


def role_required(*allowed_roles):
    def decorator(view_func):

        @wraps(view_func)
        def wrapper(request, *args, **kwargs):

            if not request.user.is_authenticated:
                return redirect('login')

            try:
                profile = request.user.profile
            except Exception:
                messages.error(
                    request,
                    'User profile not found.'
                )
                return redirect('dashboard:dashboard')

            if not profile.is_active:
                messages.error(
                    request,
                    'Your account is inactive.'
                )
                return redirect('login')

            if profile.role not in allowed_roles:
                messages.error(
                    request,
                    'You do not have permission to access this page.'
                )
                return redirect('dashboard:dashboard')

            return view_func(request, *args, **kwargs)

        return wrapper

    return decorator