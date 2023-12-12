pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-angulae-app'
        DOCKER_REGISTRY_URL = 'https://hub.docker.com/repository/docker/chennelikeerthana/angular/general'  // Docker Hub repository URL
        DOCKER_REGISTRY_CREDENTIALS = 'docker-hub-credentials'  // ID of Docker Hub credentials in Jenkins
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to Docker Registry') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY_URL}", "${DOCKER_REGISTRY_CREDENTIALS}") {
                        docker.image("${DOCKER_IMAGE}:${BUILD_NUMBER}").push()
                    }
                }
            }
        }

        // Additional stages for deployment, testing, etc.
    }

    post {
        success {
            echo 'Pipeline succeeded! Image built and pushed.'
        }
        failure {
            echo 'Pipeline failed. Check the logs for errors.'
        }
    }
}
