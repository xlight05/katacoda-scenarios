We will be dockerizing the html you just created in this step.
This process requires a docker hub account to push the docker image.  
If you don’t have one, you can sign up using https://hub.docker.com/signup  
`docker login`{{execute}}

You have to use the docker build to build your new image.  
Since we need to push the docker image afterwards we will be tagging the image while building.  
`$docker build --tag docker-username/hello-world .`

We will be pushing the docker image you just built using the followign command.  
`$docker push docker-username/hello-world`

Now,you have to replace the source field of the Cell file with your own docker image.

You can edit it manually from the editor or execute the following command the following

`sed -i 's/sumedhassk/docker-username/g' hello-world.bal;`{{execute}}

Rebuild and run the Cell file

`cellery build orgName/ImageName:1.0.0`{{execute}}  
`cellery run orgName/ImageName:1.0.0`{{execute}}  

Once it's ready you can click Web Cell tab to open the hello world page.

After Cell is ready click on the web cell and visit the updated cell. (maybe curl too)
