i=0
while read x
do
    if [[ $x != *a* && $x != *A* ]]
    then
        arr[$i]=$x
        i=$i+1
    fi
done
echo ${arr[@]}