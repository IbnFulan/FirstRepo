pipeline {
    agent any
    environment {
        KUBECONFIG = credentials('Kubeconfig')  // Assuming you've added your kubeconfig in Jenkins credentials
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/IbnFulan/FirstRepo.git'  // Update with your actual repo URL
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
                withCredentials([file(credentialsId: 'Kubeconfig', variable: 'KUBECONFIG')]) {
                    sh 'aws eks update-kubeconfig --region us-east-1 --name my-cluster'
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

