pipeline {
    agent any

    stages {
        stage("Add Backend") {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'AWS_credentials']
                ]) {
                    dir('backend') {
                        bat 'terraform --version'
                        bat 'terraform init'
                        bat 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage("Check TF Version") {
            steps {
                bat 'terraform --version'
            }
        }

        stage("Terraform Initialization") {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'AWS_credentials']
                ]) {
                    bat 'terraform init'
                    bat 'terraform fmt'
                }
            }
        }

        stage("Terraform planning") {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'AWS_credentials']
                ]) {
                    bat 'terraform validate'
                    bat 'terraform plan -out=tfplan'
                }
            }
        }

        stage("Terraform execution") {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'AWS_credentials']
                ]) {
                    bat 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage("Terraform state check") {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'AWS_credentials']
                ]) {
                    bat 'terraform state list'
                }
            }
        }
    }

    post {
        success {
            echo "======== EXECUTED SUCCESSFULLY ========"
        }
        failure {
            echo "======== EXECUTION FAILED ========"
        }
    }
}
