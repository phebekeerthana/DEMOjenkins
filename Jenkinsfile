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
                    echo 'Running Docker Build Command'
                    bat 'docker build -t chennelikeerthana/backend:tagname .'
                }
            }
        }
        stage('Debug Docker') {
            steps {
                script {
                    // Debugging info about Docker environment
                    echo 'Running Docker Environment Info'
                    bat 'docker version'
                    bat 'docker info'
                }
            }
        }
        stage('Push image to Hub') {
            steps {
                script {
                    // Docker login
                    withCredentials([string(credentialsId: 'chennelikeerthana', variable: 'dockerpwd')]) {
                        echo 'Running Docker Login Command'
                        bat 'docker login -u chennelikeerthana -p ${dockerpwd}'
                    }
                    // Docker push
                    echo 'Running Docker Push Command'
                    bat 'docker push chennelikeerthana/backend:latest'
                }
            }
        }
    }
}


