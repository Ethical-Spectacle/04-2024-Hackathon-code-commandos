import secrets
import string
import json
from myapp.responses import success, bad_request, internal_server_error


def generate_id(length=13):
    alphanumeric = string.ascii_letters + string.digits
    return {"id": ''.join(secrets.choice(alphanumeric) for _ in range(length))}


id = generate_id()

# Create your models here.
transit_ways_100 = [
    {
        "preference": "yellow",
        "source_lat": "33.42778514749298",
        "source_long": "-111.94086034605269",
        "dest_lat": "33.306215432072534",
        "dest_long": "-111.67849161350222",
        "time": 95,
        "car_distance": 8,
        "cost": 16.86,
        "steps": [
            {
                "mode": "Train",
                "waiting": 1,
                "time": 26,
                "source_lat": "33.42778514749298",
                "source_long": "-111.94086034605269",
                "dest_lat": "33.415724035194486",
                "dest_long": "-111.79071508468012",
            },
            {
                "mode": "Bus",
                "waiting": 14,
                "time": 32,
                "source_lat": "33.41513448717671",
                "source_long": "-111.79032718215971",
                "dest_lat": "33.41739230625446",
                "dest_long": "-111.68422654266976",
            },
            {
                "mode": "CAB",
                "waiting": 5,
                "time": 17,
                "distance": 8,
                "cost": 12.86,
                "source_lat": "33.41739230625446",
                "source_long": "-111.68422654266976",
                "dest_lat": "33.306215432072534",
                "dest_long": "-111.67849161350222",
            }
        ]
    },
    {
        "preference": "green",
        "source_lat": "33.42778514749298",
        "source_long": "-111.94086034605269",
        "dest_lat": "33.306215432072534",
        "dest_long": "-111.67849161350222",
        "time": 95,
        "car_distance": 17,
        "cost": 22.86,
        "steps": [
            {
                "mode": "Train",
                "waiting": 1,
                "time": 26,
                "source_lat": "33.42778514749298",
                "source_long": "-111.94086034605269",
                "dest_lat": "33.415724035194486",
                "dest_long": "-111.79071508468012",
            },
            {
                "mode": "Bus",
                "waiting": 14,
                "time": 32,
                "source_lat": "33.41513448717671",
                "source_long": "-111.79032718215971",
                "dest_lat": "33.41739230625446",
                "dest_long": "-111.68422654266976",
            },
            {
                "mode": "CAB",
                "waiting": 5,
                "time": 17,
                "distance": 8,
                "cost": 12.86,
                "source_lat": "33.41739230625446",
                "source_long": "-111.68422654266976",
                "dest_lat": "33.306215432072534",
                "dest_long": "-111.67849161350222",
            }
        ]
    },
    {
        "preference": "red",
        "source_lat": "33.42778514749298",
        "source_long": "-111.94086034605269",
        "dest_lat": "33.306215432072534",
        "dest_long": "-111.67849161350222",
        "time": 28,
        "car_distance": 27,
        "cost": 60.86,
        "steps": [
            {
                "mode": "CAB",
                "waiting": 2,
                "time": 26,
                "source_lat": "33.42778514749298",
                "source_long": "-111.94086034605269",
                "dest_lat": "33.306215432072534",
                "dest_long": "-111.67849161350222",
            }
        ]
    }
]



transit_ways_50 = [
    {
        "preference": "green",
        "source_lat": "33.42778514749298",
        "source_long": "-111.94086034605269",
        "dest_lat": "33.306215432072534",
        "dest_long": "-111.67849161350222",
        "time": 50,
        "car_distance": 17,
        "cost": 34.86,
        "steps": [
            {
                "mode": "Train",
                "waiting": 1,
                "time": 26,
                "source_lat": "33.42778514749298",
                "source_long": "-111.94086034605269",
                "dest_lat": "33.415724035194486",
                "dest_long": "-111.79071508468012",
            },
            {
                "mode": "CAB",
                "waiting": 2,
                "time": 21,
                "distance": 8,
                "cost": 24.86,
                "source_lat": "33.415724035194486",
                "source_long": "-111.79071508468012",
                "dest_lat": "33.306215432072534",
                "dest_long": "-111.67849161350222",
            }
        ]
    },
    {
        "preference": "yellow",
        "source_lat": "33.42778514749298",
        "source_long": "-111.94086034605269",
        "dest_lat": "33.306215432072534",
        "dest_long": "-111.67849161350222",
        "time": 50,
        "car_distance": 17,
        "cost": 28.86,
        "steps": [
            {
                "mode": "Train",
                "waiting": 1,
                "time": 26,
                "source_lat": "33.42778514749298",
                "source_long": "-111.94086034605269",
                "dest_lat": "33.415724035194486",
                "dest_long": "-111.79071508468012",
            },
            {
                "mode": "CAB",
                "waiting": 2,
                "time": 21,
                "distance": 8,
                "cost": 24.86,
                "source_lat": "33.415724035194486",
                "source_long": "-111.79071508468012",
                "dest_lat": "33.306215432072534",
                "dest_long": "-111.67849161350222",
            }
        ]
    },
    {
        "preference": "red",
        "source_lat": "33.42778514749298",
        "source_long": "-111.94086034605269",
        "dest_lat": "33.306215432072534",
        "dest_long": "-111.67849161350222",
        "time": 28,
        "car_distance": 27,
        "cost": 60.86,
        "steps": [
            {
                "mode": "CAB",
                "waiting": 2,
                "time": 26,
                "source_lat": "33.42778514749298",
                "source_long": "-111.94086034605269",
                "dest_lat": "33.306215432072534",
                "dest_long": "-111.67849161350222",
            }
        ]
    }
]

transit_ways_120 = [
    {
        "preference": "yellow",
        "source_lat": "33.42778514749298",
        "source_long": "-111.94086034605269",
        "dest_lat": "33.306215432072534",
        "dest_long": "-111.67849161350222",
        "time": 120,
        "car_distance": 0,
        "cost": 4,
        "steps": [
            {
                "mode": "Train",
                "waiting": 1,
                "time": 26,
                "source_lat": "33.42778514749298",
                "source_long": "-111.94086034605269",
                "dest_lat": "33.415724035194486",
                "dest_long": "-111.79071508468012",
            },
            {
                "mode": "Bus",
                "waiting": 14,
                "time": 32,
                "source_lat": "33.41513448717671",
                "source_long": "-111.79032718215971",
                "dest_lat": "33.41739230625446",
                "dest_long": "-111.68422654266976",
            },
            {
                "mode": "Bus",
                "waiting": 17,
                "time": 30,
                "source_lat": "33.41739230625446",
                "source_long": "-111.68422654266976",
                "dest_lat": "33.306215432072534",
                "dest_long": "-111.67849161350222",
            }
        ]
    },
    {
        "preference": "green",
        "source_lat": "33.42778514749298",
        "source_long": "-111.94086034605269",
        "dest_lat": "33.306215432072534",
        "dest_long": "-111.67849161350222",
        "time": 120,
        "car_distance": 0,
        "cost": 10,
        "steps": [
            {
                "mode": "Train",
                "waiting": 1,
                "time": 26,
                "source_lat": "33.42778514749298",
                "source_long": "-111.94086034605269",
                "dest_lat": "33.415724035194486",
                "dest_long": "-111.79071508468012",
            },
            {
                "mode": "Bus",
                "waiting": 14,
                "time": 32,
                "source_lat": "33.41513448717671",
                "source_long": "-111.79032718215971",
                "dest_lat": "33.41739230625446",
                "dest_long": "-111.68422654266976",
            },
            {
                "mode": "Bus",
                "waiting": 17,
                "time": 30,
                "source_lat": "33.41739230625446",
                "source_long": "-111.68422654266976",
                "dest_lat": "33.306215432072534",
                "dest_long": "-111.67849161350222",
            }
        ]
    },
    {
        "preference": "red",
        "source_lat": "33.42778514749298",
        "source_long": "-111.94086034605269",
        "dest_lat": "33.306215432072534",
        "dest_long": "-111.67849161350222",
        "time": 28,
        "car_distance": 27,
        "cost": 60.86,
        "steps": [
            {
                "mode": "CAB",
                "waiting": 2,
                "time": 26,
                "source_lat": "33.42778514749298",
                "source_long": "-111.94086034605269",
                "dest_lat": "33.306215432072534",
                "dest_long": "-111.67849161350222",
            }
        ]
    }
]


def get_routes(from_lat, from_long, to_lat, to_long, arrival_time, departure_time):
    if arrival_time - departure_time >= 50 and arrival_time - departure_time < 95:
        updated_list = list(map(lambda entry: {**entry, **generate_id()}, transit_ways_50))
    elif arrival_time - departure_time >= 95 and arrival_time - departure_time < 120:
        updated_list = list(map(lambda entry: {**entry, **generate_id()}, transit_ways_100))
    elif arrival_time - departure_time >= 120:
        updated_list = list(map(lambda entry: {**entry, **generate_id()}, transit_ways_120))
    return success({"routes": updated_list})
