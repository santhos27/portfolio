import mysql.connector

# Connect to MySQL server
mydb = mysql.connector.connect(
    host="localhost",
    port="3306",
    user="admin",
    password="admin",
    database="emp"
)

# Cursor object
emp = mydb.cursor()

# Execute the query
emp.execute("SELECT ID, NAME, DESIG, EMAIL FROM EMPLOYEE WHERE ID IN (1, 4, 5)")

# Iterate over each employee record
for row in emp:
    print(row)