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
- **Node.js** – backend application runtime
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
1. Networking Setup (VPC & Subnets)
Create a new VPC.

Add a public subnet (for EC2) and a private subnet (for RDS).

Attach an Internet Gateway to the VPC.

Configure route tables:

Public subnet routes internet traffic through the IGW.

Private subnet has no direct internet access.


2. EC2 Instance for Backend
Launch an EC2 instance in the public subnet.

SSH into the instance.

Install Docker and Git.

- Clone the GitHub repository:
bash
git clone <this-repo-url>

- Build and run the backend:
bash
cd backend
docker build -t backend-app .
docker run -d -p 5000:5000 backend-app
## Or
node server.js



