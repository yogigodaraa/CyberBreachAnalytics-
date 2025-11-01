
#!/bin/bash

# check that two arguments have been provided
if [ "$#" -ne 2 ]; then
    echo "Usage: cyber_breaches <filename> <command>"
    exit 1
fi

# check that the file exists
if [ ! -f "$1" ]; then
    echo "Error: file  $1 does not exist"
    exit 1
fi

# parse the command
case $2 in
    maxstate)
        # find the state with the maximum number of incidents
        awk -F"\t" '{counts[$3]++} END {for (state in counts) print state, counts[state]}' "$1" | sort -k2nr | head -n1 | awk '{print "State with greatest number of incidents is: " $1 " with count " $2}'
        ;;
    maxyear)
        # find the year with the maximum number of incidents
        awk -F"\t" '{counts[$2]++} END {for (year in counts) print year, counts[year]}' "$1" | sort -k2nr | head -n1 | awk '{print "Year with greatest number of incidents is: " $1 " with count " $2}'
        ;;
    [A-Z][A-Z])
        # find the year with the maximum number of incidents for the specified state
        awk -F"\t" -v state="$2" '$3 == state {counts[$2]++} END {for (year in counts) print year, counts[year]}' "$1" | sort -k2nr | head -n1 | awk '{print "State with greatest number of incidents for " state " is in " $1 " with count " $2}'
        ;;
    [0-9][0-9][0-9][0-9])
        # find the state with the maximum number of incidents for the specified year
        awk -F"\t" -v year="$2" '$2 == year {counts[$3]++} END {for (state in counts) print state, counts[state]}' "$1" | sort -k2nr | head -n1 | awk '{print "Year with greatest number of incidents for " year " is in " $1 " with count " $2}'
        ;;
    *)
        # invalid command
        echo "Error: invalid command"
        exit 1
        ;;
esac