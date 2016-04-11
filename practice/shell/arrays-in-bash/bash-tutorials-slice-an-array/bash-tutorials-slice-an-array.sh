i=0
while read x
do
    arr[$i]=$x
    i=$i+1
done
echo ${arr[@]:3:5}
