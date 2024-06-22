# LD Questions - Ask any questions anonymously

Londonskaya Diaspora (LD) is a video interview project based at Pushkin House in London, the aim of which is to give a platform between Russian-speaking event organisers and their audience.   
This app was designed to collect questions that our audience might have about or to our guests.  
All questions are anonymous. Here is the website - https://www.londonskaya-diaspora.co.uk/  

# Visual Overview
## Frontpage
This is the front page the user sees. 
<img width="1417" alt="Screenshot 2024-05-21 at 13 01 52" src="https://github.com/katiakata1/LD_Questions/assets/62849876/d6c29628-2dff-424d-adae-df42328d0b1d">
<br>

Here the user submits the question "this is my question". 
<img width="1284" alt="Screenshot 2024-05-21 at 13 03 19" src="https://github.com/katiakata1/LD_Questions/assets/62849876/cebb6bc2-2871-426b-80b4-47a539ccd4cd">
<br>


## When submitted
This is what the user sees after submitting it. The user can return to the main page and submit another question.
<img width="1217" alt="Screenshot 2024-05-21 at 13 04 01" src="https://github.com/katiakata1/LD_Questions/assets/62849876/03aeddad-2959-4ea8-8196-a5d6a4016ab2">
<br>
Finally, the question "this is my question" can be seen in the database with the corresponding timestamp. 
<img width="881" alt="Screenshot 2024-05-21 at 13 04 23" src="https://github.com/katiakata1/LD_Questions/assets/62849876/aafe7ea7-9442-4d03-a283-8136f030b014">
<br>


# Technical Overview
The architecture used for this project
<br>
<img width="563" alt="Screenshot 2024-06-22 at 12 03 35" src="https://github.com/katiakata1/LD_Questions/assets/62849876/ef5b1e58-0f31-43f1-b7d5-cc72fa45abb1">
<br>
<br>
## Built with 
* Flask/python
* Docker
* Azure Container App
* Dockerhub
* Azure MySQL Database
* Terraform
* GitHub Actions

## The process of how it was built
* The app was built locally first using Flask, Python and SQLite Database
* The SQLite was replaced by Azure MySQL Database using ODBC Driver 18 for SQL Server
* The final code was used to build and deploy the docker image, which was then deployed to the Azure Container App. A docker image was used because it might be a problem to install ODBC Driver 18 on another service including Function App (I did not want to use VM)
* Purchased domain londonskaya-diaspora.co.uk on GoDaddy website and configured custom domain in Azure Container App which enabled the user to access the app with londonskaya-diaspora.co.uk. Also, generated a free (90 days) SSL certificate from https://app.zerossl.com/. 
<br>

# Repository Structure
## github Folder
- Contains two pipelines
- One is for infrastructure configuration (terraform) and the second one is for docker image build and container app build
- Terraform-apply.yml is triggered when new code is pushed to "terraform" branch and changes are made to terraform folder
- docker-push.yml is triggered when a new code is pushed to "app" branch and changes are made to app folder 

## App Folder
- it has web page source code

## Terraform Folder
- it contains infrastructure-related information
<br>
<br>

# CI/CD Pipelines
## App Pipeline (docker-push.yml) - Builds, pushes the image and updates the Container App
This pipeline does the following: 
1. Logins to Dockerhub account
2. Builds docker image from repository specified containing Dockerfile
3. Pushed the image to Dockerhub
4. Logins to Azure to update the Container App
5. Deploys the image to Container App

### Variables required
* DOCKERHUB_PASSWORD - your password to Dockerhub (You need to create an account in Dockerhub)
* DOCKERHUB_USERNAME - your username to Dockerhub
* AZURE_CLIENT_ID - service principal application (client) ID
* AZURE_CLIENT_SECRET - service principal secret
* AZURE_TENANT_ID - azure subscription tenant ID
* DB_DRIVER - in my case it was "ODBC Driver 18 for SQL Server"
* DB_SERVER - "database-server-name".database.windows.net
* DB_NAME - database name 
* DB_USER - when you created database, you specified the name of the user that can login to db
* DB_PASSWORD - when you created database, you specified the password for that user
<br>
<br>

## Terraform Pipeline (terraform-apply.yml) - Builds and updated infrastructure
This pipeline does the following:
1. Logins to Azure
2. Sets correct subscription
3. Terraform init
4. Terraform validate 
5. Terraform plan
6. Terraform apply

### Variables required
* AZURE_CLIENT_ID - service principal application (client) ID
* AZURE_CLIENT_SECRET - service principal secret
* AZURE_TENANT_ID - azure subscription tenant ID
* AZURE_SUBSCRIPTION_ID - azure subscription ID
* SQL_ADMIN_LOGIN - when you created database, you specified the name of the user that can login to db (same as DB_USER)
* SQL_ADMIN_PASSWORD - when you created database, you specified the password for that user (same as DB_PASSWORD)
<br>
<br>

## The full list of secret variables in GitHub Actions
<img width="783" alt="Screenshot 2024-06-22 at 13 40 24" src="https://github.com/katiakata1/LD_Questions/assets/62849876/1172f427-3a0c-46db-a188-8fb982df3353">







