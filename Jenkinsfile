pipeline {
    agent any 
    
    stages{
        stage("CLONING THE CODE"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/Ericsin13/Project-4-cicd-pipeline-of-django-webapp-to-aws-using-docker-jenkins.git", branch: "main"
            }
        }
        stage("BUILDING THE IMAGE"){
            steps {
                echo "Building the image"
                sh "docker build -t my-note-app ."
            }
        }
        stage("PUSH TO THE DOCKER HUB"){
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId: '8cbe2ca0-bd9f-48b5-b09c-4085c68095cf', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]){
                sh "docker tag phill-app ${env.DOCKER_HUB_USERNAME}/phill-app:latestnew"
                sh "docker login -u ${env.DOCKER_HUB_USERNAME} -p ${env.DOCKER_HUB_PASSWORD}"
                sh "docker push ${env.DOCKER_HUB_USERNAME}/phill-app:latestnew"
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
