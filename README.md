# BasicLogin-AWS-deployment

This project demonstrates how to deploy a full-stack web application on AWS with a public backend, a private database, and static frontend hosting using the following architecture,

- Frontend: Static website hosted on Amazon S3
- Backend: Node.js application running on an EC2 instance (public subnet)
- Database: PostgreSQL managed by Amazon RDS (private subnet)
- Networking: AWS VPC with public and private subnets, route tables, and an Internet Gateway


## Architecture Diagram

![Architecture Diagram](Docs/Architecture.png)


## Tools and Technologies Used

- **AWS VPC** – for network isolation
- **Amazon EC2** – to host the backend (Node.js)
- **Amazon RDS (PostgreSQL)** – managed database service
- **Amazon S3** – static website hosting for frontend
- **Docker** – containerization of backend app
- **psql** – PostgreSQL command-line tool


## Components
- Frontend:
Static files (HTML) hosted in an S3 bucket with static website hosting enabled.

- Backend:
Node.js application (from backend/ folder) running on an EC2 instance in the public subnet. Exposed to the internet via a public IP.

- Database:
PostgreSQL RDS instance deployed in a private subnet. Only accessible from within the VPC (specifically, the EC2 backend).


## Setup Instructions
**1. Networking Setup (VPC & Subnets)**
  - Create a new VPC.
  - Add a public subnet (for EC2) and a private subnet (for RDS).
  - Attach an Internet Gateway to the VPC.
  - Configure route tables:
  - Public subnet routes internet traffic through the IGW.
  - Private subnet has no direct internet access.
  

**2. EC2 Instance for Backend**
  - Launch an EC2 instance in the public subnet.
  - SSH into the instance.
  - Install Docker
  - Clone the GitHub repository:
    
  (```bash
  
       git clone https://github.com/sree33445/basiclogin.git
  
  - Build and run the backend:
    
  (```bash
         cd backend
       
         docker build -t backend-app .
       
         docker run -d -p 5000:5000 backend-app
       
      Or
      
         node server.js

  Mentioning the screenshot of the backend running on port http://65.2.141.28:5000 
   ![Screenshot](Docs/backend.png)


**3. RDS PostgreSQL Setup**
  - Create an RDS PostgreSQL instance in the private subnet.
  - Ensure security group allows inbound connections from the EC2 instance.
  - Connect from EC2 using:
    
    ```bash
    
    psql -h <RDS-endpoint> -U postgres -d postgres
        
  - Create database and user table:
    
    ```sql
    
    CREATE DATABASE myappdb;
    
    \c myappdb
        
    -- Create 'user' table as per backend requirements
       CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL);

    

![Screenshot](Docs/RDS.png)
Notes: user detailes loaded on db

**4. Hosting Frontend on S3**
  - Build the frontend project:
    
  (```bash
    
       cd frontend
        
       npm run build
        
       Create an S3 bucket (e.g., my-bucket-frontend-2001).
  
  - Upload the build files to the bucket.
  - Enable static website hosting.
  - Set bucket policy to allow public read access for static files.

    ![Screenshot](Docs/Frontend-login.png)
Notes: User login successfull

**5. Integration**
  - Update frontend API URLs to point to the EC2 backend (http://*****<EC2-public-ip>:5000).
  - Ensure security groups and CORS policies allow communication between frontend and backend
    

## Errors Faced & Troubleshooting
| Issue                            | Cause                                              | Solution                                                         |
|-----------------------------------|---------------------------------------------------|------------------------------------------------------------------|
| EC2 Instance Not Accessible via SSH | Security group missing inbound rule for port 22    | Added SSH (port 22) rule for my IP in EC2 security group         |
| Backend Not Reachable from Frontend | EC2 security group missing inbound rule for 5000   | Added HTTP (port 5000) rule for 0.0.0.0/0 (for testing)          |
| RDS Connection Refused             | RDS SG not allowing inbound from EC2               | Allowed PostgreSQL (5432) from EC2’s security group              |
| CORS Errors in Frontend            | Backend did not allow S3 domain                    | Enabled CORS for S3 bucket URL                                   |
| Database Table Not Found           | `user` table not created before running backend    | Manually created the required table in PostgreSQL                |


## Credits
**Original repository cloned from 👉 https://github.com/sree33445/basiclogin.git.**

Thanks to the AWS documentation and community tutorials for the guidance and support in building this architecture.



