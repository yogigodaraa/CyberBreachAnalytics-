#!/usr/bin/env bash

#breaches_per_month

# Name: Yogender
# Student ID: 23871801

#This program named breaches_per_month will calculate the median and mad for breaches across 12 months to see "Is the nature of the breaches changing over the time"

# Check if file argument is provided
if [ -z "$1" ]; then
  echo "Please provide the data file as an argument." >&2
  exit 1
fi

# Check if file exists
if [ ! -f "$1" ]; then
  echo "File not found." >&2
  exit 1
fi

# Define month names
month_names=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")

# Read the data file and calculate the total incidents per month
incidents_per_month=$(tail -n +2 "$1" | \
    awk -v months="${month_names[*]}" 'BEGIN{
      FS=OFS="\t"
    }
    {
      count[$6]++
    }
    END{
      for (month in count) 
        print month, count[month]
    }' | sort -k1,1n)

# Calculate median and MAD accordingly
median=$(echo "$incidents_per_month" | awk '{
      values[NR] = $2
    }
    END{
      if (NR > 0) {
        n = asort(values)
        if (n % 2 == 0) 
          print (values[n/2] + values[n/2 + 1]) / 2
        else print values[(n + 1) / 2]
      }
    }')

mad=$(echo "$incidents_per_month" | awk -v median="$median" '{
      values[NR] = $2
      diff[NR] = ($2 > median) ? $2 - median : median - $2
    }
    END{
      if (NR > 0) {
        n = asort(diff)
        if (n % 2 == 0) 
          print (diff[n/2] + diff[n/2 + 1]) / 2
        else print diff[(n + 1) / 2]
      }
    }')

# Print the median and MAD and return the table of Months and Incidents respectively
echo "Median: $median"
echo "MAD: $mad"
echo "Month     Incidents"
echo "$incidents_per_month" | awk -v median="$median" -v mad="$mad" -v months="${month_names[*]}" '{
      split(months, month_array, " ")
      flag = ($2 < median-mad) ? " --" : ($2 > median+mad) ? " ++" : ""
      printf "%s %8d%s\n", month_array[$1], $2, flag
    }'

