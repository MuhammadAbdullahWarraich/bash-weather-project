#!/bin/bash
no_of_lines=$( $(wc -l rx_poc.log | cut -d " " -f1 )
touch historical_fc_accuracy.tsv
echo "year\tmonth\tday\tobs_tmp\tfc_temp\taccuracy\taccuracy_range" > historical_fc_accuracy.tsv
for (( i=$(( no_of_lines-1 )); i>1; i-- )) ; do
current=$(( $no_of_lines-$i ))
row=$(tail -$current rx_poc.log)
day=$(echo $row | cut -d " " -f3)
month=$(echo $row | cut -d " " -f2)
year=$(echo $row | cut -d " " -f1)

fcTemp=$(tail -$(( $current+1 )) rx_poc.log | head -1 | cut -d " " -f6)
acTemp=$(tail -$current rx_poc.log | cut -d " " -f5)
tempDiff=$(($fcTemp-$acTemp))
accuracyRangeLabel=""
if (( $(echo "$tempDiff<=1.0") | bc )) && (( $(echo "$tempDiff>=-1.0" | bc) )) ; then
accuracyRangeLabel="excellent"
elif (( $(echo "$tempDiff<=2.0" | bc) )) && (( $(echo "$tempDiff>=-2.0" | bc) )) ; then
accuracyRangeLabel="good"
elif (( $(echo "$tempDiff<=3.0" | bc) )) && (( $(echo "$tempDiff>=-3.0" | bc) )); then
accuracyRangeLabel="fair"
else
accuracyRangeLabel="poor"
fi
echo "$year\t$month\t$day\t$acTemp\t$tempDiff\t$accuracyRangeLabel" >> ./historical_fc_accuracy.tsv
done
