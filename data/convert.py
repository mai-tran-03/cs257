import sys
import csv

def main(input_file_name):
    with open(input_file_name) as f:
        reader = csv.reader(f)
        headers = next(reader) # skip first row
        countries_flags = []
        
        for row in reader:
            if row[0] not in countries_flags:
                country_flag = {}
                for i, header in enumerate(headers):
                    country_flag[header] = row[i] if row[i] else 'NULL'
            countries_flags.append(country_flag)
    print(countries_flags)
    

if len(sys.argv) != 2:
    print(f'Usage: {sys.argv[0]} original_csv_file', file=sys.stderr)
    exit()

main(sys.argv[1])