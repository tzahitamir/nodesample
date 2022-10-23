pipeline {
    agent any

    stages {
        stage('Docker check ver') {
            steps {
                sh "docker -v"
            }
        }
        stage('Git check ver') {
            steps {
                sh "git version"
            }
        }
    }
}
