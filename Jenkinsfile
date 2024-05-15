pipeline {
    agent none
    
    stages {
        stage('Build') {
            agent {
               label 'master-jenkins'
            }
            steps {
                script {
                    // Build the Maven project

                    sh 'mvn clean install' // Replace this with your Maven build command
                    
                    // Stash the built artifacts
                    
                    stash includes: 'target/*.jar', name: 'artifacts'
                }
            }
        }
        
        stage('Transfer Artifacts to JFrog Slave') {
            agent {
                label 'jfrog-slave' // Replace this with the label of your Jenkins slave node
            }
            steps {
                script {
                    // Unstash the artifacts on the slave node
                    unstash 'artifacts'
                    
                    def jfrogUser = 'test' // Replace this with your JFrog Artifactory username
                    def jfrogPassword = 'Test@123' // Replace this with your JFrog Artifactory password
                    def repoName = 'libs-release-local' // Replace this with the name of your Artifactory repository
                    def buildDir = '.' // Use the current directory
                    
                    // Transfer artifacts to JFrog Artifactory slave using curl
                    sh "curl -u ${jfrogUser}:${jfrogPassword} -T ${buildDir}/jenkins-test-1.0.jar http://15.206.158.39:8081/artifactory/${repoName}/"
                }
            }
        }
    }
}
