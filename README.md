# Node Express Server REST API Deployment

This repository contains the setup for deploying a **Node.js Express server REST API** using **Docker**, **CI/CD pipelines**, and **Kubernetes** (with **Terraform** for Infrastructure as Code). Below is the guide for setting up the environment and deploying the application.

## Prerequisites

Before proceeding, ensure the following are installed:

- Docker
- Docker Compose
- Terraform
- GitHub or GitLab (for CI/CD)
- Kubernetes CLI (kubectl)
- Helm (optional, for Kubernetes deployments)

## 1. **Clone the Repository**

Start by cloning the repository to your local machine:

```bash
git clone https://github.com/sahilk30/node-express-server-rest-api.git
cd node-express-server-rest-api
```
## 2. **Docker Setup**

### Dockerfile

The `Dockerfile` builds the Docker image for the application. It sets the working environment, installs dependencies, and starts the application.

#### Steps in the Dockerfile:

1. **Use a base Node.js image**:
   The base image used is `node:18-alpine` to ensure a lightweight, minimal environment for the application.
   
2. **Set the working directory in the container**:
   The working directory within the container is set to `/usr/src/app`.

3. **Install necessary dependencies**:
   Copy the `package.json` and `package-lock.json` files into the container and run `npm install` to install the required dependencies.

4. **Expose the necessary port**:
   The application listens on port `3000`, so we expose this port in the Docker container.

5. **Set the command to start the application**:
   The command `npm start` is used to start the application when the container runs.



### Docker Compose

Docker Compose is used for defining and running multi-container Docker applications. It simplifies the process of setting up the application environment.

#### Steps for using Docker Compose:

1. **Define the services**:
   In this case, the service will be the Node.js Express application that will run within the Docker container.

2. **Set up the necessary environment variables**:
   Ensure any environment variables (e.g., for API keys, ports) are defined in the `docker-compose.yml` file.

3. **Bind container ports to local machine ports**:
   Expose the container port to your local machine so you can access the application.

To run the application with Docker Compose, use:
```bash
docker-compose up -d
```



## 3. **CI/CD Pipeline Setup**

### GitHub Actions (CI Configuration)

The project uses **GitHub Actions** for the CI/CD pipeline. The pipeline will automatically build and push the Docker image to **Docker Hub** whenever code is pushed to the **main** branch.

#### Steps for setting up GitHub Actions:

1. **Set up a GitHub Actions workflow**:
   - Create a file named `ci.yml` inside the `.github/workflows` directory in your repository.
   
2. **Define the workflow**:
   The workflow will:
   - Trigger on a push to the `main` branch.
   - Build the Docker image using the `Dockerfile` located in the repository.
   - Log in to **Docker Hub** using credentials stored as GitHub secrets.
   - Push the built image to Docker Hub under `yourusername/node-express-api:latest`.

Store Docker Hub Credentials as Github Secret
- In your GitHub, go to Settigns > Secrets and Add DOCKER_USERNAME and DOCKER_PASSWORD

## 4. Kubernetes Cluster Setup

### Terraform for Infrastructure as Code (IaC)

You can use Terraform to provision a Kubernetes cluster in a cloud provider (AWS, GCP, Azure, etc.) or create your own Kubernetes cluster.

### Steps for creating the cluster with Terraform:
Configure the Terraform provider  
Run **terraform init** and **terraform apply** to create the infrastructure