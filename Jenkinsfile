pipeline {
    agent any

    environment {
        // Set environment variables for Docker registry credentials and image name
        DOCKERHUB_CREDENTIALS = 'Dockerhub-credentials' // Jenkins credentials ID
        DOCKER_IMAGE = 'jaikugan/jenkins-demo' // Docker image name
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Checkout the code from Git repository
                git branch: 'main', url: 'https://github.com/jaikugan/node-js-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    sudo docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                // Login to Docker Hub using the credentials stored in Jenkins
                script {
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        echo 'Logged in to Docker Hub'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push the Docker image to the Docker Hub
                script {
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image built and pushed successfully.'
        }
        failure {
            echo 'Build failed. Docker image was not pushed.'
        }
    }
}
