pipeline {
    agent any

    parameters {
        string(name: 'ADMIN_CIDR', defaultValue: '', description: 'Your public IP with /32')
        string(name: 'KEY_NAME', defaultValue: '', description: 'AWS EC2 Key Pair name')
        string(name: 'AMI_ID', defaultValue: '', description: 'Ubuntu AMI ID')
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    terraform plan \
                    -var="admin_cidr=${ADMIN_CIDR}" \
                    -var="key_name=${KEY_NAME}" \
                    -var="ami_id=${AMI_ID}" \
                    -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'AWS infrastructure create karein?'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
