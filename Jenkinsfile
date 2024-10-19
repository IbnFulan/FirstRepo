pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main' url: 'https://github.com/IbnFulan/FirstRepo.git'
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
                     sh 'scp target/your-app.jar ubuntu@3.235.188.48:/home/ubuntu/deploy'
                     sh 'ssh ubuntu@3.235.188.48 "java -jar /home/ubuntu/deploy/your-app.jar &"'
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
