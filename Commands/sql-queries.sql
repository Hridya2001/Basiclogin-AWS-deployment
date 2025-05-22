-- SQL setup script to create a database and user table for the application.

-- Step 1: Create a new database
CREATE DATABASE myappdb;

-- Step 2: Connect to the new database
\c myappdb

-- Step 3: Create 'users' table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
-- Step 4: View all users and their login credentials stored in the table
SELECT * FROM users;




