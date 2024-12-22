Node Express Server REST API Deployment
This repository contains the setup for deploying a Node.js Express server REST API using Docker, CI/CD pipelines, and Kubernetes (with Terraform for Infrastructure as Code). Below is the guide for setting up the environment and deploying the application.

Prerequisites
Before proceeding, ensure the following are installed:

Docker
Docker Compose
Terraform
GitHub or GitLab (for CI/CD)
Kubernetes CLI (kubectl)
Helm (optional, for Kubernetes deployments)
1. Clone the Repository
Start by cloning the repository to your local machine:

bash
Copy code
git clone https://github.com/rwieruch/node-express-server-rest-api.git
cd node-express-server-rest-api
2. Docker Setup
Dockerfile
The Dockerfile builds the Docker image for the application. It sets the working environment, installs dependencies, and starts the application.

Steps in the Dockerfile:

Use a base Node.js image.
Set the working directory in the container.
Install necessary dependencies by copying the package.json and package-lock.json files and running npm install.
Expose the necessary port (e.g., 3000).
Set the command to start the application.
Docker Compose
Docker Compose is used for defining and running multi-container Docker applications. It simplifies the process of setting up the application environment.

Steps for using Docker Compose:

Define the services (in this case, the Node.js Express application).
Set up the necessary environment variables.
Bind container ports to local machine ports.
To run the application with Docker Compose, use:

bash
Copy code
docker-compose up --build
