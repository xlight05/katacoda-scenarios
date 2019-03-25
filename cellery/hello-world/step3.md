## Hello world Cell contents

#### Cell
A cell is a collection of components, grouped from design and implementation into deployment. A cell is independently deployable, manageable, and observable.

#### Component
A component represents business logic running in a container, serverless environment, or an existing runtime. 

In this scenario, Our goal is to deploy a simple hello world web page.Therefore we need only one component in the cell.

Component Object specifies all the information about the component.

Notice the Component name, docker image source specified in the Component object.


#### Build
In the build method you can specify which components should be added, exposed globally.

You can find more about the cellery syntax by visiting https://github.com/wso2-cellery/spec

