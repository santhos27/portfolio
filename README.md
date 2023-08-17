# portfolio
Here is my portfolio

AWS:
  project -1
  
      A minimal project to deploy a infra with 3 different instance in a vpc and on single subnet
    allowed the ports for inbound of ssh rdp and http and allowed the ports for outbound of all ports
  
  project -2

      A project to deploy a 3 tire architure infra over aws on a single vpc with two public subnets and two private subnets and launched a instance on each subnets and attached the public subnet with igw and attached the private subnets wit nat and assigned two eip for the instance inside the private subnets and created two route tablbes for public and private subnets also and  associated them.

      Instance in public instance are used as web servers
      Instance in private instance are used as database and logical servers
        so that no one can have access the private instance directly. only with the help of public instance through the nat gateway we can access those private subnets
