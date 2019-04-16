
echo "======== SETUP ========"
echo "Step 1 : Killing all containers"
docker kill node0 node1 node2 node3 node4

echo "Step 2: Pruning all stopped containers"
docker container prune

echo "Step 3: Starting new containers with generic-node"
docker run -d --name node0 -t generic-node
docker run -d --name node1 -t generic-node
docker run -d --name node2 -t generic-node
docker run -d --name node3 -t generic-node
docker run -d --name node4 -t generic-node

echo "Step 4: Starting node application on every container"
docker exec -d node0 /node
docker exec -d node1 /node
docker exec -d node2 /node
docker exec -d node3 /node
docker exec -d node4 /node

echo "======= SETUP DONE ======="
