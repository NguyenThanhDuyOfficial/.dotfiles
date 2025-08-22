#!/usr/bin/env python

from datetime import datetime
import sqlite3
import os
import subprocess
import argparse

DB_PATH = "../database/stats_database.db"



def update_last_updated(cursor):
    today = datetime.today().strftime('%Y-%m-%d')
    cursor.execute("UPDATE stats SET last_updated = ?", (today,))


def update_time(cursor):
    if os.path.exists("/tmp/eww_timer_min"):
        with open("/tmp/eww_timer_min", "r") as f:
            timer_min = int(f.read().strip())
            timer_hour = timer_min / 60

            cursor.execute(f"SELECT COUNT(*) FROM stats")
            exists = cursor.fetchone()[0] > 0

            if exists:
                cursor.execute("UPDATE stats SET week = week + ?", (timer_hour,))
                cursor.execute("UPDATE stats SET month = month + ?", (timer_hour,))
                cursor.execute("UPDATE stats SET total = total + ?", (timer_hour,))
            else:
                cursor.execute("INSERT INTO stats (week, month, total) VALUES (?,?,?)", (timer_hour, timer_hour, timer_hour))



def get(cursor):
    cursor.execute("SELECT * FROM stats")
    rows = cursor.fetchall()
    print("Fetched rows:", rows)
    for week, month, total, last_updated in rows:
        subprocess.run(["eww", "update", f"stats_time_week={week}"], check=True)
        subprocess.run(["eww", "update", f"stats_time_month={month}"], check=True)
        subprocess.run(["eww", "update", f"stats_time_total={total}"], check=True)
        subprocess.run(["eww", "update", f"stats_last_updated={last_updated}"], check=True)
        
        print(f"Updated eww with: week={week}, month={month}, total={total}, last_updated={last_updated}")

def init(cursor):
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS stats (
            week INTERGER,
            month INTERGER,
            total INTERGER,
            last_updated TEXT
        )
    ''')

def init_parser():
    parser = argparse.ArgumentParser(description="Stats Database")

    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("-g", "--get", action="store_true", help="Get stats from the database")
    group.add_argument("-u", "--update", action="store_true", help="Update stats in the database")

    return parser.parse_args()

def main():
    args = init_parser()

    with sqlite3.connect(DB_PATH) as conn:
        cursor = conn.cursor()
        init(cursor)
        
        if args.get:
            get(cursor)
        elif args.update:
            update_time(cursor)
            update_last_updated(cursor)


        conn.commit()

if __name__ == '__main__':
    main()






