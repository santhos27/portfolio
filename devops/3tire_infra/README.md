# portfolio
Here is my portfolio

AWS:
1-> ec2.tf
    under this terraform file i have planned to launch 3 instance
      instance 01:
        Its a ubuntu 24.04, used as webserver in subnet 192.168.10.0/26 , AZ - ap-south-1a
      
      instance 02:
        Its a ubuntu 24.04, used as webserver in subnet 192.168.10.64/26 , AZ - ap-south-1b

      instance 03:
        Its a ubuntu 24.04, used as Database in subnet 192.168.10.129/26 , AZ - ap-south-1a

2-> vpc.tf
    Under this terraform file, I have planned the network of the infra
        that is:
            -> VPC
                The Network i have planed to provisioned at "192.168.10.0/24" total ips 256ip.
                From that i have divided into 2 public subnets 192.168.10.0/26 , 192.168.10.64/26 & 1 private 192.168.10.129/26.
                each subnets contains 64 ips,
            -> availability_zone
               availability_zone = "ap-south-1a, ap-south-1b"
            -> Subnets
                Public Subnet = 192.168.10.0/26 , AZ - ap-south-1a, 192.168.10.64/26 , AZ - ap-south-1b
                Private Subnet = 192.168.10.129/26 , AZ - ap-south-1a
            -> IGW
                created a internet gateway and atteched it to the vpc
            -> NAT Gateway
                Created NAT Gateway to create a secure connection between public ans private subnets
            -> Elastic IP
                created a EIP for NAT Gateway to communicate it with the Public Subnet via IGW
            -> route table
                created a public route table for public subnets to create a route with internet gateway
                created a private route table for private subnets to create a route with NAT gateway
            -> route table assositation
                Public route table assoditated with public subnets
                Private route table assoditated with private subnets
            -> security group
                configured firewall to inbound the traffic for ssh and http ports and outbund of all ports

3-> Provider.tf
    under this terraform file i have planned to called the aws provider api and configured with my aws credential with access key and secret key

OUTPUT:

      A project to deploy a 3 tire architure infra over aws on a single vpc with two public subnets and one private subnets and launched a instance on each subnets and attached the public subnet with igw and attached the private subnets with nat and created two route tablbes for public and private subnets also and  associated them.
      Instance in public instance are used as web servers
      Instance in private instance are used as database and logical servers
        so that no one can have access the private instance directly. only with the help of public instance through the nat gateway we can access those private subnets
