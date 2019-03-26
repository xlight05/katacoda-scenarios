We will be dockerizing the html you just created in this step.
This process requires a docker hub account to push the docker image. 
If you don’t have one, you can sign up using https://hub.docker.com/signup  
`docker login`{{execute}}

You have to use the docker build to build your new image.  
Since we need to push the docker image afterwards we will be tagging the image while building.  
Replace `docker-username` with your docker hub username and execute the following command  
`$docker build --tag docker-username/hello-world .`

In this step we will be pushing the docker image you just built.

Replace `docker-username` with your docker hub username and execute the following command  
`$docker push docker-username/hello-world`

You have to replace the source of the component with your own docker image.

You can edit it manually from the editor or do the following

Replace `docker-username` with your dockerhub username and execute the following command  
`sed -i 's/sumedhassk/docker-username/g' hello-world.bal;`{{execute}}

Run `cellery build orgName/ImageName:1.0.0`{{execute}} to build the cellery artifacts  
Run `cellery run orgName/ImageName:1.0.0`{{execute}} to deploy the cell

Once it's ready you can click Web Cell tab to open the hello world page.

After Cell is ready click on the web cell and visit the updated cell. (maybe curl too)
