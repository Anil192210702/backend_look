import pymysql
from pymysql.constants import CLIENT
import os

with open('family_db.sql', 'r', encoding='utf-8') as f:
    sql = f.read()

connection = pymysql.connect(
    host='mysql-2777d0fd-anilkumar-ab27.h.aivencloud.com',
    user='avnadmin',
    password=os.environ.get('DB_PASSWORD', ''),
    database='defaultdb',
    port=21282,
    client_flag=CLIENT.MULTI_STATEMENTS
)

try:
    with connection.cursor() as cursor:
        cursor.execute(sql)
    connection.commit()
    print("Database imported successfully!")
finally:
    connection.close()
