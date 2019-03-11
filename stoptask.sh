#!/bin/bash

cluster=default
container_instance=  # container instance guid

tasks=$(aws --region us-west-2 ecs list-tasks --container-instance $container_instance --cluster $cluster | jq -r '.taskArns | map(.[40:]) | reduce .[] as $item (""; . + $item + " ")')
for task in $tasks; do
	aws --region us-west-2 ecs stop-task --task $task --cluster $cluster
done
aws --region us-west-2 ecs deregister-container-instance --cluster $cluster --container-instance $container_instance
