pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-repo/java-app.git'
            }
        }

        stage('Build') {
            steps {
                withMaven(maven: 'Maven 3.6.3') {
                    sh 'mvn clean install'
                }
            }
        }

        stage('Deploy') {
            steps {
                sshagent(['EC2-SSH-Credentials']) {
                    sh 'scp target/your-app.jar ubuntu@your-ec2-ip:/path/to/deploy'
                    sh 'ssh ubuntu@your-ec2-ip "java -jar /path/to/deploy/your-app.jar &"'
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
