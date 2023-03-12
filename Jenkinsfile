pipeline{
    agent{
        label 'docker'
    }
    triggers{
        pollSCM('* * * * *')
    }
    stages{
        stage('clone'){
            steps{
                git url: 'https://github.com/tarunkumarpendem/StudentCoursesRestAPI.git',
                    branch: 'develop'
            }
        }
        stage('image build and push'){
            steps{
                sh """
                      docker image build -t tarunkumarpendem/student-api:12-03-2023 .
                      docker push tarunkumarpendem/student-api:12-03-2023
                      docker image rm -f tarunkumarpendem/spc:12-03-2023
                      docker image ls 
                    """  
            }
        }
    }
}