
#   Assignment 02

##  Problem Statements

Topics Covered:  (User Authentication, User Authorization)
Assignment on Authentication and Authorization

Their is an organization which has 3 teams
- Developer
- Devops
- Testing

First you need to create 9 dummy jenkins jobs.Each job will print their jobname, build number.

For Developer create 3 dummy jobs.In developer view
-    job1:- dev-1
-    job2:- dev-2
-    job3:- dev-3

For Testing create 3 dummy jobs. In testing view
-    job1:- test-1
-    job2:- test-2
-    job3:- test-3
For Devops create 3 dummy jobs. In devops view
-    job1:- devops-1
-    job2:- devops-2
-    job3:- devops-3
        
Users in each team: 
    
    developer: [ They can see only dev jobs, can build it, see workspace and configure it ]
        - developer-1 
        - developer-2 
    testing: [ They can see all test jobs ,can build it, see workspace and can configure it, | They can also view dev jobs ]
        - testing-1 
        - testing-2 
    devops:  [ They can see all devops jobs ,can build it, see workspace and can configure it, | They can also view dev and test jobs  ]
        - devops-1 
        - devops-2
            admin
    admin-1 [ It will have full access ]

See what Authorization strategy suits it and implement it.

Also go through all authorization strategy
-   Legacy mode
-   Project Based
-   Matrix Based
-   Role-Based

Point 2:-
-   Enable SSO with Goggle

## Plugin's  used.

[![Jenkins Plugin](https://img.shields.io/badge/Role_Based_Authorization_Strategy-red.svg)](https://plugins.jenkins.io/role-strategy/)

## Step1 : create 9 dummy jenkins jobs like this way Each job will print their jobname, build number.
- Developer - dev-1, dev-2, dev-3.
- Testing - test-1, test-2, test-3.
- Devops - devops-1, devops-2, devops-3.

For Example shown below :
- Create a freestyle project by selecting new item in dashboad.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/4ba43855-11e5-44c1-906b-4f5331b44874)
- Go to the Execute shell in "Build Steps" To print job name and build number as shown in image below.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/0685ba46-3daa-4ef6-bdf1-fcf70f124946)
- Run the job It will show the console output.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/5b891cdf-be36-4b44-9a0f-e3b70a34de55)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/56fb1e15-4c9d-450b-8099-453d76cfea0b)

## Similarly generate all the 8 remaining jobs.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/00feb1ca-e33c-485e-8d8f-31fede022b1a)

## Step2 : Create a view to sort job.
### Developer view
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/eb3151c9-0af9-487e-849c-962013b791b3)
### Testing view
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/6748db36-85b8-478a-b0dd-633276d90d4d)
### Devops view
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/ebf05385-845a-496b-8bc4-03b6557d2174)

## Step3 : Create Users :
- Dashboard >> Manage Jenkins >> Users >> Create User
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/db52a80b-3803-4703-ae2c-d2db1b787194)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/9c9f6681-114d-4af1-80ab-c807398a4200)

### Similarly create user's for different roles listed below.
### For developer role 
- developer-1 
- developer-2 
### For testing role
- testing-1 
- testing-2
### For devops role
- devops-1 
- devops-2

![image](https://github.com/Kiran-dehlikar/test/assets/104997588/6e048222-1ad8-42d9-b583-003f5c113432)


## Step4 : Install plugin "Role-based Authorization Strategy"
- Dashboard > Manage Jenkins > Plugins > Available Plugin > Role-based Authorization Strategy
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/6bde33d5-cb8e-4ee0-8815-4881263111de)

- Configuration : Dashboard > Manage Jenkins > Security > Authentication > Role-based
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/6b9206d6-e7f6-44cd-b0e4-369d3640527d)

## Step5 : Configuration of Jobs 
### Dashboard > Manage Jenkins > Manage and Assign Role > Manage roles
- Follow the steps as shown below.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/aa6921cf-9e4e-43d3-9f0c-ef8f310aaba5)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/35d78937-f691-449c-aba4-3a6f4aab976e)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/c705cd23-58a4-4af1-a5c0-11035cf9722b)

### Dashboard > Manage Jenkins > Manage and Assign Role > Assign Roles
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/ae81d251-a17d-4153-af6f-e31ae08b4c6d)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/7ea07783-c30e-4ae7-aef7-49579981be49)

## Step6 : Output's
### Login using user developer-1
- Here you will see "developer-1" user can see/read all developer jobs and write/run builds as well.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/43aeb134-0e85-4fee-9da0-6d2390b97fec)

### Login using user testing-1
- Here you will see "testing-1" user can see/read all developer user jobs and  write/run builds all testing jobs.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/939cdcc9-bcd1-4837-b0e2-0c8ccc957176)

### Login using user devops-1
- Here you will see "devops-1" user can see/read all developer and testing user jobs and  write/run builds all devops jobs.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/2d7aaffd-08a4-4e87-a0b1-4996bf6aed49)
## Authors

- [Kiran Dehlikar](https://github.com/Kiran-dehlikar)
