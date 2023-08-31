!#/bin/bash
tdDate=$(date +%Y%m%d)
fcYesterday=$(tail -2 rx_poc.log | head -1 | cut -d " " -f5)