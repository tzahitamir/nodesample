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
        stage('Docker build and push'){
           steps{
            sh 'docker build -t tzahitamir/nodeapp:""$GIT_COMMIT"" .'
            sh 'docker push -t tzahitamir/nodeapp:""$GIT_COMMIT""'
           } 
        }
    }
}
