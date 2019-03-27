We will be dockerizing the HTML you just created in this step.  
This process requires a docker hub account to push the docker image.  
If you don’t have one, you can sign up using https://hub.docker.com/signup
`docker login`{{execute}}

Then execute below command to set the docker username as ORG system variable. By default the ORG_NAME system variable is set to ‘wso2-cellery’.

`export ORG_NAME=<DOCKER_USERNAME>`

You have to use the docker build to build your new image.  
Since we need to push the docker image afterward we will be tagging the image while building.  
`$docker build --tag $ORG_NAME/hello-world .`{{execute}}

We will be pushing the docker image you just built using the following command.  
`$docker push $ORG_NAME/hello-world`{{execute}}

Now, you have to replace the source field of the Cell file with your own docker image.

You can edit it manually from the editor or execute the following command the following  
`sed -i "s/sumedhassk/$ORG_NAME/g" hello-world.bal;`{{execute}}

Rebuild and run the Cell file

`cellery build hello-world.bal -t $ORG_NAME/hello-world:1.0.0`{{execute}}
`cellery run $ORG_NAME/hello-world:1.0.0`{{execute}}

Once it's ready you can click Web Cell tab to open the hello world page.

After Cell is ready click on the web cell and visits the updated cell.
