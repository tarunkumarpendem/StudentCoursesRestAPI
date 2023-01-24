pipeline{
    agent{
        label 'node-1'
    }
    /*triggers{
        pollSCM('* * * * *')
    }*/
    parameters{
        choice(name: 'Branch_Name', choices: ['dev', 'qa', 'uat', 'prod', 'main'], description: 'Selecting branch to build the dokcer image')
    }
    stages{
        stage('Image build, Tag and push'){
            steps{
                script{
                    def ECR = "097018296722.dkr.ecr.us-east-1.amazonaws.com/aws-ecr"
                    def default_image_name_dev = "StudentCoursesRestAPI-dev"
                    def default_image_name_qa = "StudentCoursesRestAPI-qa"
                    def default_image_name_uat = "StudentCoursesRestAPI-uat"
                    def default_image_name_prod = "StudentCoursesRestAPI-prod"
                    def default_image_tag = "1.0"
                    if (params['Branch_Name' == "dev"]){
                        sh """
                              docker image build -t ${default_image_name_dev}:${default_image_tag}
                              docker tag ${default_image_name_dev}:${default_image_tag} ${REG}:${params.Branch_Name}-${BUILD_NUMBER}
                              docker push ${REG}:${params.Branch_Name}-${BUILD_NUMBER}
                              echo image build, tag and push is completed for ${params.Branch_Name}
                              """
                    }
                    else if (params['Branch_Name' == "qa"]){
                        sh """
                              docker image build -t ${default_image_name_qa}:${default_image_tag}
                              docker tag ${default_image_name_qa}:${default_image_tag} ${REG}:${params.Branch_Name}-${BUILD_NUMBER}
                              docker push ${REG}:${params.Branch_Name}-${BUILD_NUMBER}
                              echo image build, tag and push is completed for ${params.Branch_Name}
                              """
                    }
                    else if (params['Branch_Name' == "uat"]){
                        sh """
                              docker image build -t ${default_image_name_uat}:${default_image_tag}
                              docker tag ${default_image_name_uat}:${default_image_tag} ${REG}:${params.Branch_Name}-${BUILD_NUMBER}
                              docker push ${REG}:${params.Branch_Name}-${BUILD_NUMBER}
                              echo image build, tag and push is completed for ${params.Branch_Name}
                              """
                    }
                    else if (params['Branch_Name' == "prod"]){
                        sh """
                              docker image build -t ${default_image_name_prod}:${default_image_tag}
                              docker tag ${default_image_name_prod}:${default_image_tag} ${REG}:${params.Branch_Name}-${BUILD_NUMBER}
                              docker push ${REG}:${params.Branch_Name}-${BUILD_NUMBER}
                              echo image build, tag and push is completed for ${params.Branch_Name}
                              """
                    }
                    else if (params['Branch_Name' == "main"]){
                        sh """
                              docker image build -t ${default_image_name_prod}:${default_image_tag}
                              docker tag ${default_image_name_prod}:${default_image_tag} ${REG}:${params.Branch_Name}-${BUILD_NUMBER}
                              echo image build and tag is completed for ${params.Branch_Name}
                              """
                    }
                    else{
                        echo image build is not applicable
                    }
                }
            }
        }
    }
    post{
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
    }
}
