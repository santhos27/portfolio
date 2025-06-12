# Use an official Python runtime as a parent image
FROM httpd

# Copy the current directory contents into the container at /app
COPY ./index.html /usr/local/apache2/htdocs/

# Expose port 80 to the outside world
EXPOSE 80
# Run the Apache server in the foreground
CMD ["httpd-foreground"]