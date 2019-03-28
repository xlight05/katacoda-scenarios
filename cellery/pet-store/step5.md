In this step, you will be deploying your own hello world as a cell.

Create the index.html file  
`touch index.html`{{execute}}

You can copy the following HTML hello world sample into the editor and edit the file as you like.  

<pre class="file" data-filename="index.html" data-target="replace">
<!DOCTYPE html>
<html lang="en">
<head>
   <title>Hello World</title>
</head>
<body>
   <h1>
       Hello World
   </h1>
</body>
</html>
</pre>

Now you have to dockerize the HTML file you created.

Create the Dockerfile  
`touch Dockerfile`{{execute}}

You can copy the following content to the Dockerfile
<pre class="file" data-filename="Dockerfile" data-target="replace">
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
</pre>
