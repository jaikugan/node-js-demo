pipeline{
  agent any

  stages {
    stage ("Checkout"){
      steps{
        checkout scm
      }
    }
    stage ("Test"){
      steps{
        sh '''
        apt install npm -y
        npm test
        '''
      }
    } 
    stage ("Build"){
      steps{
        sh 'npm run build'
      }
    }
     stage ("Build image"){
      steps{
        sh 'sudo docker build -t my-demo:1.0 .'
      }
     }
  }
}
      
