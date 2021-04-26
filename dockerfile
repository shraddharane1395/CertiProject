---
- hosts : webservers
  become : true
  become_user : root
  tasks :
   - name : Install Docker
     yum:
       name: docker
       state : present

   - name : Docker start
     service :
       name : docker
       state : started

   - name : Pull docker image
     command : docker pull devopsedu/webapp:latest

   - name : Run Docker Image
     command : docker run -itd -P devopsedu/webapp:latest
