pipeline {
    agent any

    stages {
        stage('Check versions') {
            steps {
                sh "docker -v"
                sh "git version"
            }
        }
        stage ('Check K8s'){
              steps {  
                    withKubeConfig([credentialsId: 'kubeconfig']) {
                    sh "kubectl version --short"
                    sh "kubectl get nodes -o wide"
                    }
                }
            }
        stage('Run Unit tests') {
            steps {
                sh "echo Running tests"
            }
        }
        stage('Docker build and push'){
           steps{
            withDockerRegistry([credentialsId: "7ff5b5a3-2491-4006-8733-a1426dd37e69", url: ""]) {
                 //sh 'printenv' print all GIT enviorment varibles 
                sh 'docker build -t tzahitamir/nodeapp:""$GIT_COMMIT"" .'
                sh 'docker push tzahitamir/nodeapp:""$GIT_COMMIT""'
            }
           } 
        }
        stage ('k8s deploy - DEV')
        {
            steps{
                withKubeConfig([credentialsId: 'kubeconfig']) {
                   sh "sed -i 's#replace#tzahitamir/nodeapp:${GIT_COMMIT}#g' deploy.yaml"
                   sh "kubectl apply -f deploy.yaml" 
                   //https://kodekloud.com/topic/demo-kubernetes-deployment-rollout/ 
                   //sample of implemtation including rollout status, and rollback
                }
            }
        }
    }
}
