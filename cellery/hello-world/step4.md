It's time to build and run your cell file. 

Build command executes the build function in your Cell file. The main purpose of this command is to generate the required component artifacts for kubernetes.  
`cellery build hello-world.bal wso2-cellery/hello-world-cell:1.0.0`{{execute}}

The run command executes the run function in your Cell file. The main purpose of this command is to deploy your cell file inside kubernetes.  
`cellery run wso2-cellery/hello-world-cell:1.0.0`{{execute}}

You can specify any kind of logic inside above functions.

We will be discussing advanced use cases in future scenarios.

You can use the below command to see the status of the deployment.  
`cellery ps`{{execute}}

Once it's ready you can click Web Cell tab to open the hello world page.
