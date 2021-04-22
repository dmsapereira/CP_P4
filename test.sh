GENERATIONS="10"
N_RUNS="5"
THREADLESS_OUT="threadless.txt"
THREADED_OUT="threaded.txt"

make

rm $THREADLESS_OUT $THREADED_OUT


for R in $(seq 1 $N_RUNS); do
  (/usr/bin/time -f '%E' ./glife -q $GENERATIONS tests/13.in) 2>> $THREADLESS_OUT > /dev/null
  (/usr/bin/time -f '%E' ./glife -t -q $GENERATIONS tests/13.in) 2>> $THREADED_OUT > /dev/null
done