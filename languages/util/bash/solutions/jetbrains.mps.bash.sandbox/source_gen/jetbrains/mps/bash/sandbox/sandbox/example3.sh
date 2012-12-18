#!/bin/sh


for P in "${@}"; do
  IFS=:
  for D in ${PATH}; do
    for F in ${D}/${P}; do
      [ -x "${F}" ] && echo ${F}
    done
  done
done

