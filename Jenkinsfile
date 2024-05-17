pipeline {
    agent none

    stages {
        /* stage('Setup JFrog CLI') {
            agent { label 'slave1' }
            steps {
                sh '''
                    # Configure JFrog CLI if not already configured
                    jf c add --interactive=false --url=http://65.2.35.102:8081/artifactory --user=admin --password=password --server-id=my-artifactory-server
                '''
            }
        }*/
        stage ('Build Stage') {
            agent { label 'slave1' }
            steps {
                sh 'mvn clean install'
            }
        }
        stage ('Publish Artifacts') {
            agent { label 'slave1' }
            steps {
                script {
                    // Using the JFrog CLI configuration
                    sh '''
                        # Ensure JFrog CLI is configured
                        # jf rt use my-artifactory-server

                        # Upload artifacts to Artifactory
                        jf rt u --server-id=my-artifactory-server "target/*.jar" "http://65.2.35.102:8081/artifactory/libs-release/"
                    '''
                }
            }
        }
    }
}


