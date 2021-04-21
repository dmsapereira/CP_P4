GENERATIONS="10"
N_RUNS="5"
diffCounter=0

make

for R in $(seq 1 $N_RUNS); do

  python board.py 50 1000 1000 > test.board
  ./glife 10 test.board > threadless.txt
  ./glife -t 10 test.board > threaded.txt

  if [ -n "$(diff -q threadless.txt threaded.txt)" ]; then
    echo "Files aren't identical"
    diffCounter++
  fi
done

if [ $diffCounter -ne 0 ]; then
  echo "$diffCounter files aren't the same"
else
  echo "All files are identical! Hooray!!!"
fi