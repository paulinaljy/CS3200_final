FROM python:3.9-alpine

# Install necessary build dependencies
RUN apk add --no-cache mariadb-connector-c-dev build-base

# Create and set working directory
RUN mkdir /usr/src/app/
WORKDIR /usr/src/app/

# Copy project files
COPY . /usr/src/app/

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose port
EXPOSE 4000

# Run the application
CMD ["python", "main.py"]
