from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from django.utils.html import format_html
from .models import Profile

class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = False
    verbose_name_plural = 'Profile'
    fk_name = 'user'
    readonly_fields = ['profile_pic_preview']

    def profile_pic_preview(self, obj):
        if obj.profile_pic:
            return format_html('<img src="{}" style="height:100px;border-radius:8px;" />', obj.profile_pic.url)
        return "No image"
    profile_pic_preview.short_description = 'Profile Picture'

class CustomUserAdmin(UserAdmin):
    inlines = (ProfileInline,)
    list_display = ('username', 'email', 'first_name', 'last_name', 'is_staff', 'get_phone', 'get_profile_pic')
    list_select_related = ('profile',)

    def get_phone(self, instance):
        return instance.profile.phone
    get_phone.short_description = 'Phone'

    def get_profile_pic(self, instance):
        if instance.profile.profile_pic:
            return format_html('<img src="{}" style="height:30px; border-radius:50%;" />', instance.profile.profile_pic.url)
        return "No image"
    get_profile_pic.short_description = 'Profile Pic'

    def get_inline_instances(self, request, obj=None):
        if not obj:
            return list()
        return super().get_inline_instances(request, obj)

admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)
