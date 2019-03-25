## Preparing the enviroment.

Cellery installation will start automatically. This installs a Basic Cellery Installation (Kuberentes runtime, Cellery Runtime and Cellery CLI). In a normal setup you will have to create your own environment  using cellery setup.  For demo purposes katacoda has prepared an environment for you. Please wait for katacoda to finish the cellery installation.This will take less than 5 minutes.

You can see all the available commands using  `cellery`{[execute}} don’t worry if it doesn’t make much sense, you will learn everything you need in this scenario.

First, run `cellery version`{{execute}} to check if everything is ready. If everything looks ok, you can proceed to the next step

## Initializing the project

Type `cellery init`{{execute}} to initialize the project.
You will get prompt askinging for your project name.
Enter `Hello-World`{{execute}} as the project name.

You will see a folder has been created for your project.
You can switch your directory in to the project using
`cd Hello-World`{{execute}}