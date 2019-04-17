#!/bin/bash
random=`date +%s`
echo $random > start.txt
NODENAME=$random-node

echo "======== SETUP ========"
echo "Step 1 : Killing all containers"
docker kill $(docker ps -q)

echo "Step 2: Pruning all stopped containers"
docker container prune

echo "Step 3: Starting new containers with generic-node"
for (( i=1; i<=$1; i++ ))
do
	echo "Starting Node : $NODENAME$i"
	docker run -d --name $NODENAME$i -t generic-node
done

echo "Step 4: Starting node application on every container"
for (( i=1; i<=$1; i++ ))
do
	echo "Starting Apps on : $NODENAME$i"
	docker exec -d $NODENAME$i /node
done

echo "======= SETUP DONE ======="
