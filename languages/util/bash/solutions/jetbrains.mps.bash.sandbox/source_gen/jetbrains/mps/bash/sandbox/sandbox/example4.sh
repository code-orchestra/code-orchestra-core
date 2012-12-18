#!/bin/sh


echo "Primes Example"

for ((I=1; ${I} < 100; I++)); do
  T=1
  for ((J=2; ${J} < ${I}; J++)); do
    if ((${I} % ${J} == 0)); then
      T=0
      break
    fi
    if ((${T} == 1)); then
      echo ${I}
    fi
  done
done



