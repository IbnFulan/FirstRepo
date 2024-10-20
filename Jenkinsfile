pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('awsaccesskey')
        AWS_SECRET_ACCESS_KEY = credentials('awssecret')
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/IbnFulan/FirstRepo'
            }
        }
        stage('Setup Kubeconfig') {
            steps {
                script {
                    sh 'mkdir -p ~/.kube'
                    sh 'cp /var/lib/jenkins/.kube/config ~/.kube/config'
                    sh 'chmod 600 ~/.kube/config'
                }
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
                    sh 'aws eks update-kubeconfig --region us-east-1 --name my-cluster'
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
