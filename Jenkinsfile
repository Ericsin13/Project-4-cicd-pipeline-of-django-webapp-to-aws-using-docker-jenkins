pipeline {
    agent any 
    
    stages{
        stage("CLONING THE CODE"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/Ericsin13/Project-4-cicd-pipeline-of-django-webapp-to-aws-using-docker-jenkins.git", branch: "main"
            }
        }
        stage("CHECKOUT"){
            steps {
                echo "Checking out the code"
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Ericsin13/Project-4-cicd-pipeline-of-django-webapp-to-aws-using-docker-jenkins.git']])
            }
        }
        stage("BUILD"){
            steps {
                echo "Building the image"
                sh "docker build -t ericsin13/befit ."
            }
        }
        stage("PUSH TO THE DOCKER HUB"){
            steps {
                echo "Pushing the image to docker hub"
               withCredentials([usernamePassword(credentialsId: 'docker_hub', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USER')]) {
                sh "echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USER --password-stdin"
                sh "docker push ericsin13/befit:latest"
                }
            }
        }
        stage("DEPLOYING THE CONTAINER"){
            steps {
                echo "Deploying the container"
                sh "docker-compose down && docker-compose up -d"
                
            }
        }
    }
}
