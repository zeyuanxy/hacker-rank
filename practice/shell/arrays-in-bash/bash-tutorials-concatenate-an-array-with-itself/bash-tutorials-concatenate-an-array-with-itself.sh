i=0
while read x
do
    arr[$i]=$x
    i=$i+1
done
new_arr=(${arr[@]} ${arr[@]} ${arr[@]})
echo ${new_arr[@]}