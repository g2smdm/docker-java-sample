pipeline {
    agent any
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven"
    } 
    stages {
        
        stage('Clone') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/g2smdm/docker-java-sample.git'
            }
            
        }
        
        stage('Build') {
            steps {

                // Run Maven on a Unix agent.
                // sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                bat "mvn clean package -DskipTests=true"
            }

            // post {
            //     // If Maven was able to run the tests, even if some of the test
            //     // failed, record the test results and archive the jar file.
            //     success {
            //         junit '**/target/surefire-reports/TEST-*.xml'
            //         archiveArtifacts 'target/*.jar'
            //     }
            // }
        }
        
        stage('docker package') {
            steps {
                bat 'docker build -t gsmdm/dockerjava .'
            }
        }
        
        // stage('docker login') {
        //     steps {
        //         	bat 'docker login -u gsmdm -p 1234'
        //     }
        // }
        
//         stage('docker push') {
//             steps {
//                 bat 'docker push gsmdm/dockerjava:latest'
//             }
//         }
        
        // stage('docker deploy') {
        //     steps {
        //         bat 'docker run -p 9090:8080 dockerjava'
        //     }
        // }

	    stage("install minikube") {
		steps {
		   bat 'kubectl config current-context'
		}
	    }
		
		stage('deploy to k8s') {
            steps {
                bat 'kubectl apply -f deployment-service.yaml'
            }
        }
		
		stage('run app') {
            steps {
                bat 'minikube service msa'
            }
        }
		


                
    }
}
