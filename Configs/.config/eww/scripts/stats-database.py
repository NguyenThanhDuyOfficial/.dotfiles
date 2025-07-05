#!/usr/bin/env python

import sqlite3




conn.commit()


def update():



def init():
    conn = sqlite3.connect(stats-database.db)
    cursor = conn.cursor()

    cursor.excecute('''
        CREATE TABLE IF NOT EXISTS stats (
            work_time_week INTERGER,
            work_time_all INTERGER,

            last_updated_time INTERGER,
        );
    ''')

def main():
    init()

    ## when i poweroff my system, it automatically run update, to update worktime ? 
    # if that game state, it will not run, so what that mean?
    # i need to write a script that know , i game or not, but it will be hard,
    # does i need to change technique?
    # the technique will change, i need to be on work state, that mean
    # 1. i need a widget that tell me how many time i work, it's TimeTrack
    # 2.  When i on work state, the time will run, if i out work state, it will update()
    # 3. When i suddenly poweroff, it will check i on work state or not, then close timetrack and update()
    #
    # 4.Update only update work_time_week and work_time_all on database ? Does i need to change name?
    # 
    # 5. About get ? I need a function that get work_time_week , work_time_all, last_updated_time for my widget in EWW 
    #
    # And That Done, Good Job Ken

if __name__ == '__main__':
    main()






