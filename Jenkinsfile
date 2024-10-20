pipeline {
    agent any
    environment {
        KUBECONFIG = credentials('kubeconfig')  // Assuming you've added your kubeconfig in Jenkins credentials
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/FirstRepo.git'  // Update with your actual repo URL
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("nginx:latest")
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
                    sh 'kubectl apply -f k8s-deployment.yaml'  // Ensure your k8s deployment file is correct
                }
            }
        }
    }
    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment Failed'
        }
    }
}

