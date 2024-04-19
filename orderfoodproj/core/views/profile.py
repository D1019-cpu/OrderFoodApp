from django.shortcuts import render, redirect 
from django.contrib.auth.decorators import login_required 
from django.contrib import messages 
from django.http import HttpResponse

from core.models.user import Customer


@login_required(login_url='/login/')
def get_profile_view(request):
    if request.user.user_type == '1':
        try:
            customer = Customer.objects.get(admin=request.user)
        except Customer.DoesNotExist:
            messages.info(request, "")
            return HttpResponse("<h1>Không tìm thấy customer!</h1><a href="/">Home</a>")
        return render(request, 'core/profile.html', {
            'customer': customer
        }, status=200)
