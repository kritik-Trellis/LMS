from django.contrib import admin
from django.urls import path, include
from . import views
from django.contrib.auth.views import password_reset_done
from django.contrib.auth.views import PasswordResetView

urlpatterns = [
    path('', views.home,name="home"),
    path('dashboard/',views.dashboard,name="dashboard"),
    path('user/',views.user,name="user"),
    path('manager/',views.manager,name="manager"),
    path('status/',views.status,name="status"),
    path('leave/',views.applyleave,name="applyleave"),
    path('leave/view_status/',views.view_my_leave_table,name="view_my_leave_table"),
    path('leave/view_status_mh/',views.leaves_list_mh,name="leaves_list_mh"),
    path('leaves/view_status/view/<int:id>/',views.leaves_view,name="leaves_view"),
    path('leaves/view_status_mh/view/<int:id>/',views.leaves_view_mh,name="leaves_view_mh"),
    path('leaves/view_status_mh/view/<int:id>/approve/',views.approve_leave,name="approve_leave"),
    path('leaves/view_status_mh/view/<int:id>/unapprove/',views.unapprove_leave,name="unapprove_leave"),
    path('leaves/view_status_mh/view/<int:id>/reject/',views.reject_leave,name="reject_leave"),
    path('leaves/view_status_mh/view/<int:id>/unreject/',views.unreject_leave,name="unreject_leave"),
    path('leaves/view/approved_leaves/',views.leaves_approved_list,name="leaves_approved_list"),
    path('leaves/view/rejected_leaves/',views.leaves_rejected_list,name="leave_rejected_list"),
    path('login/',views.login_,name="login"),
    path('register/',views.register,name="register"),
    path('logout/',views.logout_,name="logout"),
    path('manager/<int:id>/edit_profile/',views.edit_profile,name='edit_profile'),
    path('user/<int:id>/edit_profile/',views.edit_profile,name='edit_profile'),
        # path('reset-password/',password_reset,name='reset_password'),
        # path('reset-password/done/',password_reset_done,name='password_reset_done'),
    path(
        'reset-password/',
        PasswordResetView.as_view(),
        name='password_reset'
    ),
    path('user/<int:id>/edit_profile/',views.edit_profile,name='edit_profile')
    # path('email/', views.email, name="email"),
    # path('sendmail/', views.sendmail, name="sendmail"),

]
