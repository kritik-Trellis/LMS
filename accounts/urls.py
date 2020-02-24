from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.home,name="home"),
    path('dashboard/',views.dashboard,name="dashboard"),
    path('user/',views.user,name="user"),
    path('manager/',views.manager,name="manager"),
    path('status/',views.status,name="status"),
    path('leave/',views.applyleave,name="applyleave"),
    path('leave/view_status/',views.view_my_leave_table,name="view_my_leave_table"),
    path('leave/view_status_mh/',views.leaves_list_mh,name="leaves_list_mh"),
    # path('submitleave/',views.submitleave,name="submitleave"),
    path('login/',views.login_,name="login"),
    path('register/',views.register,name="register"),
    path('logout/',views.logout_,name="logout")
]
