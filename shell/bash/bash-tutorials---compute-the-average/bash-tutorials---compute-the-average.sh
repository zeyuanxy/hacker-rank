read x
sum=0
for ((i = 0; i < $x; ++i))
do
    read a;
    sum=$(($sum+$a))
done
printf "%.3f\n" `echo "$sum / $x" | bc -l`
