AWS: PROJECT-1

here i have planed to create an infra of 3 different instances with teraform code

    1-> ec2.tf
        under this teraform file i have coded to launch 3 different instance with 3 different ami
                ami
            ami 1 ubuntu
            ami 2 redhat
            ami 3 windows 2022
    2-> Network.tf
        under this terraform file i have configured the network of the infra
            that is:
                -> VPC
                    at "192.168.20.0/24"
                -> subnet
                    a single public subnet as availability_zone = "ap-south-1a"
                    and mapped auto public ip
                -> IGW
                    created a internet gateway and atteched it to the vpc
                -> route table
                    created a route table to create a route with internet gateway
                -> route table assositation
                    to associate 
                -> security group
                    configured firewall to inbound the traffic for ssh rds http ports and outbund of all ports

    3-> Provider.tf
        under this teraform file i have called the aws provider api and configured with my aws credential with access key and secret key and also configured the reagon

OUTPUT:
------
we have to follow these commands
    -> teraform init
        it will check the provider.tf file to call the api and download the mentioned api inside it and starts a communication between the local machine and the provider
            |   local_machine <-> teraform with provider api <-> provider   |
    -> teraform plan
        it will check the code in all tf files for error if not then it gives the output of what will happened by executing this code.
    -> teraform apply
        it will create all necessory thing first like vpc subnets route table igw route table association and security group and then it launch those 3 instance with those pre-configurations
    -> teraform destroy
        this command will reverse all the changes happend on teraform appy
