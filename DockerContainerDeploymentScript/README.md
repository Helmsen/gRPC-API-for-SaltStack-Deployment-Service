# Docker Container for Test Script

This docker container runs a test script, which tests the wordpress specific deployment service. Before you run a container, provide some AWS information in the Dockerfile:
* ```KEY_ID```: Your AWS access key id
* ```KEY_SECRET```: Your AWS access key secret
* ```KEY_PAIR_NAME```: Name of the SSH-Key pair you want to use to start the EC2 instance (must exist in AWS management console)
* ```SECURITY_GROUP_NAME```: Name of the security group you want to use to configure the EC2 instance (must exist in AWS management console)

The private ssh-key of the specified KEY_PAIR_NAME must be present in DockerContainerDeploymentScript/ before you run the test script and must be named as ```key.pem```.

Create a docker image with ```docker build -t teamsaltstack/t1c2 <pathToDockerfile>``` and run a container with ```docker run teamsaltstack/t1c2```
