
from django.contrib.auth import get_user_model
from django.utils.functional import SimpleLazyObject

User = get_user_model()

def get_frontend_user(request):
    user_id = request.session.get('frontend_user_id')
    if user_id:
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            pass
    return None

class FrontendAuthenticationMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
    
    def __call__(self, request):
        request.frontend_user = SimpleLazyObject(lambda: get_frontend_user(request))
        response = self.get_response(request)
        return response
