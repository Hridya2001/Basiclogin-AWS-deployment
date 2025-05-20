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
