# Wordpress gRPC

This project contains two docker containers. The deployment service container provides a runtime environment for a SaltStack and AWS SDK based deployment service.
The service provides Wordpress specific and generic deployment deployment functions. You can
* start EC2 instances
* terminate EC2 instances
* query details about EC2 instances (public IP, public DNS, etc.)
* deploy MySQL on a remote machine
* deploy Wordpress on a remote machine
* connect a Wordpress instance to a MySQL instance
* deploy a generic SaltStack-State-File on a remote machine
* backup a MySQL database
* restore a MySQL backup

The deployment script container runs a test script which starts two EC2 instances, deploy MySQL and Wordpress and connect these two components.

Run a preconfigured wordpress deployment scenario with ```docker-compose up```. But before you have to provide some AWS information in docker-compose.yml
* ```KEY_ID```: Your AWS access key id
* ```KEY_SECRET```: Your AWS access key secret
* ```KEY_PAIR_NAME```: Name of the SSH-Key pair you want to use to start the EC2 instance (must exist in AWS management console)
* ```SECURITY_GROUP_NAME```: Name of the security group you want to use to configure the EC2 instance (must exist in AWS management console)

The private ssh-key of the specified KEY_PAIR_NAME must be present in DockerContainerDeploymentScript/ before you run the test script and must be named as ```key.pem```.
