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
                        # jf rt use my-artifactory-server

                        # Upload artifacts to Artifactory
                        jf rt upload --server-id=my-artifactory-server "target/*.jar" "libs-release-local/"
                    '''
                }
            }
        }
    }
}
