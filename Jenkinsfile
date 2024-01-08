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
                    // Build Docker image
                    bat 'docker build -t chennelikeerthana/backend:tagname .'
                }
            }
        }
        stage('Push image to Hub') {
            steps {
                script {
                    // Docker login
                       withCredentials([string(credentialsId: 'chennelikeerthana', variable: 'dockerhubpwd')]) {
                        bat "docker login -u chennelikeerthana -p ${dockerhubpwd}"
                    }

                    // Docker push
                    bat 'docker push  chennelikeerthana/backend:latest'
                }
            }
        }
    }
}      