pipeline {
    agent any
    tools {
        nodejs 'NodeJS' // Assuming 'Node.js' is the tool installation name for Node.js in Jenkins
    }
    stages {
        stage('Checkout SCM') {
            steps {
                echo "Checking out source code from SCM"
                checkout scm
            }
        }
        stage('Build Angular') {
            steps {
                script {
                    echo "Installing project dependencies using npm"
                    bat 'npm install'

                    echo "Building the Angular application"
                    bat 'npm run build'
                }
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    echo "Building Docker image with a dynamic tag (Build Number: ${BUILD_NUMBER})"
                    bat "docker build -t chennelikeerthana/backend:${BUILD_NUMBER} ."
                }
            }
        }
        stage('Push image to Hub') {
            steps {
                script {
                    echo "Logging into Docker Hub using credentials"
                    withCredentials([string(credentialsId: 'chennelikeerthana', variable: 'dockerhubpwd')]) {
                        bat "docker login -u chennelikeerthana -p ${dockerhubpwd}"
                    }

                    echo "Pushing Docker image to Docker Hub with dynamic tag"
                    bat "docker push chennelikeerthana/backend:${BUILD_NUMBER}"
                }
            }
        }
    }

    post {
        failure {
            // Send email notification in case of build failure
            emailext body: 'Build failed. Please check the Jenkins build logs for details.',
                    subject: 'Build Failure',
                    to: 'chennelikeerthana@gmail.com'
        }
    }
}
