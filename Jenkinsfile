node {
  stage('checkout') {
        checkout scm
  }
  
  parameters {
    string(name: 'REPONAME', defaultValue: 'example/nginx', description: 'AWS ECR Repository Name')
    string(name: 'ECR', defaultValue: '447895454160.dkr.ecr.us-east-1.amazonaws.com/example/nginx', description: 'AWS ECR Registry URI')
    string(name: 'REGION', defaultValue: 'us-east-1', description: 'AWS Region code')
    string(name: 'CLUSTER', defaultValue: 'DevopsTest', description: 'AWS ECS Cluster name')
    string(name: 'TASK', defaultValue: 'ExampleTask', description: 'AWS ECS Task name')
    string(name: 'Version', defaultValue: 'New', description: 'AWS ECS TD status')
  }
  
    
    stage('Stage:TD') {

        sh 'aws ecs register-task-definition --cli-input-json file://task_definition.json' 
      }
    
   stage('Stage:Service')
       if (params.Version == 'New')
       {  
        sh 'aws ecs create-service --cluster DevopsTest --service-name ecs-simple-service2 --task-definition ExampleTask --desired-count 3'
       }      
       else
       {
       sh 'aws ecs update-service --cluster DevopsTest --service ecs-simple-service2 --task-definition ExampleTask --desired-count 3'
       }
}
  





