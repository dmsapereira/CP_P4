#!/bin/bash

GENERATIONS="10"
N_RUNS="5"
THREADLESS_OUT="threadless_output.txt"
THREADED_OUT="threaded_output.txt"
diffCounter=0

make

for R in $(seq 1 $N_RUNS); do

  python board.py 50 1000 1000 > test.board
  ./glife 10 test.board > $THREADLESS_OUT
  ./glife -t 10 test.board > $THREADED_OUT

  if [ -n "$(diff -q $THREADLESS_OUT $THREADED_OUT)" ]; then
    echo "Files aren't identical"
    diffCounter++
  fi
done

if [ $diffCounter -ne 0 ]; then
  echo "$diffCounter files aren't the same"
else
  echo "All files are identical! Hooray!!!"
fi