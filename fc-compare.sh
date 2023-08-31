!#/bin/bash
current_time=$(TZ='Morocco/Casablanca' date)
fcTemp=$(tail -2 rx_poc.log | head -1 | cut -d " " -f6)
acTemp=$(tail -1 rx_poc.log | cut -d " " -f5)