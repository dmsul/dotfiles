import os
import shutil
import glob
import subprocess

BACKUP_TS_PATH = r'h:\data\media\tvshows_ts\{show}'
BACKUP_mp4_PATH = r'h:\data\media\tvshows_mp4\{show}'
HTPC_PATH = r'\\ht-pc\d\media\tvshows\{show}'


SHOWS = ('Curious George', 'Nature Cat', 'Ready Jet Go!', 'Wild Kratts',
         'Peg + Cat',
         "Daniel Tiger's Neighborhood")


def main_ts_from_HT():
    """ Move `ts` files from HTPC to backup drive """
    for show in SHOWS:
        ht_files = glob.glob(
            os.path.join(
                HTPC_PATH.format(show=show),
                '*.ts')
        )
        backup_dest = BACKUP_TS_PATH.format(show=show)
        backup_files = glob.glob(os.path.join(backup_dest, '*.ts'))
        backup_files = [os.path.split(x)[1] for x in backup_files]
        for f_name in ht_files:
            filename = os.path.split(f_name)[1]
            if filename not in backup_files:
                print(f"Moving {filename} to {backup_dest} ...", end='',
                      flush=True)
                shutil.move(f_name, backup_dest)
                print('done.')


def main_ts_to_mp4():
    """ Encode `ts` to `mp4` when needed """
    for show in SHOWS:
        ts_files = glob.glob(
            os.path.join(
                BACKUP_TS_PATH.format(show=show),
                '*.ts')
        )
        mp4_dest = BACKUP_mp4_PATH.format(show=show)
        mp4_files = glob.glob(os.path.join(mp4_dest, '*.mp4'))
        mp4_files = [os.path.splitext(os.path.split(x)[1].lower())[0]
                     for x in mp4_files]
        for f_name in ts_files:
            filename = os.path.splitext(os.path.split(f_name)[1])[0]
            if filename.lower() not in mp4_files:
                print(f"{f_name}", flush=True)
                if 1:
                    dest_path = os.path.join(
                        mp4_dest, filename + '.mp4')
                    command_list = [
                        r'c:\Program Files\HandBrake\HandBrakeCLI.exe',
                        '--preset-import-gui',
                        '-Z', 'PegPlusCat',
                        '-i', f'{f_name}',
                        '-o', f'{dest_path}'
                    ]
                    # print(command_list)
                    subprocess.run(command_list)


def main_mp4_to_HT():
    """ Copy newly encoded `mp4` from backup to HTPC """
    for show in SHOWS:
        backup_files = glob.glob(
            os.path.join(
                BACKUP_mp4_PATH.format(show=show),
                '*.mp4')
        )
        mp4_dest = HTPC_PATH.format(show=show)
        ht_files = glob.glob(os.path.join(mp4_dest, '*.mp4'))
        ht_files = [os.path.split(x)[1] for x in ht_files]
        for f_name in backup_files:
            filename = os.path.split(f_name)[1]
            if filename not in ht_files:
                print(f"Copying {filename} to {mp4_dest} ...", end='',
                      flush=True)
                shutil.copy2(f_name, mp4_dest)
                print('done.')


if __name__ == "__main__":
    main_ts_from_HT()
    main_ts_to_mp4()
    main_mp4_to_HT()
