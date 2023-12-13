pipeline {
    agent any
    tools {
        maven 'Maven 3.6.3'
    }
        stage('Build Maven') {
            steps {
                script {
                    // Checkout the code from the Git repository
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/phebekeerthana/DEMOjenkins']]])
                    
                    // Build the Maven project
                    sh 'mvn clean install'
                }
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t chennelikeerthana/jenkins .'
                }
            }
        }

        stage('Push image to Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                        sh "docker login -u chennelikeerthana -p ${dockerhub}"
                    }

                    // Push Docker image to Docker Hub
                    sh 'docker push chennelikeerthana/jenkins'
                }
            }
        }
    }
}
