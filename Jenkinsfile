pipeline{
    agent any
    stages{
        stage "clone_git_repo" {
            steps{
               git branch: 'main', changelog: false, poll: false, url: 'https://github.com/Ashiquedev/discussion_activity1.git' 
            }
        }
        stage "installing terraform" {
            steps{
                sh '''wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y'''
            }
        }
        stage "terraform_operations"{
            steps{
                sh 'terraform init -upgrade'
                sh 'terraform apply -auto-approve'
            }
        }
    }
}