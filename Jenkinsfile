pipeline {
    agent any
    environment {
        KUBECONFIG = credentials('kubeconfig')  // Add kubeconfig file in Jenkins credentials
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/FirstRepo.git'  // Update with your repo
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
                script {
                    sh 'kubectl apply -f k8s-deployment.yaml'
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
