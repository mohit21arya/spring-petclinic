pipeline {
	agent none 
		stages {
			stage('Maven Install') {
				agent {
					docker {
						image 'maven:3.5.0'
					}
				}
				steps {
					echo "-=- compiling project -=-"
					sh 'mvn clean package'
				}
			}
			stage('Docker Build') {
				agent any
				steps {
					sh 'docker build -t username/spring-petclinic:latest .'
				}
			}
			stage('Pushing Docker Image to Jfrog Artifactory') {
				steps {
					script {
						docker.withRegistry('https://mohit21arya.jfrog.io', 'artifactory-credential') {
							docker.image("username/spring-petclinic:latest").push()
							docker.image("username/spring-petclinic:latest").push("latest")
						}
					}
				}
			}
			stage('Deploy') {
				steps {
					sh "docker stop spring-petclinic| true"
					sh "docker rm spring-petclinic | true"
					sh "docker run --name spring-petclinic -d -p 8081:8080 mohit21arya.jfrog.io/username/spring-petclinic:latest"
				}
			}
		}
}
