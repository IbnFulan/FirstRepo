pipeline {
    agent any
    environment {
        KUBECONFIG = '/var/lib/jenkins/.kube/config'  // Path to your kubeconfig file
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/IbnFulan/FirstRepo.git'
            }
        }
        stage('Setup Kubeconfig') {
            steps {
                script {
                    sh '''
                        if [ ! -f /var/lib/jenkins/.kube/config ]; then
                          mkdir -p /var/lib/jenkins/.kube
                          cp /path/to/your/kubeconfig /var/lib/jenkins/.kube/config
                        fi
                    '''
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
