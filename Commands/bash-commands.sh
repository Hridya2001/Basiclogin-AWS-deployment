#!/bin/bash
# This script includes essential bash commands for setting up the backend and frontend.

# Clone the application repository
git clone https://github.com/sree33445/basiclogin.git

# Go to backend directory
cd basiclogin/backend

# Build and run Docker container for backend
docker build -t backend-app .
docker run -d -p 5000:5000 backend-app

# OR run Node.js server directly
node server.js

# Connect to RDS PostgreSQL from EC2 instance
# Replace <RDS-endpoint> with your actual RDS endpoint
psql -h <RDS-endpoint> -U postgres -d postgres

# Go to frontend directory
cd ../frontend

# Build frontend project
npm run build
