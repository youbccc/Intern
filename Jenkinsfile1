pipeline {
    environment {
        repository = "youbc/login"
        DOCKERHUB_CREDENTIALS = credentials('docker-hub')
        dockerImage = ''
  }
  agent any
  stages {
      stage('Building our image') {
          steps {
              script {
                  dockerImage = docker.build repository + ":$BUILD_NUMBER"
              }
          }
      }
      stage('Login'){
          steps{
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
          }
      }
      stage('Deploy our image') {
          steps {
              script {
                sh 'docker push $repository:$BUILD_NUMBER' //docker push
              }
          }
      }
      stage('Cleaning up') {
                  steps {
              sh "docker rmi $repository:$BUILD_NUMBER"
          }
      }
      stage('Deploy') {
		steps {
		script{
			kubernetesDeploy(configs: "web-deployment.yaml", kubeconfigId: "kubernetes")
		}
          }
      }
  }
    }

