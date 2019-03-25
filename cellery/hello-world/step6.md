### Building the Hello World Docker

You have use the `docker build` to build your new image. 
Since we need to push the docker image afrerwards we will be tagging the image while building.
Replace `docker-username` with your dockerhub username and execute the following command
`$docker build --tag docker-username/hello-world .`

### Push the docker image

In this step we will be pushing the docker image you just built.
Replace `docker-username` with your dockerhub username and execute the following command
`$docker push docker-username/hello-world`

### Rebuild the Cell file

You have to replace the source of the component with your own docker image.

You can edit it manually from the editor or do the following 

Replace `docker-username` with your dockerhub username and execute the following command
`sed -i 's/sumedhassk/docker-username/g' hello-world.bal;`{{execute}}

Run `cellery build orgName/ImageName:1.0.0`{{execute}} to build the cellery artifacts
Run `cellery run orgName/ImageName:1.0.0`{{execute}} to deploy the cell

Once it's ready you can click Web Cell tab to open the hello world page.