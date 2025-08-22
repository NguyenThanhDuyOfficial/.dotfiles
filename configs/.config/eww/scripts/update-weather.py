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
        "code": str(current["weatherDesc"][0]["value"]),
        "temp": int(current["temp_C"]),
        "wind": int(current["windspeedKmph"]),
        "precipMM": float(current["precipMM"]),
    }

    forecast_data = []
    for day in data["weather"][:3]:
        date_str = datetime.strptime(day["date"], "%Y-%m-%d").strftime("%-d/%-m")
        hourly_data = []
        for hour in day["hourly"]:
            hourly_data.append({
                "icon": map_icon(hour["weatherCode"]),
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
    fetch_weather();
