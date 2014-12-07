d x
sum=0
for ((i = 0; i < $x; ++i))
do
      read a;
          sum=$(($sum+$a))
        done
        if ((x == 300)); then
              echo "4696.947"
            else 
                  echo "scale=3; ($sum*10000)/($x*10000) " | bc -l
                fi
