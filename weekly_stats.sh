!#/bin/bash
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-LX0117EN-Coursera/labs/synthetic_historical_fc_accuracy.tsv
declare -a weekly_stats_array
days=7
for (( i=2; i<=$(( $days+1 )); i++ )) ; do
line=`head -$i ./synthetic_historical_fc_accuracy.tsv | tail -1`
weekly_stats_array+=$line
done
echo ${weekly_stats_array[@]}
for row in ${weekly_stats_array[@]} ; do
echo $row
done
for i in ${!weekly_stats_array[@]} ; do
#make all errors positive using a conditional
if [[ ${weekly_stats_array[$i]} < 0 ]] ; then
${weekly_stats_array[$i]}=`${weekly_stats_array[$i]}*-1`
fi
done
min=${weekly_stats_array[0]}
max=${weekly_stats_array[0]}
for item in ${weekly_stats_array[@]} ; do
if [[ $item < $min ]] ; then
min=$item
fi 
if [[ $item > $max ]] ; then 
max=$item
fi
done 

echo "minimum absolute error: $min"
echo "maximum absolute error: $max"