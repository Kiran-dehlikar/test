#   Assignment 02

## Day 1 task
- Create instance and install nginx on that, after that create an AMI-1
- Create instance from the above AMI-1 and make V1
- Do some changes in same instance and  again create AMI-2 
- Create instance from the above AMI-2 and make V2
- Make both V1 and V2 AMI's 
- Now you have 2 AMI's total 

You have to continue the strategy with autoscaling group, attach asg on LB and follow the same strategy and make this highly available by testing load test on the nginx server so that it would autoscale at the time of load.
 
Attach the policy to asg and increase the stress according to policy mentioned then analyse the result. ( Try every policy )
    - Avg CPU utilization
    - Network bytes in/out
    - ALB requests count per target.
Somehow client needs version upgrade in Nginx so please upgrade V1 to V2 that you have made

"""But the client has complained to us that our new version V2 is not compatible with the service, so please revert back. You need to revert back to the previous version. """

## First Create a basic infra.
## 1. VPC
![Screenshot 2024-01-25 124104](https://github.com/Kiran-dehlikar/test/assets/104997588/a78f5bfa-e5b4-4cf2-b99f-0e0b8d07cd9d)

## 2. Subnet
![Screenshot 2024-01-25 124145](https://github.com/Kiran-dehlikar/test/assets/104997588/3fd4ebc5-bca5-4ff5-b1fd-8e7929c7c0a8)

## 3. IGW
![Screenshot 2024-01-25 124203](https://github.com/Kiran-dehlikar/test/assets/104997588/9b11e22c-9303-43b8-a674-ecc7e5ae2c77)

## 4. Nat
![Screenshot 2024-01-25 124230](https://github.com/Kiran-dehlikar/test/assets/104997588/8587f30e-a2d8-454c-8381-979a7a610869)


## 5. Route Table
![Screenshot 2024-01-25 124318](https://github.com/Kiran-dehlikar/test/assets/104997588/71e0daaf-6284-4bd2-9e08-7e466bc7a01c)

## 6. Instance
![Screenshot 2024-01-25 124348](https://github.com/Kiran-dehlikar/test/assets/104997588/a9549f94-6b46-4691-8206-bb544a39bf2e)

## 7. Target Groups
![Screenshot 2024-01-25 124416](https://github.com/Kiran-dehlikar/test/assets/104997588/2d5e0cde-b046-4a6f-9456-cf50463e9958)

## 8. Load Balancer 
![Screenshot 2024-01-25 124448](https://github.com/Kiran-dehlikar/test/assets/104997588/cc29cc04-3fc1-4422-9183-225624d3c448)

## 9. AMI for Version 1 and 2
![Screenshot 2024-01-25 124505](https://github.com/Kiran-dehlikar/test/assets/104997588/7592a370-1662-4028-b803-5ae25b125d92)

## Now Create Launch Template for V1 
![Screenshot 2024-01-25 125051](https://github.com/Kiran-dehlikar/test/assets/104997588/393a492a-5051-48e2-91ea-71a22119a714)

## Create a autoscaling group using target traking policy and add the created launch template in it.
### Here I select the minimum and desired value 1 and max 3.
![Screenshot 2024-01-25 125051](https://github.com/Kiran-dehlikar/test/assets/104997588/ad01068c-44b4-4355-bb29-c7c34ee3a603)
![Screenshot 2024-01-25 125225](https://github.com/Kiran-dehlikar/test/assets/104997588/55075458-462f-42cd-ba33-481dcac90440)
![Screenshot 2024-01-25 125701](https://github.com/Kiran-dehlikar/test/assets/104997588/cdaf05f0-8753-4e7f-8b5e-16b025e499fb)

## As I increase the load in cpu it scale out the instances as shown below.
![Screenshot 2024-01-25 130536](https://github.com/Kiran-dehlikar/test/assets/104997588/4939e718-797d-4deb-9f36-0c67023fb08b)
![Screenshot 2024-01-25 130853](https://github.com/Kiran-dehlikar/test/assets/104997588/d0c2e4e8-b2e0-4504-ac7f-f1258fce5d8b)
![Screenshot 2024-01-25 131553](https://github.com/Kiran-dehlikar/test/assets/104997588/c0edb008-fc72-4aec-bdfb-28d698ff6eaa)

## As the load decrease its scale in or draining
![Screenshot 2024-01-25 132023](https://github.com/Kiran-dehlikar/test/assets/104997588/c1505b04-0ac3-4fff-b281-1dd03adfe30e)
## Now update the policy for network 
![Screenshot 2024-01-25 134548](https://github.com/Kiran-dehlikar/test/assets/104997588/299e252c-6eef-4df5-92e3-de6134527009)
## Increase the request count 
![Screenshot 2024-01-25 134602](https://github.com/Kiran-dehlikar/test/assets/104997588/03b90643-1057-4305-9ebc-25a3e74f98e7)

## Once the cloudwatch alarm is in alarm state it will launch new instances to manage the load as shown in screenshots.As you see graph is increasing.
![Screenshot 2024-01-25 134631](https://github.com/Kiran-dehlikar/test/assets/104997588/b0d8e20e-88a6-4b1e-bb9f-de653c66220f)

## Autoscaling group scaling out the instance
![Screenshot 2024-01-25 134645](https://github.com/Kiran-dehlikar/test/assets/104997588/b9694653-2afb-459c-82e6-d485ba251ab3)

## Once the load decrease the its started draining out
![Screenshot 2024-01-25 134902](https://github.com/Kiran-dehlikar/test/assets/104997588/780293b5-6038-401d-88ba-28fda4f8df4a)

## As the client needs changes, changing version V1 to V2 in auto scaling group select the Active instance refres
## New instance is created with new version V2.
![Screenshot 2024-01-25 140051](https://github.com/Kiran-dehlikar/test/assets/104997588/7ef2e799-d356-4ec3-838f-d9542e044f9b)
![Screenshot 2024-01-25 140014](https://github.com/Kiran-dehlikar/test/assets/104997588/57c195d4-3bfb-4c99-91c7-274b70ca0c44)
![Screenshot 2024-01-25 140038](https://github.com/Kiran-dehlikar/test/assets/104997588/832beac5-14aa-426e-92e9-c606a0bc2970)

## As any issue in new version so we want to revert bach to the older version, it should be done using roleback option as shown in screen shots below.
![Screenshot 2024-01-25 140819](https://github.com/Kiran-dehlikar/test/assets/104997588/38266205-f311-4134-a85c-cfa0c5416454)
![Screenshot 2024-01-25 140834](https://github.com/Kiran-dehlikar/test/assets/104997588/18fa8f23-4f4f-4ff0-a1af-05ea81a6e7e3)
![Screenshot 2024-01-25 140316](https://github.com/Kiran-dehlikar/test/assets/104997588/e03cb911-2bb7-4d83-be38-a4a9beb0b9f4)
## Go to the browser and hit LB dns
![Screenshot 2024-01-25 144852](https://github.com/Kiran-dehlikar/test/assets/104997588/016b486b-d0cb-411d-b96f-88267ece38bc)


## Day 2
Day 2: """Client has told you about the change in it's Nginx as he needs this tool as hosting webpage too, so you need to plan accordingly. Also, he has specially mentioned that all tasks should be performed from their AWS environment, which means all O/P would be done through EC2 only. """

- You need to pull image content which would be display at the time of webpage hosting from VCS git and push your images on S3 bucket using aws-cli. (Do not use secrete and access keys)

- You need to create a frontend including images in nginx page which will be fetched directly from S3 bucket.

## As the client told us to use nginx as hosting webpage.
## First Create a IAM role EC2
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/2cf8e038-1e1a-4368-b631-62e6f28410ac)
## Create IAM policy to access S3
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/6bce065f-c81d-432f-b724-7701d136902f)
## Attach IAM policy to IAM role
![Screenshot 2024-01-25 150950](https://github.com/Kiran-dehlikar/test/assets/104997588/928b825e-f4cb-4d72-b244-4b2d10d13e57)

## Push images form that ec2 instance to s3 bucket
![Screenshot 2024-01-25 150650](https://github.com/Kiran-dehlikar/test/assets/104997588/2c16378c-b2de-4452-9257-b0e967c4af06)

## Create a frontend including images in nginx page which will be fetched directly from S3 bucket.
![image](https://github.com/OT-MyGurukulam/AWS_Batch24/assets/153828272/f42f8069-5648-4af9-bc96-420db3320b81)

## Go to browser and hit the lb dns 
![Screenshot 2024-01-25 152215](https://github.com/Kiran-dehlikar/test/assets/104997588/cdb61462-d050-4f43-8ef6-18e315935c9d)


## Day 3
Day3:
"""Now client has again told us to test it continuously to see if ASG is working or not if my server got unhealthy.""" 

Enter in the server and make some changes in server in order to make server unhealthy. Now analyze the result to see how ASG can help you to maintain your instance desire state.

==========================================
(Remember the special points from client)
NOTE 1: You need to create the utility in such a way that it will make AMI of specific version and attach to the asg and perform the rolling deployment strategie. In case of revert back you should also have the function of revert back feature. 

## For testing asg 
![Screenshot 2024-01-25 151859](https://github.com/Kiran-dehlikar/test/assets/104997588/64830724-1302-4aed-98d5-dbe84024b454)
![Screenshot 2024-01-25 151938](https://github.com/Kiran-dehlikar/test/assets/104997588/352dcf0d-5ac8-4716-b7ad-95eaee21bfc6)
![Screenshot 2024-01-25 152019](https://github.com/Kiran-dehlikar/test/assets/104997588/4afb871c-43b1-4a8f-acfb-cda2867524d8)
![Screenshot 2024-01-25 152135](https://github.com/Kiran-dehlikar/test/assets/104997588/a26ce742-35ae-491b-bd73-583e144bae1f)
![Screenshot 2024-01-25 152215](https://github.com/Kiran-dehlikar/test/assets/104997588/4a860c0b-55e0-4812-9161-1244cb69ab64)
## Now changing template
![Screenshot 2024-01-25 152406](https://github.com/Kiran-dehlikar/test/assets/104997588/b7929738-f6e1-44d2-809e-5148b7788287)
![Screenshot 2024-01-25 152609](https://github.com/Kiran-dehlikar/test/assets/104997588/80db05cc-42c5-4f30-93c1-594b7182a1e1)
![Screenshot 2024-01-25 152703](https://github.com/Kiran-dehlikar/test/assets/104997588/197463b3-5972-4b3f-99ef-22bfb1b23262)
## I go to the server and change the nginx port to what happend.
![Screenshot 2024-01-25 153901](https://github.com/Kiran-dehlikar/test/assets/104997588/ae8fd520-1a47-456d-a406-6f1154ebc3ce)
## Restart Nginx service
![Screenshot 2024-01-25 154439](https://github.com/Kiran-dehlikar/test/assets/104997588/4bb9eacf-7e69-49b7-af36-e0c8ce25faa5)

## Observation as shown in below screenshots
![Screenshot 2024-01-25 154513](https://github.com/Kiran-dehlikar/test/assets/104997588/b59dc686-6222-423c-b55d-ba4a2e14dfb2)
![Screenshot 2024-01-25 155002](https://github.com/Kiran-dehlikar/test/assets/104997588/30baae9e-0266-4cdf-a1f8-56e8d27c073e)

## Day 4
Day4:
"""Client called devOps and asked if it was possible to get the two different details with single LB DNS, as he has two webpages and wants to pass the traffic through a single ALB but with a different path, like app.opstree.com/path1 or app.opstree.com/path2. """ 

You have told him yes, it is possible with path-based routing in the ALB. Now do the following:

## Use existing Nginx and there should be 1 ec2 in each private subnet .
    - 1 bastion host in public subnet .
    - port 22 of bastion host should only accessible from your public ip.
    - nginx welcome page with path '/ninja1' on first ec2 should display `Image-1`.
    - nginx welcome page with path '/ninja2' on second ec2 should display `Image-2`.
    - port 22 of  both the nginx servers should only be accessible from  bastion host.

## Create target group for each nginx server. (2 servers)
## Create Application load balancer.
    - port 80 open of nginx server should only be accessible from your ALB.
    - port 80 open of ALB should only be accessible from your public IP.
    - ALB should only be accessible though your public IP none else.
    - create listener rule so that {YOUR-ALB-DNS-NAME}/ninja1 should display welcome page of first ec2.
    - create listener rule so that {YOUR-ALB-DNS-NAME}/ninja2 should display welcome page of second ec2.

## Push all the updated images of the webpage to S3 bucket defined folders through any EC2 instance and maintain repo on that server only.
## As per the client requirement we made the changes.
## Go to the Load Balancer and add the rules as shown below and same has to update the EC2 server to fetch content at path.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/d8144c58-f9c4-484e-8ee6-e22ef013cfb6)
## Now hit the LB dns it will show nginx page
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/418a96f5-ea19-4120-840b-a2e45a983a03)
## Now hit the same dns using /ninja1
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/541ad2a3-6579-4274-a572-142d724d517c)
## Now hit the same dns using /ninja2
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/b73a41ff-488f-4d19-ac77-a24e8e837bc1)


## Day 5
Day5: 
"""Client asked for S3 service and bucket to be deployed in the US-East-1 region and segregate the folders with env names with proper restrictions."""

## You need to create a IAM user and a S3 Bucket on any of the region, Kindly follow as mentioned below :
 - Create 2 folders prod and nonprod inside that bucket.
 - Upload any different image files inside both folders.
 - Create a role for the above specific task and it should only be access S3 full access
 - A bucket should only be accessible from your both root, IAM user and nginx application.
 - Restrict the access of IAM user to not access prod folder but able to access the nonprod folder.
 - Set IAM and bucket policies in such a way that it accomplished the above points.

## Day 6
"""Client facing issue with some policy in IAM. Earlier,  he assigned one policy to S3, but if he assigned the same to CDN, then it showed an error. He called the devOps for this anonymous issue.""" 

DevOps told him that it needs to be validated through a trust relationship in the IAM service

## suppose organization wants to get the page access quick, so you need to implement CDN and fetch the images through CDN instead S3, use same role in the CDN which you are using in EC2 without any modification of policy.

## Make your own IAM user and assign minimal permissions to yourself for this task.




## Authors

- [Kiran Dehlikar](https://github.com/Kiran-dehlikar)
