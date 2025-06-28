#!/usr/bin/env python

import json
from datetime import datetime
import subprocess
import os
import requests


def map_icon(code):
    icon_map = {
        "113": "",
        "116": "󰖕",
        "119": "󰖐",
        "122": "",
        "143": "",
        "176": "",
        "179": "",
        "182": "",
        "185": "",
        "200": "",
        "227": "",
        "230": "",
        "248": "",
        "260": "",
        "263": "",
        "266": "",
        "281": "",
        "284": "",
        "293": "",
        "296": "",
        "299": "",
        "302": "",
        "305": "",
        "308": "",
        "311": "",
        "314": "",
        "317": "",
        "320": "",
        "323": "",
        "326": "",
        "329": "",
        "332": "",
        "335": "",
        "338": "",
        "350": "",
        "353": "",
        "356": "",
        "359": "",
        "362": "",
        "365": "",
        "368": "",
        "371": "",
        "374": "",
        "377": "",
        "386": "",
        "389": "",
        "392": "",
        "395": "",
    }
    return icon_map.get(code, "")

def fetch_weather():

    lat_lon = os.getenv('LAT_LON')
    url = f"https://wttr.in/{lat_lon}?format=j1"
    response = requests.get(url)
    data = response.json()
    current = data["current_condition"][0]
    current_data = {
        "icon": map_icon(current["weatherCode"]),
        "temp": int(current["temp_C"]),
        "wind": int(current["windspeedKmph"]),
        "precipMM": float(current["precipMM"]),
    }

    forecast_data = []
    for day in data["weather"][:3]:
        date_str = datetime.strptime(day["date"], "%Y-%m-%d").strftime("%-d/%-m")
        hourly_data = []
        for i, hour in enumerate(day["hourly"]):
            name = f"{i*3}-{(i+1)*3}"
            hourly_data.append({
                "name": name,
                "temp": int(hour["tempC"]),
                "wind": int(hour["windspeedKmph"]),
                "precipMM": float(hour["precipMM"]),
            })
        forecast_data.append({
            "date": date_str,
            "data": hourly_data
        })

    result = [current_data] + forecast_data
    json_string = json.dumps(result)
    subprocess.run(["eww", "update", f"weather={json_string}"])

if __name__ == "__main__":
    weather_data = [
        {
        "current": {"icon": "󰖨", "temp": 27, "wind": 11, "precipMM": 0.0},
        },
        {
            "date": "16/6",
            "data": [
                {"name": "0-3", "temp": 19, "wind": 10, "precipMM": 0.0},
                {"name": "3-6", "temp": 18, "wind": 7, "precipMM": 0.0},
                {"name": "6-9", "temp": 16, "wind": 6, "precipMM": 0.0},
                {"name": "9-12", "temp": 20, "wind": 9, "precipMM": 0.0},
                {"name": "12-15", "temp": 26, "wind": 10, "precipMM": 0.0},
                {"name": "15-18", "temp": 30, "wind": 10, "precipMM": 0.0},
                {"name": "18-21", "temp": 28, "wind": 11, "precipMM": 0.0},
                {"name": "21-24", "temp": 24, "wind": 10, "precipMM": 0.0}
            ]
        },
        {
            "date": "17/6",
            "data": [
                {"name": "0-3", "temp": 20, "wind": 8, "precipMM": 0.0},
                {"name": "3-6", "temp": 20, "wind": 3, "precipMM": 0.0},
                {"name": "6-9", "temp": 19, "wind": 6, "precipMM": 0.0},
                {"name": "9-12", "temp": 24, "wind": 14, "precipMM": 0.0},
                {"name": "12-15", "temp": 28, "wind": 17, "precipMM": 0.0},
                {"name": "15-18", "temp": 31, "wind": 19, "precipMM": 0.0},
                {"name": "18-21", "temp": 30, "wind": 21, "precipMM": 0.0},
                {"name": "21-24", "temp": 28, "wind": 10, "precipMM": 0.0}
            ]
        },
        {
            "date": "18/6",
            "data": [
                {"name": "0-3", "temp": 25, "wind": 8, "precipMM": 0.0},
                {"name": "3-6", "temp": 24, "wind": 9, "precipMM": 1.8},
                {"name": "6-9", "temp": 23, "wind": 10, "precipMM": 1.8},
                {"name": "9-12", "temp": 25, "wind": 13, "precipMM": 0.0},
                {"name": "12-15", "temp": 28, "wind": 16, "precipMM": 0.0},
                {"name": "15-18", "temp": 30, "wind": 13, "precipMM": 0.0},
                {"name": "18-21", "temp": 29, "wind": 19, "precipMM": 0.0},
                {"name": "21-24", "temp": 26, "wind": 24, "precipMM": 0.0}
            ]
        }
    ]
    fetch_weather();
