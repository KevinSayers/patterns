#!/bin/bash 
set -e 

for x in $(find . -maxdepth 1 -type d); do 
  (
      cd $x
      if [[ -f Makefile ]]; then
        make
      elif [[ -f main.nf ]]; then
        nextflow run main.nf 
      fi 
  )
done