import mysql.connector#library for MYSQL Database
import smtplib #library for mail feature

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
    emp_id, name, desig, email = row  # Unpack row fields

    # SMTP configuration
    server = smtplib.SMTP('smtp.gmail.com',587)#587 is the port for gmail different domains has different port
    server.starttls()#staring the mailserve with tls auth

    try:
        # Server login
        server.login('santhoskumarhr@gmail.com', 'pdjr dbkr uhlz lfmc')#logging in to the account with app password generated in 'manage your google account'
        
        # Preparing email content
        subject = "Promotion Notification"
        body = f"""
Hi {name},

Congratulations! You have been promoted from {desig} to SENIOR {desig} with a performance bonus of 25% of your CTC.

Best Regards,  
Human Resources
        """

        message = f"Subject: {subject}\n\n{body}"

        # Send email
        server.sendmail('santhoskumarhr@gmail.com', email, message)
        print(f"Email sent successfully to {name} ({email}).")

    except Exception as e:
        print(f"Failed to send email to {name} ({email}). Error: {e}")
    
    finally:
        # Close the server connection after each email
        server.quit()

# Close the database connection
mydb.close()