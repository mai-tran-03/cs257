'''
    cli.py
    Mai Tran
    04.16.2025
    
    NAME: cli.py - command-line interface exercise
    SYNOPSIS: python3 cli.py flags.data color
    DESCRIPTION: Show a list of all countries' flags containing the specified color string, case-insensitively.
'''

import argparse

def get_parsed_args():
    parser = argparse.ArgumentParser(
        prog='cli.py - command-line interface exercise',
        usage='python3 cli.py flags.data color',
        description='Show a list of all countries\' flags containing the specified color string, case-insensitively.',
    )
    parser.add_argument('color', help='a color that you want to see on the countries\' flags')
    parsed_args = parser.parse_args()
    return parsed_args

def main():
    arguments = get_parsed_args()
    print(f'arguments: {arguments}')

if __name__ == '__main__':
    main()