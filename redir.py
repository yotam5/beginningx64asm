from pathlib import Path
import shutil
import os


def check_path(target_path, level=0):
    """"
    This function recursively prints all contents of a pathlib.Path object
    """
    def print_indented(folder, level):
        print('\t' * level + folder)

    print_indented(target_path.name, level)
    for file in target_path.iterdir():
        name = file.name
        if file.name[0] == '.' or 'bin' in file.name:
            continue
        if file.is_dir():
            check_path(file, level+1)
        else:
            file_path = f'{target_path}/{file.name}'
            a = '.o' in name
            b = '.out' in name
            c = os.access(f'{file_path}', os.X_OK)
            if ((a or b) or c):
                print_indented(file.name, level+1)
                try:
                    shutil.move(f'{file_path}', './bin')
                except Exception as e:
                    print(e)
            


my_path = Path(r'.')
check_path(my_path)
