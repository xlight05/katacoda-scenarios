It's time to build and run your cell file. 

Cellery build  generates required artifacts that is required to deploy in kubernetes.  
`cellery build orgName/ImageName:1.0.0`{{execute}} 

Cellery run deploys the generated cellery image in kubernetes  
`cellery run orgName/ImageName:1.0.0`{{execute}} 

You can use the below command to see the status of the deployment.   
`cellery ps`{{execute}} 

Once it's ready you can click Web Cell tab to open the hello world page.
