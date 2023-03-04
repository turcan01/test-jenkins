pipeline {
    agent any
    parameters {
        choice(
            name: 'ExecuteAction',
            choices: ['build', 'destroy'],
            description: 'which action to take'
            )
        }
    stages {
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform plan'){
            when { expression { params.ExecuteAction == 'build'} }
            steps{
                sh 'terraform plan'
                sh 'terraform apply --auto-approve'
            }
        }
    }
}