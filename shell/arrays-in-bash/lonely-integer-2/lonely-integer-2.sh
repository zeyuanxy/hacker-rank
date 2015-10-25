read x
read -a arr
ans=0
for i in "${arr[@]}"
do
    ans=$(($ans ^ $i))
done
echo $ans