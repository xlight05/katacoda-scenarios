## Modifying your Hello world

In this step you will be deploying your own hello world as a cell. You can copy the following html hello world sample in to the file . You can edit the file as you like.
Create the index.html file  
`touch index.html`{{execute}}

Copy and edit the following content in the editor.
<pre class="file" data-filename="index.html" data-target="replace">
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hello World - Nginx Docker</title>
</head>
<body>
    <h1>
        Hello World
    </h1>
</body>
</html>
</pre>


Now you can dockerize the html file you created.  You can copy the following dockerfile to containerize the html
Create the Dockerfile  
`touch Dockerfile`{{execute}}

Copy and edit the following content in the editor.
<pre class="file" data-filename="Dockerfile" data-target="replace">
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
</pre>

