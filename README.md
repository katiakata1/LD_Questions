# LD Questions - Ask any questions anonymously

Londonskaya Diaspora (LD) is a video interview project based at Pushkin House in London, the aim of which is to give a platform between Russian-speaking event organisers and their audience.   
This app was designed to collect questions that our audience might have about or to our guests.  
All questions are anonymous. Here is the website - https://www.londonskaya-diaspora.co.uk/  

## Visual Overview

### Frontpage
This is the front page the user sees. 
<img width="1417" alt="Screenshot 2024-05-21 at 13 01 52" src="https://github.com/katiakata1/LD_Questions/assets/62849876/d6c29628-2dff-424d-adae-df42328d0b1d">
<br>
<br>
<br>
Here the user submits the question "this is my question". 
<img width="1284" alt="Screenshot 2024-05-21 at 13 03 19" src="https://github.com/katiakata1/LD_Questions/assets/62849876/cebb6bc2-2871-426b-80b4-47a539ccd4cd">
<br>
<br>

### When submitted
This is what the user sees after submitting it. The user can return to the main page and submit another question.
<img width="1217" alt="Screenshot 2024-05-21 at 13 04 01" src="https://github.com/katiakata1/LD_Questions/assets/62849876/03aeddad-2959-4ea8-8196-a5d6a4016ab2">
<br>
<br>
Finally, the question "this is my question" can be seen in the database with the corresponding timestamp. 
<img width="881" alt="Screenshot 2024-05-21 at 13 04 23" src="https://github.com/katiakata1/LD_Questions/assets/62849876/aafe7ea7-9442-4d03-a283-8136f030b014">
<br>
<br>

# Technical Overview
This is the architecture
<br>
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
