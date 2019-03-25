## Deploying the Cell

It's time to build and run your cell file. 
You can use `cellery build orgName/ImageName:1.0.0`{{execute}} to build the Cell file. 
This command will generate required artifacts that is required to deploy in kubernetes.

Once the cell is built you can run the cell file.
Use `cellery run orgName/ImageName:1.0.0`{{execute}} to run the cell file you built. This will deploy cell in kubernetes.

You can use `cellery ps`{{execute}} command to see the status of the deployment. 
Once it's ready you can click Web Cell tab to open the hello world page.
