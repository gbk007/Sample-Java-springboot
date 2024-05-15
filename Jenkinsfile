pipeline {
    agent none

    stages {
        stage('Build Stage') {
            agent {
                label 'master-jenkins'
            }
            steps {
                // Build your project
                sh 'mvn clean install'
            }
        }
        stage('Push to JFrog') {
            agent {
                label 'jfrog-slave'
            }
            steps {
                // Use curl or any other method to push artifacts to JFrog
                sh '''
                    curl -u test:Test@123 -T target/jenkins-test-1.0.jar "http://15.206.158.39:8081/artifactory/webapp/#/artifacts/browse/tree/General/libs-release-local"
                '''
            }
        }
    }
}
