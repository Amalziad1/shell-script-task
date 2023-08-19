#!/bin/bash
#part 3

display_help() {
    echo "Usage: $0 [OPTIONS]"
    echo "  -f   First name"
    echo "  -l   Last name"
    echo "  -cap Capitalize the first letter of the first and last name"
    echo "  -h   Display this help message"
    exit 1
}

#parsing command-line arguments
capitalize=false
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -f) first_name="$2"; shift ;;
        -l) last_name="$2"; shift ;;
        -cap) capitalize=true ;;
        -h) display_help ;;
        *) echo "Unknown parameter passed: $1"; display_help ;;
    esac
    shift
done

#capitalize the first letter of the names if needed
if [ "$capitalize"=true ]; then
    first_name="$(tr '[:lower:]' '[:upper:]' <<< ${first_name:0:1})${first_name:1}"
    last_name="$(tr '[:lower:]' '[:upper:]' <<< ${last_name:0:1})${last_name:1}"
fi


tmp_dir="$HOME/amal/part3_exec"

#create directories and files
mkdir -p "$tmp_dir"
for i in {1..5}; do
    subdir="$tmp_dir/training_project_$i"
    mkdir -p "$subdir"
    
    for j in a b; do
        file="$subdir/module_${i}_${j}.txt"
        echo "Hello $first_name $last_name welcome to file ${i}.${j^}" > "$file"
    done
done