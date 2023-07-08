"""Скрипт для заполнения данными таблиц в БД Postgres."""
import csv

import psycopg2


def get_data_from_file(filename_e):
    employees_data = []
    with open(filename_e, "r") as csvfile:
        csvreader = csv.reader(csvfile)
        for row in csvreader:
            if row[0] != "employee_id":
                first = int(row[0])
                second = row[1]
                third = row[2]
                forth = row[3]
                fifth = row[4]
                sixth = row[5]
                my_tuple = (first, second, third, forth, fifth, sixth)
                employees_data.append(my_tuple)

    return employees_data


def get_data_from_file_customers(filename_c):
    employees_data = []
    with open(filename_c, "r") as csvfile:
        csvreader = csv.reader(csvfile)
        for row in csvreader:
            if row[0] != "customer_id":
                first = row[0]
                second = row[1]
                third = row[2]
                my_tuple = (first, second, third)
                employees_data.append(my_tuple)

    return employees_data


def get_data_from_file_orders(filename_o):
    employees_data = []
    with open(filename_o, "r") as csvfile:
        csvreader = csv.reader(csvfile)
        for row in csvreader:
            if row[0] != "order_id":
                first = int(row[0])
                second = row[1]
                third = int(row[2])
                forth = row[3]
                fifth = row[4]
                my_tuple = (first, second, third, forth, fifth)
                employees_data.append(my_tuple)

    return employees_data


filename_0 = '/home/irinka/PycharmProjects/postgres-homeworks/homework-1/north_data/orders_data.csv'
filename_e = '/home/irinka/PycharmProjects/postgres-homeworks/homework-1/north_data/employees_data.csv'
filename_c = '/home/irinka/PycharmProjects/postgres-homeworks/homework-1/north_data/customers_data.csv'

conn = psycopg2.connect(host="localhost", database="north", user="postgres", password="q1")

try:
    with conn:
        with conn.cursor() as cur:
            cur.executemany("INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)", get_data_from_file(filename_e))
            cur.execute("SELECT * FROM employees")
            rows = cur.fetchall()
            for row in rows:
                print(row)
finally:
    conn.close()

conn = psycopg2.connect(host="localhost", database="north", user="postgres", password="q1")

try:
    with conn:
        with conn.cursor() as cur:
            cur.executemany("INSERT INTO customers VALUES (%s, %s, %s)", get_data_from_file_customers(filename_c))
            cur.execute("SELECT * FROM customers")
            rows = cur.fetchall()
            for row in rows:
                print(row)
finally:
    conn.close()

conn = psycopg2.connect(host="localhost", database="north", user="postgres", password="q1")

try:
    with conn:
        with conn.cursor() as cur:
            cur.executemany("INSERT INTO orders VALUES (%s, %s, %s, %s, %s)", get_data_from_file_orders(filename_0))
            cur.execute("SELECT * FROM orders")
            rows = cur.fetchall()
            for row in rows:
                print(row)
finally:
    conn.close()
