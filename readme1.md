
# Assignment 01

#  Problem Statements
## Infrastructure as a Code
### Task Description 

- Create the following resources using terraform resource block :
    - Create 1 VPC 
        - eg : `ninja-vpc-01`
    - Create 4 Subnet
        - 2 public subnet
            - eg : `ninja-pub-sub-01/02`
        - 2 private subnet
            - eg : `ninja-priv-sub-01/02`
    - Create instances in it ( bastion and private instance)
    - Create 1 IGW
        - eg : `ninja-igw-01`
    - Create 1 NAT 
        - eg : `ninja-nat-01`
    - Create 2 Route Table
        - 1 for public subnet
            - eg : `ninja-route-pub-01/02`
        - 1 for private subnet
            - eg : `ninja-route-priv-01/02`

**Note: Make maximum use of variables and output files**


## Lets run the code first terraform init
## Command : terraform init
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/bdbea11b-0448-481a-8804-df0b05b1ad6e)

## Terraform plan
## Command : terraform plan

![image](https://github.com/Kiran-dehlikar/test/assets/104997588/8a009950-472a-4f5d-9504-e9655148e52d)

## Terraform apply
## Command : terraform apply --auto-approve
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/f8a9aa3a-fbd2-44eb-af16-3bb8e21e4c0f)

## Verify the infra
### VPC
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/903f8666-7858-48c4-b812-8323eb42af28)

## SUBNET
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/da132375-239e-41b2-966d-ba4da4aaca04)

## IGW
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/b93d76cf-8593-41ac-9b64-fa3a7894d6f2)

## NAT
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/e2f93563-29ac-4e25-a385-6ea14c5c5545)

## Route Table
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/2ca0bd54-70e2-43c9-95df-b9016ed71685)

## Instance
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/bd8f5e86-1451-4f56-b2e4-0ab280af4add)


## Authors

- [Kiran Dehlikar](https://github.com/Kiran-dehlikar)
