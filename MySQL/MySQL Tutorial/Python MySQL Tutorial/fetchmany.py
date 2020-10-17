"""
For a relatively big table, it takes time to fetch all rows and return the entire result set. In addition,  fetchall()
needs to allocate enough memory to store the entire result set in the memory, which is not efficient.

MySQL Connector/Python has the  fetchmany() method that returns the next number of rows (n) of the result set, which
allows you to balance between retrieval time and memory space.
"""
from mysql.connector import MySQLConnection, Error
from python_mysql_dbconfig import read_db_config


def iter_row(cursor, size=10):
    """A generator that chunks the database calls into a series of  fetchmany() calls.

    :param cursor:
    :param size:
    :return:
    """
    while True:
        rows = cursor.fetchmany(size)
        if not rows:
            break
        for row in rows:
            yield row


def query_with_fetchmany():
    try:
        dbconfig = read_db_config()
        conn = MySQLConnection(**dbconfig)
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM books")

        for row in iter_row(cursor, 10):
            print(row)

    except Error as e:
        print(e)

    finally:
        cursor.close()
        conn.close()


if __name__ == '__main__':
    query_with_fetchmany()
