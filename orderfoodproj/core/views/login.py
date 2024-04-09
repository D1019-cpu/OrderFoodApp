from django.shortcuts import render, redirect  
from django.contrib.auth.decorators import login_required 
from django.contrib.auth import login, logout, authenticate 
from django.contrib.auth import get_user_model 
from django.contrib import messages


# GET: /login/
def get_login_view(request):
    return render(request, 'core/login.html', {})


# POST: /do-login/
def post_login_view(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        UserModel = get_user_model()
        if not UserModel.objects.filter(email=email).exists():
            messages.error(request, f"Email: {email} không tồn tại!")
            return redirect('get-login-view')
        else:
            user = authenticate(request, email=email, password=password)
            print(user)
            if user is not None:
                login(request, user)
                return redirect('index')
            else:
                messages.error(request, "Mật khẩu không đúng, vui lòng nhập lại!")
                return redirect('get-login-view')
    else:
        return redirect('get-login-view')


# GET: /logout/
@login_required(login_url='/login/')
def get_logout_view(request):
    logout(request)
    return redirect('get-login-view')