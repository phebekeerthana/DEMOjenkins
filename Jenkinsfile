pipeline {
    agent any
    tools {
        nodejs 'Node.js' // Assuming 'Node.js' is the tool installation name for Node.js in Jenkins
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
                    sh 'npm install'

                    // Build the Angular application
                    sh 'npm run build'
                }
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t chennelikeerthana/angular-app .'
                }
            }
        }
        stage('Push image to Hub') {
            steps {
                script {
                    // Docker login
                    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                        sh "docker login -u chennelikeerthana -p ${dockerhub}"
                    }

                    // Docker push
                    sh 'docker push chennelikeerthana/angular-app'
                }
            }
        }
    }
}
