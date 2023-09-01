# !#/bin/bash
# touch s-week-stats.txt
# #rm synthetic_historical_fc_accuracy.tsv
# #wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-LX0117EN-Coursera/labs/synthetic_historical_fc_accuracy.tsv
# days=8
# cat ./synthetic_historical_fc_accuracy.tsv | tail -$days | cut -f6 > s-week-stats.txt
# weekly_stats_array=$(echo $(cat ./s-week-stats.txt))
# for row in ${weekly_stats_array[@]} ; do
# echo $row
# done
# for i in {0..6}; do
# #make all errors positive using a conditional
# if [[ ${weekly_stats_array[$i]} < 0 ]] ; then
# weekly_stats_array[$i]=`(-1)*weekly_stats_array[$i]`
# echo $weekly_stats_array[$i]
# fi
# done
# min=$(${weekly_stats_array[1]})
# max=$(${weekly_stats_array[1]})
# echo $min
# for item in ${weekly_stats_array[@]} ; do
# echo $item
# if [[ $item < $min ]] ; then
# min=$item
# echo $item
# fi 
# if [[ $item > $max ]] ; then
# max=$item
# fi
# done 

# echo "minimum absolute error: $min"
# echo "maximum absolute error: $max"

#!/bin/bash
rm synthetic_historical_fc_accuracy.tsv
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-LX0117EN-Coursera/labs/synthetic_historical_fc_accuracy.tsv

echo $(tail -7 synthetic_historical_fc_accuracy.tsv  | cut -f6) > s-week-stats.txt

week_fc=($(echo $(cat s-week-stats.txt)))

# validate result:
for i in {0..6}; do
    echo ${week_fc[$i]}
done

for i in {0..6}; do
  if [[ ${week_fc[$i]} < 0 ]]
  then
    week_fc[$i]=$(((-1)*week_fc[$i]))
  fi
  # validate result:
  echo ${week_fc[$i]}
done

minimum=${week_fc[1]}
maximum=${week_fc[1]}
for item in ${week_fc[@]}; do
   if [[ $minimum > $item ]]
   then
     minimum=$item
   fi
   if [[ $maximum < $item ]]
   then
     maximum=$item
   fi
done

echo "minimum ebsolute error = $minimum"
echo "maximum absolute error = $maximum"