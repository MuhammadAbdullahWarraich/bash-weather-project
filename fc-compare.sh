!#/bin/bash
tdDate=$(date +%Y%m%d)
fcTemp=$(tail -2 rx_poc.log | head -1 | cut -d " " -f6)