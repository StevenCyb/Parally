#!/bin/bash

while true; do
 date=$(date +"%N")
 echo Current date is $date
 echo "$date" > 'date.txt'
 sleep 1
done