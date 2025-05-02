#!/bin/sh
# This script gets weather from openweathermap.com and stores the data locally
# adapted from Closebox73

# -- change below -- #
# get your city id at https://openweathermap.org/find and replace
city_id=4474388 
api_key=2346fa4d5f6c0ab93c816ece6193746a
unit=imperial
lang=en

# -- do not change -- #
url="api.openweathermap.org/data/2.5/weather?id=${city_id}&appid=${api_key}&cnt=5&units=${unit}&lang=${lang}"
curl -s ${url} -o ~/.cache/weather.json

# debug only
#curl ${url} 
