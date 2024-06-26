# First stage: Build environment
FROM python:3.9 AS builder

# Set the working directory in the build stage
WORKDIR /app

# Copy the source code and requirements file to the build stage
COPY . /app

# Install system dependencies for building
RUN apt-get update && \
    apt-get install -y build-essential gcc unixodbc-dev unixodbc odbcinst && \
    rm -rf /var/lib/apt/lists/*

# Second stage: Runtime environment
FROM python:3.9-slim

# Set the working directory in the final stage
WORKDIR /app

# Copy only the necessary files from the previous stage (builder)
COPY --from=builder /app /app

RUN apt-get update && \
    apt-get install -y unixodbc odbcinst libodbc1 && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y curl gnupg && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/12/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    sed -i 's/signed-by=\/usr\/share\/keyrings\/microsoft-prod.gpg//' /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18 

    
# Set the PATH environment variable
ENV PATH="/app:${PATH}"

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define the command to run the application
CMD ["python", "app.py"]

