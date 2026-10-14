pipeline{
    agent any
    stages{
        stage("Add Backend"){
            steps{
            withCredentials([
            [$class: 'AmazonWebServicesCredentialsBinding',
             credentialsId: 'AWS_credentials']]) {
                dir('backend'){
                bat 'terraform --version'
                bat 'terraform init'
                bat 'terraform apply -auto-approve'
                }
            }
            }
        }
        stage("Check TF Version"){
            steps{
                bat 'terraform --version'
            }

        }
        stage("Terraform Initialization"){
            steps{
                bat 'terraform init'
                bat 'terraform fmt'
            }

        }
        stage("Terraform planning"){
            steps{
                bat 'terraform validate'
                bat 'terraform plan -out=tfplan'
            }

        }
        stage("Terraform execution"){
            steps{
            withCredentials([
            [$class: 'AmazonWebServicesCredentialsBinding',
             credentialsId: 'AWS_credentials']]) {
                bat 'terraform apply -auto-approve'
            }
            }
        }
        stage("Terraform state check"){
            steps{
                bat 'terraform state list'
            }
        }
    }
    post{
        success{
            echo "========executed successfully ========"
        }
        failure{
            echo "========execution failed========"
        }
    }
}

