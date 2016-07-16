# Docker Container for Wordpress Specific Deployment Service

The container provides a runtime environment for a SaltStack and AWS SDK based deployment service.
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

Create a docker image with ```docker build -t <containerName> <pathToDockerfile>``` and run a container with ```docker run -p 40011:40011 <containerName>```
