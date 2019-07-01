node() {
    stage('Terraform Create') {
        git credentialsId: 'dbe25c12-5564-4f14-b9fa-a5de080ec5c5', url: 'https://github.com/hopeless09/elastic-httpd-terraform.git'

        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'AWSAccessSecretKey',
usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
        sh """
            export AWS_SECRET_ACCESS_KEY=${PASSWORD}
            export AWS_ACCESS_KEY_ID=${USERNAME}
            export AWS_DEFAULT_REGION=us-west-2
            terraform init
            terraform apply -auto-approve
        """
        }

    }
}
