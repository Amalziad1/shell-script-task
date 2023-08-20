#!/bin/bash

printError() {
    echo "Error: variables from environment are not set"
    exit 1
}
# Variables from environment
first_name="$FIRST_NAME"
last_name="$LAST_NAME"
tmp_dir="$HOME/amal/part2_exec"

# Create directories and files
mkdir -p "$tmp_dir"
for i in {1..5}; do
    subdir="$tmp_dir/training_project_$i"
    mkdir -p "$subdir"
    if [ $first_name="" ]
    then
   	printError
    elif [ $last_name="" ]
    then 
    	printError
    fi
    for j in a b; do
        file="$subdir/module_${i}_${j}.txt"
        echo "Hello $first_name $last_name welcome to file ${i}.${j^}" > "$file"
    done
done
