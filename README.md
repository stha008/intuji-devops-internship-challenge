# CI/CD Pipeline for PHP Application with Docker and Jenkins

## Introduction
This project sets up a Continuous Integration/Continuous Deployment (CI/CD) pipeline for a PHP application using Docker and Jenkins.

## Prerequisites
- VMware
- ubuntu 22.04.3 LTS
- Docker
- Jenkins
- Git

## Installation & Setup

### 1. Install Docker
Using following bash script to install Docker on a Linux machine:

```bash
#!/usr/bin/env bash
sudo apt update
sudo apt install docker.io docker-compose -yqq
```

### 2. Cloning the Repository from Github 
```
git clone https://github.com/silarhi/php-hello-world.git
```

### 3. Creating a index.php file 
```
--------------index.php------------
<?php

require_once __DIR__ . '/vendor/autoload.php';


use Silarhi\Hello;


$hello = new Hello();


echo $hello->display() . "\n";
```
--------------------------------------


### 4. Building Dockerfile 

creating a Dockerfile to build an image. 
```

FROM php:8.1-apache

WORKDIR /var/www/html
COPY composer.json .
RUN apt-get update && apt-get install -y libzip-dev zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . .

RUN composer install --ignore-platform-reqs

CMD ["apache2-foreground"]  


```
### 5. Pushing the docker image 
the following command is used to push docker image 
```
docker push ujjwal4433/hello123
```
### 6. Creating a docker-compose.yml file
```

version: "3.8"  

services:
  php-hello-world:
    container_name: php-hello-world-container  
    image: hello123  
    ports:
      - "8080:80"  
version: "3.8"  

services:
  php-hello-world:
    container_name: php-hello-world-container  
    image: hello123  
    ports:
      - "8080:80"  
      

```
### 7. Using the command: docker-compose up to run application

![image](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/eeab6160-da64-45d8-b364-de12fe8be6e8)




      
### 8. Installing jenkins 

the following command is used to install jenkins 
```

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
sudo systemctl start jenkins.service

```
### 9. Creating a freestyle project 

the next step is to create a free style project:

![image](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/44595ca8-794c-485d-af4b-b1000fae50e8)

After that give general description. 

![image](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/2da783cc-87db-4786-b03c-e37409086799)


under source code management select git and give your Reposotories URL and select your branche i.e main/master

![image](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/5fede706-f0ce-4599-b1c8-340956a01786)


under build step select execute shell and put the following command and save it :
```
docker build . -t src
docker run -p 9000:9000 src
```

![image](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/5a3e850e-284d-4901-bed7-9f2c0cbea38a)


after saving navigate to Workspace there we can see all our github repo. files 

![image](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/c38e01f0-17a8-4442-81d3-46ee8ab285b1)

Navigate to build now to build the project 

![image](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/b70ddde2-a51f-454a-af44-4b57b0483026)

After building the project navigate to console output 

![image](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/772bdf4d-8c86-4588-8c88-cb327bc862b8)


if we scroll down it will give you an ip address navigate to it i.e. 172.17.0.2

![image](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/3467f774-7262-4314-837c-fd1409ea9af5)

navigating to URL. 

![image](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/00e9498b-c76d-4c04-9ffa-a6e7304bf7e7)


Thank you !!!







