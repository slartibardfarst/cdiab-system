#cloud-boothook

#!/bin/bash
echo "replace old docker 1.7.x with 1.8.x" >> /var/log/terraform.log
yum -y remove docker >> /var/log/terraform.log
yum -y remove docker-engine >> /var/log/terraform.log
rm -rf /var/lib/docker

curl -sSL https://get.docker.com/ | sh >> /var/log/terraform.log

echo "***** docker startup" >> /var/log/terraform.log
systemctl start docker.service
systemctl enable docker.service

echo "***** docker installing ecs-agent" >> /var/log/terraform.log
docker run --name ecs-agent --detach=true --restart=on-failure:10 --volume=/var/run/docker.sock:/var/run/docker.sock --volume=/var/log/ecs/:/log --volume=/var/lib/ecs/data:/data --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro --volume=/var/run/docker/execdriver/native:/var/lib/docker/execdriver/native:ro --publish=127.0.0.1:51678:51678 --env=ECS_LOGFILE=/log/ecs-agent.log --env=ECS_LOGLEVEL=info --env=ECS_DATADIR=/data --env=ECS_CLUSTER=${ecs_cluster} amazon/amazon-ecs-agent:latest
echo "***** docker finished installing ecs-agent" >> /var/log/terraform.log

#echo "***** docker installing cloudwatchlogs" >> /var/log/terraform.log
#docker run -d -v /var/run/docker.sock:/var/run/docker.sock dberesford/docker-cloudwatchlogs -r us-west-2 -g ecs -t ${ecs_cluster}
#echo "***** docker finished installing cloudwatchlogs" >> /var/log/terraform.log

