#!/bin/bash
#part one

first_name="Amal"
last_name="AbuHmoud"
tmp_dir="$HOME/amal/part1_exec"

#create directories and files
mkdir -p "$tmp_dir"
for i in {1..5}; 
do
    subdir="$tmp_dir/training_project_$i"
    mkdir -p "$subdir"
    
    for j in a b; 
    do
        file="$subdir/module_${i}_${j}.txt"
        echo "Hello $first_name $last_name welcome to file ${i}.${j^}" > "$file"
    done
done
