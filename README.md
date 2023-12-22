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
Using fllowing bash script to install Docker on a Linux machine:

```bash
#!/usr/bin/env bash
sudo apt update
sudo apt install docker.io docker-compose -yqq


### 2. Cloning the Repository from Github 
git clone https://github.com/silarhi/php-hello-world.git

### 3. creating a index.php file 

--------------index.php------------
<?php

require_once __DIR__ . '/vendor/autoload.php';


use Silarhi\Hello;


$hello = new Hello();


echo $hello->display() . "\n";

--------------------------------------


### 4. Building Dockerfile 

creating a Dockerfile to build an image. 

-------Dockerfile-------------------
FROM php:8.1-apache

WORKDIR /var/www/html
COPY composer.json .
RUN apt-get update && apt-get install -y libzip-dev zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . .

RUN composer install --ignore-platform-reqs

CMD ["apache2-foreground"]  

-----------------------------------------
### 5. pushing the docker image 
the following command is used to push docker image 
command : docker push ujjwal4433/hello123

### 6. Creating a docker-compose.yml file

-------------docker-compose.yml-----------
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
      
---------------------------------------------

### 7. using the command: docker-compose up to run application 
![aa](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/a6809e4f-7152-4ee0-a6b4-5c51699279a0)


      
### 8. installing jenkins 

the following command is used to install jenkins 
----command----------------------
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
sudo systemctl start jenkins.service
------------------------------------

### 8. creating a freestyle project 
the next step is to create a free style project 
under source code management select git and give your Reposotories URL and select your branche i.e main/master
under build step select execute shell and put the following command :
--------------------
docker build . -t src
docker run -p 9000:9000 src
-----------------------
and save it. 
after saving build the project 
after building the project go to console output it will give you an ip address navigate to it . 
# navigating to URL 

![dd](https://github.com/stha008/intuji-devops-internship-challenge/assets/124485115/d521f140-91e2-45db-b687-d0f85a736f69)

 

