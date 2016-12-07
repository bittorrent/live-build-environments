# ubuntu-jenkins-slave

This template is for an Ubuntu Jenkins slave. Because the actual build environments for Linux are containerized, all it needs are the necessities to connect to Jenkins and run Docker.

To build the AMI, you'll need to have AWS credentials in one of the usual places, and you'll need to specify a VPC and public subnet to launch the builder in:

`packer build -var vpc_id=vpc-XXXXXXXX -var subnet_id=subnet-YYYYYYYY template.json`
