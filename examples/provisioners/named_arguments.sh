#!/bin/bash

while getopts "a:bc:d" OPT
do
  case $OPT in
    a)
      echo "Argument a is set to: ${OPTARG}"
      ;;
    b)
      echo "Argument b is set"
      ;;
    c)
      echo "Argument c is set to: ${OPTARG}"
      ;;
    d)
      echo "Argument d is set"
      ;;
    ?)
      echo "Bad argument ${OPT}"
      ;;
  esac
done
