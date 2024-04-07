import secrets
import string
import json
from myapp.responses import success, bad_request, internal_server_error


def generate_id(length=13):
    alphanumeric = string.ascii_letters + string.digits
    return {"id": ''.join(secrets.choice(alphanumeric) for _ in range(length))}


id = generate_id()

# Create your models here.
transit_ways = [
    {
        "preference": "yellow",
        "source_lat": "33.428120",
        "source_long": "-111.940400",
        "dest_lat": "31.565599",
        "dest_long": "-110.249184",
        "time": 125,
        "car_distance": 27,
        "cost": 4,
        "steps": [
            {
                "mode": "Train",
                "waiting": 1,
                "time": 26,
                "source_lat": "33.428120",
                "source_long": "-111.940400",
                "dest_lat": "33.4153",
                "dest_long": "-111.8308",
            },
            {
                "mode": "Bus",
                "waiting": 14,
                "time": 32,
                "source_lat": "33.4153",
                "source_long": "-111.8308",
                "dest_lat": "33.416892125662095",
                "dest_long": "-111.68444429325882",
            },
            {
                "mode": "Bus",
                "waiting": 21,
                "time": 30,
                "source_lat": "33.416892125662095",
                "source_long": "-111.8308",
                "dest_lat": "33.30619747231763",
                "dest_long": "-111.67856672024699",
            }
        ]
    },
    {
        "preference": "green",
        "source_lat": "33.428120",
        "source_long": "-111.940400",
        "dest_lat": "31.565599",
        "dest_long": "-110.249184",
        "time": 74,
        "car_distance": 27,
        "cost": 28.86,
        "steps": [
            {
                "mode": "Train",
                "waiting": 1,
                "time": 26,
                "source_lat": "33.428120",
                "source_long": "-111.940400",
                "dest_lat": "33.4153",
                "dest_long": "-111.8308",
            },
            {
                "mode": "CAB",
                "waiting": 0,
                "time": 16,
                "distance": 12.2,
                "cost": 24.86,
                "source_lat": "33.416892125662095",
                "source_long": "-111.8308",
                "dest_lat": "33.30619747231763",
                "dest_long": "-111.67856672024699",
            }
        ]
    },
    {
        "preference": "red",
        "source_lat": "33.428120",
        "source_long": "-111.940400",
        "dest_lat": "31.565599",
        "dest_long": "-110.249184",
        "time": 21,
        "car_distance": 27,
        "cost": 60.86,
        "steps": [
            {
                "mode": "CAB",
                "waiting": 1,
                "time": 26,
                "source_lat": "33.428120",
                "source_long": "-111.940400",
                "dest_lat": "33.30619747231763",
                "dest_long": "-111.67856672024699",
            }
        ]
    }
]


def get_routes(from_lat, from_long, to_lat, to_long):
    updated_list = list(map(lambda entry: {**entry, **generate_id()}, transit_ways))
    return success({"routes": updated_list})
