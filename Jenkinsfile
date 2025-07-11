pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = 'us-east-2'
    }
    parameters {
        
        
        choice choices: ['apply', 'destroy'], description: '''Choose your terraform action
        ''', name: 'action'
    }
    stages{
        stage('Checkout SCM'){
            steps{
                script{
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/alokaneunice/jenkins-terraform-infrastructure.git']])
                }
            }
        }
        
        stage('Initializing backend'){
            steps{
                script{
                    dir('implementation'){
                         sh 'terraform init'
                    }
                }
            }
        }
        stage('Validating Terraform'){
            steps{
                script{
                    dir('implementation'){
                         sh 'terraform validate'
                    }
                }
            }
        }
        stage('Previewing the infrastructure'){
            steps{

                script{

                    dir('implementation'){

                        sh 'terraform plan'
                    }
                    input(message: "Approve?", ok: "proceed")
                }
            }
        }

        stage('Terraform Apply') {
            steps {
               /// withAWS(credentials: 'aws-key', region: 'us-east-2') { 
                script {
                    if (params.'action' == 'apply') {

                        echo "You have chosen to ${params.'action'} the resources"
                        dir('implementation'){
                            sh 'terraform $action --auto-approve'
                                
                    
                        }
                    }
                }
        

            }
        }
        
        stage('Terraform Destroy') {
            steps {
               /// withAWS(credentials: 'aws-key', region: 'us-east-2') { 
                script {
                    if (params.'action' == 'destroy') {

                        echo "You have chosen to ${params.'action'} the resources"
                        dir('terraform-files'){
                            sh 'terraform $action --auto-approve'
                        
                        }
                    }
                }
        

            }
        }
    }
}