from pathlib import Path
import shutil


def check_path(target_path, level=0):
    """"
    This function recursively prints all contents of a pathlib.Path object
    """
    def print_indented(folder, level):
        print('\t' * level + folder)

    print_indented(target_path.name, level)
    for file in target_path.iterdir():
        name = file.name
        if file.name[0] == '.':
            continue
        if file.is_dir():
            check_path(file, level+1)
        else:
            if '.out' in name or '.o' in name:
                print_indented(file.name, level+1)
                shutil.move(target_path, './bin')
            else:
                level += 1


my_path = Path(r'.')
check_path(my_path)
