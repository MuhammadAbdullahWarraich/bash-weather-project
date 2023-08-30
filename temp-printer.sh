#!/bin/bash
touch rx_poc.log
today=$(date +%Y%m%d)
weather report='raw_date'+$today
echo $weather_report
city=Casablanca
curl wttr.in/$city --output $weather_report
grep C $weather_report > temperatures.txt
obs_tmp=$(cat -A temperatures.txt | head -2 | tail -1 | cut -d "+" -f2 | cut -d "^" -f1)
echo "observed temperature = $obs_tmp"
fc_tmp=$(cat -A temperatures.txt | head -4 | tail -1 | cut -d "+" -f2 | cut -d "^"-f1)
echo "tomorrow's noon forecast is: $fc_tmp"
current_time=$(TZ='Morocco/Casablanca' date)
echo $current_time
hour=$(echo $current_time | cut -d " " -f4 | cut -d ":" -f1)
echo $hour
day=$(echo $current_time | cut -d " "-f3)
month=`echo $current_time | cut -d " " -f2`
year=$(echo $current_time | cut -d " " -f6)
echo $month
echo "$year\t$month\t$day\t$obs_tmp\t$fc_tmp" >> rx_poc.log
