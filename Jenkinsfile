pipeline {
    agent any
    tools {
        nodejs 'NodeJS' // Assuming 'Node.js' is the tool installation name for Node.js in Jenkins
    }
    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }
        stage('Build Angular') {
            steps {
                script {
                    // Install project dependencies using npm
                    bat 'npm install'

                    // Build the Angular application
                    bat 'npm run build'
                }
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    // Build Docker image with a dynamic tag (e.g., build number)
                    bat "docker build -t chennelikeerthana/backend:${BUILD_NUMBER} ."
                }
            }
        }
        stage('Push image to Hub') {
            steps {
                script {
                    // Docker login using credentials
                    withCredentials([string(credentialsId: 'chennelikeerthana', variable: 'dockerhubpwd')]) {
                        bat "docker login -u chennelikeerthana -p ${dockerhubpwd}"
                    }

                    // Push Docker image with a dynamic tag
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
