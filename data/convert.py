import sys
import re
import csv

def main(input_file_name):
    # countries_flags is a list of lists where each list is a country with
    # a list of all its attributes
    countries_flags = []
    # languages_countries is a list of tuples with country code and all of its
    # language codes
    languages_countries = []

    with open(input_file_name) as f:
        reader = csv.reader(f)
        headers = next(reader) # skip first row
        
        for row in reader:
            # if missing the tld, do not continue!
            if row[headers.index("country_code")] not in countries_flags:
                country_flag = []
                for i, header in enumerate(headers):
                    
                    # don't add languages column to countries_flags:
                    if header == "languages":
                        continue

                    # if the integers have any commas then get rid of them so
                    # that it will remain and int, with regex!!
                    if header == "population" or header == "area":
                        row[i] = re.sub(",", "", row[i])

                    country_flag.append(row[i]) if row[i] else 'NULL'

                # get the languages string and split it into a list
                langs = row[headers.index("languages")].split(", ")

                for l in langs:
                    languages_countries.append((country_flag[0], l))
                countries_flags.append(country_flag)


    with open('countries_flags.csv', 'w') as f:
        writer = csv.writer(f)
        # country is a dictionary with all
        for country in countries_flags:
            row = country
            writer.writerow(row)

    with open('languages_countries.csv', 'w') as f:
        writer = csv.writer(f)
        for lang_country in languages_countries:
            writer.writerow(lang_country)
    

if len(sys.argv) != 2:
    print(f'Usage: {sys.argv[0]} original_csv_file', file=sys.stderr)
    exit()

main(sys.argv[1])