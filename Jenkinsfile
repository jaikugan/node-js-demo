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
        sudo apt install npm
        npm test
        '''
      }
    } 
    stage ("Build"){
      steps{
        sh 'npm run build'
      }   
    }
  }
}
