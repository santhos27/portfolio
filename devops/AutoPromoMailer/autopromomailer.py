import smtplib #library for mail feature

# SMTP configuration
server = smtplib.SMTP('smtp.gmail.com',587)#587 is the port for gmail different domains has different port
server.starttls()#staring the mailserve with tls auth

# Server login
server.login('santhoskumarhr@gmail.com', 'pdjr dbkr uhlz lfmc')#logging in to the account with app password generated in 'manage your google account'

# Sending email
subject = "Test Mail"
body = "This is a test mail from Python."
message = f"Subject: {subject}\n\n{body}"
server.sendmail('santhoskumarhr@gmail.com','santhoskumarvfx@gmail.com', message)

print("Email sent successfully.")

# Close the connection
server.quit()