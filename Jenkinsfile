pipeline{
    agent none
    /*triggers{
        pollSCM('* * * * *')
    }*/
    parameters{
        //choice(name: 'Branch_Name', choices: ['dev', 'qa', 'uat', 'prod'], description: 'Selecting branch to build the docker image')
        choice(name: 'Infra_Branch_Name', choices: ['main'], description: 'Selecting branch to build the EKS')
    }
    stages{
        /*stage('clone'){
            agent{
                label 'node-1'
            }
            steps{
                git url: 'https://github.com/tarunkumarpendem/StudentCoursesRestAPI.git',
                    branch: "${params.Branch_Name}"
            }
        }*/
        // stage('Removing existing images'){
        //     steps{
        //         sh """
        //               docker image rm $(docker image ls -q)
        //             """  
        //     }
        // }
        /*stage('Image build, Tag and push'){
            agent{
                label 'node-1'
            }
            steps{
                script{
                    def ECR = "097018296722.dkr.ecr.us-east-1.amazonaws.com/aws-ecr"
                    def default_image_name_dev = "student-courses-rest-api/dev"
                    def default_image_name_qa = "student-courses-rest-api/qa"
                    def default_image_name_uat = "student-courses-rest-api/uat"
                    def default_image_name_prod = "student-courses-rest-api/prod"
                    def default_image_tag = "1.0"
                    if (params['Branch_Name'] == "dev"){
                        sh """
                              docker image build -t ${default_image_name_dev}:${default_image_tag} .
                              docker tag ${default_image_name_dev}:${default_image_tag} ${ECR}:${params.Branch_Name}-${JOB_NAME}-${BUILD_ID}
                              docker push ${ECR}:${params.Branch_Name}-${JOB_NAME}-${BUILD_ID}
                              echo image build, tag and push is completed for "${params.Branch_Name}" branch
                              docker image rm -f ${default_image_name_dev}:${default_image_tag}
                              docker image ls
                              """
                    }
                    else if (params['Branch_Name'] == "qa"){
                        sh """
                              docker image build -t ${default_image_name_qa}:${default_image_tag} .
                              docker tag ${default_image_name_qa}:${default_image_tag} ${ECR}:${params.Branch_Name}-${JOB_NAME}-${BUILD_ID}
                              docker push ${ECR}:${params.Branch_Name}-${JOB_NAME}-${BUILD_ID}
                              echo image build, tag and push is completed for "${params.Branch_Name}" branch
                              docker image rm -f ${default_image_name_qa}:${default_image_tag}
                              docker image ls
                              """
                    }
                    else if (params['Branch_Name'] == "uat"){
                        sh """
                              docker image build -t ${default_image_name_uat}:${default_image_tag} .
                              docker tag ${default_image_name_uat}:${default_image_tag} ${ECR}:${params.Branch_Name}-${JOB_NAME}-${BUILD_ID}
                              docker push ${ECR}:${params.Branch_Name}-${JOB_NAME}-${BUILD_ID}
                              echo image build, tag and push is completed for "${params.Branch_Name}" branch
                              docker image rm -f ${default_image_name_uat}:${default_image_tag}
                              docker image ls
                              """
                    }
                    else if (params['Branch_Name'] == "prod"){
                        sh """
                              docker image build -t ${default_image_name_prod}:${default_image_tag} .
                              docker tag ${default_image_name_prod}:${default_image_tag} ${ECR}:${params.Branch_Name}-version-${JOB_NAME}-${BUILD_ID}
                              docker push ${ECR}:${params.Branch_Name}-version-${JOB_NAME}-${BUILD_ID}
                              echo image build, tag and push is completed for "${params.Branch_Name}" branch
                              docker image rm -f ${default_image_name_prod}:${default_image_tag}
                              docker image ls
                              """
                    }
                    else{
                        sh """
                              echo image build is failed for ${env.BUILD_NUMBER}
                            """  
                    }
                }
            }
        }*/
        // stage('kubectl and eksctl installation'){
        //     agent{
        //         label 'node-2-terraform'
        //     }
        //     steps{
        //         sh """
        //               curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.15/2023-01-11/bin/linux/amd64/kubectl
        //               openssl sha1 -sha256 kubectl
        //               chmod +x ./kubectl
        //               mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
        //               echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
        //               kubectl version --short --client
        //               curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
        //               sudo mv /tmp/eksctl /usr/local/bin
        //               eksctl version
        //             """  
        //     }
        // }
        stage('git clone'){
            agent{
                label 'node-2'
            }
            steps{
                git url: 'https://github.com/tarunkumarpendem/learn-terraform-provision-eks-cluster.git',
                    branch: "${params.Infra_Branch_Name}"
            }
        }
        // stage('Creating EKS Cluster'){
        //     agent{
        //         label 'node-2'
        //     }
        //     steps{
        //         sh """
        //               terraform init
        //               terraform apply -auto-approve
        //             """  
        //     }
        // }
        /*stage('Deployments'){
            agent{
                label 'node-2'
            }
            steps{
                sh """
                      kubectl apply -f ./Manifests/others
                      kubectl apply -f ./Manifests/database
                      kubectl apply -f ./Manifests/base/app-deploy.yaml
                      kubectl apply -f ./Manifests/base/app-svc.yaml
                    """  
            }
        }*/
    }
    /*post{
        always{
            echo 'build completed'
            mail to: 'tarunkumarpendem22@gmail.com',
                 subject: 'Job summary',
                 body: """Build is completed for $env.BUILD_URL"""
        }
        failure{
            echo 'build failed'
            mail to: 'tarunkumarpendem22@gmail.com',
                 subject: 'Job summary',
                 body: """Build is failed for $env.BUILD_NUMBER
                          $env.BUILD_URL
                          $env.BUILD_ID"""
        }
        success{
            echo 'build is success'
            mail to: 'tarunkumarpendem22@gmail.com',
                 subject: 'Job summary',
                 body: """Build is successfully completed for $env.BUILD_NUMBER
                          $env.BUILD_URL"""
        }
    }*/
}
