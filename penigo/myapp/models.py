from django.db import models

# Create your models here.
transit_ways = [
    {
        "source": "222S Mill Ave Tempe, AZ",
        "destination": "Arizona State University Polytechnic Campus",
        "time": 125,
        "car_distance": 27,
        "steps": [
            {
                "mode": "Train",
                "waiting": 1,
                "time": 26,
                "start_point": "Mill Ave/3rd St",
                "end_point": "Center/ Main St"
            },
            {
                "mode": "Bus",
                "waiting": 14,
                "time": 32,
                "start_point": "Center/ Main St",
                "end_point": "Power Rd & Main St"
            },
            {
                "mode": "Bus",
                "waiting": 21,
                "time": 30,
                "start_point": "Power Rd & Main St",
                "end_point": "Arizona State University Polytechnic Campus"
            }
        ]
    }
]
cab_cost = [
    {
        "start_point": "222S Mill Ave Tempe, AZ",
        "end_point": "Center/ Main St",
        "waiting": 0,
        "time": 19,
        "distance": 7.1,
        "cost": 15.4
    },
    {
        "start_point": "Center/ Main St",
        "end_point": "Power Rd & Main St",
        "waiting": 0,
        "time": 18,
        "distance": 8.4,
        "cost": 27.92
    },
    {
        "start_point": "Power Rd & Main St",
        "end_point": "Arizona State University Polytechnic Campus",
        "waiting": 0,
        "time": 16,
        "distance": 12.2,
        "cost": 14.98
    },
    {
        "start_point": "222S Mill Ave Tempe, AZ",
        "end_point": "Power Rd & Main St",
        "waiting": 0,
        "time": 29,
        "distance": 19.8,
        "cost": 30.31
    },
    {
        "start_point": "222S Mill Ave Tempe, AZ",
        "end_point": "Arizona State University Polytechnic Campus",
        "waiting": 0,
        "time": 32,
        "distance": 26.7,
        "cost": 40.93
    },
    {
        "start_point": "Center/ Main St",
        "end_point": "Arizona State University Polytechnic Campus",
        "waiting": 0,
        "time": 24,
        "distance": 19.9,
        "cost": 24.7
    },
]


def get_cost_time(steps):
    return sum(entry['cost'] for entry in steps), sum(entry['time'] + entry['waiting'] for entry in steps)


def optimize_ways(public_ways, start_time, end_time):
    for step: public_ways[0]['steps']


def get_routes(from_location, to_location, start_time, end_time):
    public_ways = list(
        filter(lambda entry: entry['source'] == from_location and entry['destination'] == to_location, transit_ways))
    optimize_ways(public_ways, start_time, end_time)
