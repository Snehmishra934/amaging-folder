#!/bin/bash

read -p "Enter birthdate (YYYY-MM-DD): " birthdate

if ! date -d "$birthdate" +%Y-%m-%d >/dev/null 2>&1; then
    echo "Invalid date format. Use YYYY-MM-DD."
    exit 1
fi

current_sec=$(date +%s)
birth_sec=$(date -d "$birthdate" +%s)

if (( birth_sec > current_sec )); then
    echo "Error: Future date entered."
    exit 1
fi

IFS='-' read -r b_year b_month b_day <<< "$birthdate"

current_year=$(date +%Y)
current_month=$(date +%m)
current_day=$(date +%d)

age=$((current_year - b_year))

if (( 10#$current_month < 10#$b_month )) || \
   (( 10#$current_month == 10#$b_month && 10#$current_day < 10#$b_day )); then
    ((age--))
fi

echo "Age: $age"
