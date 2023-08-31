!#/bin/bash
current_time=$(TZ='Morocco/Casablanca' date)
day=$(echo $current_time | cut -d " " -f5)
month=$(echo $current_time | cut -d " " -f4)
year=$(echo $current_time | cut -d " " -f3)
tempDiff=$(($fcTemp-$acTemp))
fcTemp=$(tail -2 rx_poc.log | head -1 | cut -d " " -f6)
acTemp=$(tail -1 rx_poc.log | cut -d " " -f5)