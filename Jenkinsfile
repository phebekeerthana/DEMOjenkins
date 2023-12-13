pipeline {
    agent any
    tools {
        maven 'Maven 3.6.3'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/phebekeerthana/DEMOjenkins']])
                sh 'mvn clean install'
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    sh 'docker build -t chennelikeerthana/jenkins .'
                }
            }
        }
        stage('push image to Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                        sh 'docker login -u chennelikeerthana -p ${dockerhub}'
                    }
                    sh 'docker push chennelikeerthana/jenkins'
                }
            }
        }
    }
}
