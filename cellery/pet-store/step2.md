Pet Store is a Web Portal which can be used by the Customers for Ordering Accessories for their Pets.

This Sample is a simple Web App which consists of 5 Docker images (4 microservices and a container to serve the Web Portal).

Catalog (Catalog of the accessories available in the Pet Store) - NodeJS
Customers (Existing customers of the Pet Store) - NodeJS
Orders (Orders placed at the Pet Store by Customers) - NodeJS
Controller (Controller service which fetches data from the above 3 microservices and processes them to provide useful functionality) - NodeJS
Portal (A simple Node JS container serving a React App with Server Side Rendering)

You can find the Cell architecture diagram below.
![Architecture](/xlight/courses/cellery/pet-store/assets/architecture.jpg)
