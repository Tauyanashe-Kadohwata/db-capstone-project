import mysql.connector
import os
from dotenv import load_dotenv 

# Load environment variables from .env file
load_dotenv()

# Access the variables
host = os.getenv("DB_HOST")
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")
database = os.getenv("DB_NAME")

# Connect using env variables
connection = mysql.connector.connect(
    host=host,
    user=user,
    password=password,
    database=database
)

cursor = connection.cursor()
cursor.execute("SELECT * FROM bookings")
results = cursor.fetchall()

for row in results:
    print(row)

cursor.close()
connection.close()

def add_booking(customer_name, date, time, guests):
    connection = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME")
    )
    cursor = connection.cursor()
    query = """
    INSERT INTO bookings (customer_name, booking_date, booking_time, guests)
    VALUES (%s, %s, %s, %s)
    """
    data = (customer_name, date, time, guests)
    cursor.execute(query, data)
    connection.commit()
    print("New booking added!")

    cursor.close()
    connection.close()

add_booking("Emily Carter", "2025-05-22", "20:00:00", 3)
