pipeline {
    agent none
    stages {
        stage('Build Stage') {
            agent {
                label 'slave1'
            }
            steps {
                sh 'mvn clean install'
            }
            post {
                success {
                    script {
                        def server = Artifactory.newServer url: 'http://3.109.206.53:8081/artifactory/', credentialsId: 'jfrog'
                        def rtMaven = Artifactory.newMavenBuild()
                        rtMaven.deployer server: server, releaseRepo: 'libs-release/', snapshotRepo: 'libs-snapshot/'
                        rtMaven.tool = 'maven'
                        rtMaven.run pom: 'pom.xml', goals: 'clean install'
                    }
                }
            }
        }
        
        stage('Download Artifact') {
            agent {
                label 'slave2'
            }
            steps {
                script {
                    sh 'curl -o jenkins-test-1.0.jar http://3.109.206.53:8081/artifactory/libs-release/com/example/jenkins-test/1.0/jenkins-test-1.0.jar'
                }
            }
        }
    }
}
