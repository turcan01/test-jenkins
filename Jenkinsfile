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
        stage('Terraform plan') {
            when { expression { params.ExecuteAction == 'build'} }
            steps{
                sh 'terraform plan'
                sh 'terraform apply --auto-approve'
            }
        }
        stage('Handle TF outputs'){
            when { expression { params.ExecuteAction == 'build' } }
            steps{
                sh './info.sh'
                sh 'sleep 5s'
            }
        }
        stage('Ansible'){
            when { expression { params.ExecuteAction == 'build' } }
            steps{
               // sh 'ansible -i inventory -m ping all'
               sh 'ansible-playbook ./ansible/playbooks/wordpress.yml'
            }
        }
        stage('Terraform destroy'){
            when { expression { params.ExecuteAction == 'destroy' } }
            steps{
            sh 'terraform destroy -auto-approve '
            }
        }
    }
}