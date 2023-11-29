pipeline {
   agent any
   
   tools {
       jdk 'jdk-11' 
       maven 'maven'
   }
   
   stages {
       stage('git checkout') {
           steps {
               git branch: 'main', url: "https://github.com/jyotirmayee2312/deploy-to-ecs.git"
           }
       }
       
       stage('build') {
           steps {
               sh "mvn clean install package"
           }
       }
       
       stage('build & tag docker image') {
           steps {
               script {
                   withDockerRegistry(credentialsId: 'docker-cred', toolName: 'Docker') {
                       sh "docker build -t my-java-app ."
                       sh "docker tag my-java-app jyotirmayeep2312/my-java-app:latest"
                       sh "docker push jyotirmayeep2312/my-java-app:latest"
                  }
               }
           }
       }
       
       stage('start container') {
           steps {
               script {
                   try {
                       sh "docker stop my-java-app || true"
                       sh "docker rm my-java-app || true"
                   } catch (Exception e) {
                       echo "Error occurred while removing the container: ${e.message}"
                   }
                   sh "docker run -d -p 8081:8080 --name my-java-app jyotirmayeep2312/my-java-app:latest"
               }
           }
       }
   }
}
