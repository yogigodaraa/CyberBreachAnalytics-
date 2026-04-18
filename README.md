# CyberBreachAnalytics

Shell-based data analysis of historical healthcare-sector cyber breach data. Academic assignment — no package manager, no dependencies, just Bash, awk, and a TSV dataset.

## What it does

Three shell scripts that each answer a question about breach trends:

- **`cyber_breaches.sh`** — query the maximum breach incidents by US state or by year; supports state-specific or year-specific filtering.
- **`preprocess.sh`** — clean and normalize raw TSV data: extracts month and year fields, converts two-digit to four-digit years.
- **`breaches_per_month.sh`** — compute median and median absolute deviation (MAD) of breach counts per month to detect anomalies.

Together they answer: "do breach characteristics change over time, and which states / months are outliers?"

## Tech stack

- Bash
- Standard Unix tools (awk, sort, uniq, cut)
- TSV input files

## Getting started

```bash
chmod +x *.sh
./preprocess.sh                     # produces cleaned.tsv
./cyber_breaches.sh state CA        # max breaches for California
./cyber_breaches.sh year 2019       # max breaches for 2019
./breaches_per_month.sh             # median + MAD across months
```

## Project structure

```
*.sh                                Shell scripts (one per analysis)
Cyber_Security_Breaches_clean.tsv   Input dataset
Cyber_Security_Breaches_noym.tsv    Alternate input
cleaned.tsv, three.tsv              Intermediate outputs
breaches_per_month/                 Per-month outputs
compare, dummy                      Utility scripts / scratch
```

## Status

Academic assignment (student ID 23871801 referenced in sources). Complete for the assignment brief; not maintained.
