'''
    cli.py
    Mai Tran
    04.16.2025
    
    NAME: cli.py - command-line interface exercise
    SYNOPSIS: python3 cli.py flags.data color
    DESCRIPTION: Show a list of all countries' flags containing the specified color string, case-insensitively.
'''

import argparse
import csv

def get_parsed_args():
    parser = argparse.ArgumentParser(
        prog='cli.py - command-line interface exercise',
        usage='python3 cli.py flags.data color',
        description='Show a list of all countries\' flags containing the specified color string, case-insensitively.',
    )
    # parser.add_argument('flags.data', help='a dataset of attributes of countries\' flags')
    parser.add_argument('color', help='a color that you want to see on the countries\' flags')
    parsed_args = parser.parse_args()
    return parsed_args

def get_data():
    countries_with_color = []
    
    with open('../data/flag.data') as data:
        countries = csv.reader(data)
        for country in countries:
            country_color = country[10]
            if country_color:
                countries_with_color.append(country[0])
    
    return countries_with_color

def main():
    arguments = get_parsed_args()
    countries = get_data()
    print(f'The following countries contain the color {arguments.color} on their flags:')
    print(*countries, sep='\n') # print each arg on new line

if __name__ == '__main__':
    main()