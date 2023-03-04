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
    }
}