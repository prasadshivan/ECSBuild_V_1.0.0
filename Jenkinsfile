node {
  stage('checkout') {
        checkout scm
  }
  
    /* create a revision for existing task defenition */
    stage('Stage:TD') {

        sh 'aws ecs register-task-definition --cli-input-json file://task_definition.json' 
      }
    
  /* Update the existing service if the image is new and task definition is an existing one. 
  Create a a new service if the task defenition is new. */ 
  
   stage('Stage:Service')
       if (params.Version == 'New')
       {  
        sh 'aws ecs update-service --cluster DevopsTest --service ecs-simple-service2 --task-definition ExampleTask --desired-count 1'       
       }      
       else
       {
       sh 'aws ecs create-service --cluster DevopsTest --service-name ecs-simple-service2 --task-definition ExampleTask --desired-count 1'
       }
}
  





