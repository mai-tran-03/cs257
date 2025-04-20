'''
    cli.py
    Mai Tran
    04.16.2025
    
    NAME: cli.py - command-line interface exercise
    SYNOPSIS: python3 cli.py flags.data color
    DESCRIPTION: Show a list of all countries' flags containing the specified color string.
'''

import argparse
import csv

def get_parsed_args():
    parser = argparse.ArgumentParser(
        prog='cli.py - command-line interface exercise',
        usage='python3 cli.py flags.data color',
        description='Show a list of all countries\' flags containing the specified color string, case-insensitively.',
    )
    parser.add_argument('color', help='a color that you want to see on the countries\' flags')
    parsed_args = parser.parse_args()
    return parsed_args

def get_data():
    flags_with_color = {
        'red': [],      # 10
        'green': [],    # 11
        'blue': [],     # 12
        'gold': [],     # 13
        'white': [],    # 14
        'black': [],    # 15
        'orange': [],   # 16
    }
    
    with open('../data/flag.data') as data:
        flags = csv.reader(data)
        for flag in flags:
            if int(flag[10]):
                flags_with_color['red'].append(flag[0])
            if int(flag[11]):
                flags_with_color['green'].append(flag[0])
            if int(flag[12]):
                flags_with_color['blue'].append(flag[0])
            if int(flag[13]):
                flags_with_color['gold'].append(flag[0])
            if int(flag[14]):
                flags_with_color['white'].append(flag[0])
            if int(flag[15]):
                flags_with_color['black'].append(flag[0])
            if int(flag[16]):
                flags_with_color['orange'].append(flag[0])
    
    return flags_with_color

def main():
    arguments = get_parsed_args()
    countries = get_data()
    print(f'The following countries\' flags contain the color {arguments.color}:')
    print(countries[arguments.color])

if __name__ == '__main__':
    main()