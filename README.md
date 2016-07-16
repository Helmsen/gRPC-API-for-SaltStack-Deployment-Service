# Wordpress gRPC

This project contains three docker containers. The deployment service container provides a runtime environment for a SaltStack and AWS SDK based deployment service.
The service provides Wordpress specific and generic deployment functions. You can
* start EC2 instances
* terminate EC2 instances
* query details about EC2 instances (public IP, public DNS, etc.)
* deploy MySQL on a remote machine
* deploy Wordpress on a remote machine
* connect a Wordpress instance to a MySQL instance
* deploy a generic SaltStack-State-File on a remote machine
* backup a MySQL database
* restore a MySQL backup

The wordpress deployment script container runs a test script which tests the wordpress specific deployment methods.
It starts two EC2 instances, deploys MySQL and Wordpress and connect these two components.

The generic deployment script container runs a test script, which tests the generic deployment service. Itstarts a EC2 instance and installs MySQL and Wordpress on it. Important: The generic deployment method applies SaltStateFiles (ssl) on a remote machine. But it can not send customized files to a remote machine. Thus it is not possible to configure installed application (we would have to send a customized config file). So you have to set the database of the wordpress installation manually (via browser).

There is a preconfigured scenario for each test script (```docker-compose-wordpress.yml``` and ```docker-compose-generic.yml```).
Run a preconfigured wordpress deployment scenario with ```docker-compose up -f <nameOfComposeFile>```. But before you have to provide some AWS information in the corresponding compose file:
* ```KEY_ID```: Your AWS access key id
* ```KEY_SECRET```: Your AWS access key secret
* ```KEY_PAIR_NAME```: Name of the SSH-Key pair you want to use to start the EC2 instance (must exist in AWS management console)
* ```SECURITY_GROUP_NAME```: Name of the security group you want to use to configure the EC2 instance (must exist in AWS management console)

The private ssh-key of the specified KEY_PAIR_NAME must be present in the docker container directory (```DockerContainerWordpressDeploymentScript``` or ```DockerContainerGenericDeploymentScript```) before you run the test script and must be named as ```key.pem```.
