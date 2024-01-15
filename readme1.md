
# Assignment 01

##  Problem Statements

Creating below Jenkins utilities to control operations in a Git repository.
Branch Exist:
-   Check if a specified branch exists in the repository.
Create Branch:
-   Create a new branch in the repository.
Merge 2 Branches:
-   Merge two branches
-   In case of failure generate an HTML report
Delete Branch:
-   Delete a specified branch in the repository.
List commit logs of Certain Branch
-   Should be able to accept search parameters
-   Should show it in HTML report
Good to do:
-   Managed these jobs via JOB DSL



## Plugin's  used.

[![Git Plugin](https://img.shields.io/badge/Git-green.svg)](https://plugins.jenkins.io/git/)

## Step1 : Check Branch exist or not.
### Create a freestyle project by selecting new item in dashboad.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/1e4c8d1d-72e3-4483-b568-106084881669)

### Now you enter the configuration page here select the string parameter in "general" tab, write the name(variable) and in default value enter branch name.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/0f9d2a56-51de-482b-a142-b4e10b22f42f)

### Next go to the "source code management" tab and select git repository and if repository is private then put credentials.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/03356751-1a44-48c1-b545-071b86a0225c)

### Next jump to the "build steps" tab select execute shell write the command shown in picture below and save/apply.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/87aa25c1-2f86-42e7-8f71-205cfc4bdf58)

### Now go to dashboard and select creted job you will see the "build with parameter" option click on it and enter branch name >> BUILD 
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/e95a802a-90af-428f-8fc5-7ddcbb9983d0)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/39a80159-88d2-4b64-a98a-962723f66f6c)

## Step2 : Create Branch on remote repository.

### Create a freestyle project by selecting new item in dashboad.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/0b572aa3-33df-4469-9bf5-c9a9afb29ffd)

### Now you enter the configuration page here select the string parameter in "general" tab, create a multiple string parameter branch(for selecting branch) , filename(to create file) and content(to write file content) shown below.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/f7452e82-58a3-4731-a648-462ce9246a27)

![image](https://github.com/Kiran-dehlikar/test/assets/104997588/a4870caf-4139-472f-a3e4-143c17af99cf)

![image](https://github.com/Kiran-dehlikar/test/assets/104997588/f41230ef-aefb-4398-b6e8-b6a744116fbb)

### Next go to the "source code management" tab and select git repository and if repository is private then put credentials.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/8d239627-6d4d-4676-b13e-bae8de9bb3c8)

### Next jump to the "build steps" tab select execute shell write the command shown in picture below and save/apply.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/7c7f82c6-912b-490c-b339-48515355d19c)

### In "post build action" tab select "git publisher" and go with the documents and save/apply. 
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/9ac61756-bcec-4f1e-b2e3-6d5756e6a4fc)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/5661aadd-a841-43b4-add2-835a7a42ccca)

### Now go to dashboard and select creted job you will see the "build with parameter" option click on it and enter branch name, file name and content >> BUILD 
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/ab61cc31-446a-429e-871a-b0a2d8ae271a)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/344a56c5-51c9-48ce-a7e6-21159a573ddf)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/61f50b16-6e65-40f6-a9b2-d7fee73af7f3)

### Output "raj" branch created in remote repo.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/55ee5d6c-f00f-475d-ac4f-5d7be3c562ef)


## Step3 : Merge Branch on remote repository.
### Create a freestyle project by selecting new item in dashboad.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/d8896b8a-e0c4-4828-8c49-0ca8e8a79aa2)

### Now you enter the configuration page here select the string parameter in "general" tab, create a multiple string parameter source(to select source branch) , target(to select target branch) and report_name(generated report name) shown below.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/5bccbbf8-79d9-4ac5-a00f-3f257f0c87cb)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/7078f46d-b292-4187-9a7c-dc3b12f9857f)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/8f61177c-a911-4b0f-b703-4dac941d5ad3)

### Next go to the "source code management" tab and select git repository and if repository is private then put credentials.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/08fb3826-29c3-4856-84e3-23a6778b8465)

### Next jump to the "build steps" tab select execute shell write the command shown in picture below and save/apply.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/319f5834-8a28-4d2a-ab67-b4bea1662da6)

### In "post build action" tab select "git publisher" and go with the documents and save/apply. 
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/6a64d31a-03e3-487b-8d6f-205ab603a43d)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/472f784c-babe-488f-bec5-e0614a12c717)

### Now go to dashboard and select creted job you will see the "build with parameter" option click on it and enter branch name (source and target), report name >> BUILD 
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/e82d03cc-6317-4423-97dc-c558419e51df)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/6c0b054d-14ff-475d-b902-ddc0b80b827d)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/cd51fc4a-264f-4a12-82d8-df7ff4df70c2)

### Go to the workspace you will see the report is generated in "html" format in below image.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/7f30fc92-c245-4b1b-93fb-80330c5f65fa)


## Step4 : Delete Branch on remote repository.
### Create a freestyle project by selecting new item in dashboad.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/914fc8c0-cb66-4c2e-8479-9cb99423336c)

### Now you enter the configuration page here select the string parameter in "general" tab, write the name(variable) and in default value enter branch name.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/6aee82cf-d3b2-47f1-9cf4-e8991383eb7c)

### Next go to the "Build Environment" tab and select "use secret text" enter variable(ex. kiran) and credentials.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/8025be4e-ecc4-4398-8c47-d26951b78c5a)

### Next jump to the "build steps" tab select execute shell write the command shown in picture below and save/apply.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/89d7143d-7906-4a61-a6d8-91ea8f6202c7)

### Before Build
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/74c113d7-977e-4bb6-bcdd-e8173842f1f6)

### Now go to dashboard and select creted job you will see the "build with parameter" option click on it and enter branch name (you want to delete) >> BUILD 
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/64b2f2ff-706e-4cd5-b418-16298f372490)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/8c1fe617-e45b-4eba-894a-f5f43276e7a8)

### After build
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/5459fe5c-befa-4413-b13e-f8ca94f7c8db)


## Step1 : Check logs of branch.
### Create a freestyle project by selecting new item in dashboad.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/2b7fbe76-71fb-4aec-881a-c1e10c6e8d88)

### Now you enter the configuration page here select the string parameter in "general" tab, crete two string one for  branch name(variable) and another for report_name(variable).  
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/483a41a2-7b6a-47b4-8cea-fde3998f77cb)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/9f2b0a20-cc96-40e5-9101-31f0e07689ca)

### Next go to the "source code management" tab and select git repository and if repository is private then put credentials.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/92be3a1c-775b-4631-b224-cc057d3c0aba)

### Next jump to the "build steps" tab select execute shell write the command shown in picture below and save/apply.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/1a39e803-5116-4b93-8778-b270a0070043)

### Now go to dashboard and select creted job you will see the "build with parameter" option click on it and enter branch name (you want to see log) and report_name(name of report) >> BUILD 
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/a16ff777-7aaa-408c-89c5-bf41828aed2a)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/c806693b-a149-4692-8b65-7ca04a6628e1)
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/51bcab67-b62a-40aa-bf88-dbdfb135ca35)

### Go to the workspace you will see the report is generated in "html" format in below image.
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/979f1f0a-b145-4927-a33b-96a4f4fa9fa8)
### Output 
![image](https://github.com/Kiran-dehlikar/test/assets/104997588/6b928147-f171-4bcd-80da-2bb34f19d617)

## Authors

- [Kiran Dehlikar](https://github.com/Kiran-dehlikar)
