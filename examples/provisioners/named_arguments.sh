#!/bin/bash

while getopts "a:bc:" OPT
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
    ?)
      echo "Bad argument ${OPT}"
      ;;
  esac
done
