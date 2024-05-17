pipeline {
    agent none

    stages {
        stage('Build Stage') {
            agent { label 'slave1' }
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Publish Artifacts') {
            agent { label 'slave1' }
            steps {
                script {
                    // Using the JFrog CLI configuration
                    sh '''
                        # Ensure JFrog CLI is configured
                        jf rt uc my-artifactory-server

                        # Upload artifacts to Artifactory
                        jf rt upload --server-id=my-artifactory-server --url=http://65.2.35.102:8081/artifactory/ target/*.jar libs-release-local/
                        #jf rt upload --server-id=my-artifactory-server --url=http://65.2.35.102:8081/artifactory/ home/ubuntu/jenkins/workspace/Artifactory/target/jenkins-test-1.0.jar libs-release-local/
                    '''
                }
            }
        }
    }
}
