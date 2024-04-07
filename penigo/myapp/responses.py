from django.http import JsonResponse

def success(data=None):
    response_data = {"status": "success"}
    if data:
        response_data["data"] = data
    return JsonResponse(response_data, status=200)

def bad_request(message):
    return JsonResponse({
        "error": "Bad Request",
        "message": message
    }, status=400)

def not_found(message):
    return JsonResponse({
        "error": "Not Found",
        "message": message
    }, status=404)

def internal_server_error(message="An unexpected error occurred on the server. Please try again later."):
    return JsonResponse({
        "error": "Internal Server Error",
        "message": message
    }, status=500)

def unauthorized(message='Authentication Failed'):
    return JsonResponse({
        "error": "Unauthorized",
        "message": message
    }, status=401)

def invalid_method(message):
    return JsonResponse({
        "error": "Unauthorized",
        "message": f"Invalid method. Use method {message}"
    }, status=401)
