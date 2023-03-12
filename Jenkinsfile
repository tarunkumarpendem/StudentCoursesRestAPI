pipeline{
    agent{
        label 'docker'
    }
    triggers{
        cron('30 13 * * 7')
    }
    stages{
        stage('clone'){
            steps{
                git url: 'https://github.com/tarunkumarpendem/StudentCoursesRestAPI.git',
                    branch: 'sprint_1'
            }
        }
        stage('image build and push'){
            steps{
                sh """
                      docker image build -t tarunkumarpendem/student-api:12-03-2023-release .
                      docker push tarunkumarpendem/student-api:12-03-2023-release
                      docker image ls
                    """  
            }
        }
    }
}