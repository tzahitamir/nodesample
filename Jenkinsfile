pipeline {
    agent any

    stages {
        stage('Check versions') {
            steps {
                sh "docker -v"
                sh "git version"
            }
        }
        stage('Run Unit tests') {
            steps {
                sh "echo Running tests"
            }
        }
    }
}
