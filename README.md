# Website Development Toolbox

The web-development-toolbox repository makes it easy to create a Docker
container for use during the [Responsive Website Development and Design Specialization](https://www.coursera.org/specializations/website-development).

For ease of use a script named 'container.sh' can be used to manage the entire 
lifecycle and interaction with the Docker container. Twitter Bootstrap, 
HandlebarsJS, JQuery, and MeteorJS with MongoDB are installed as part of the 
image. Additionally, MeteorJS packages can be added after the container is 
created.

There are two ways to create a Docker container for use during the Responsive  
Website Development and Design Specialization either by fetching the pre-built 
[image](https://hub.docker.com/r/gdhorne/website-development-toolbox/) from the Docker website
or from scratch. In both scenarios the [website-development-toolbox](https://github.com/gdhorne/website-development-toolbox) repository
available on GitHub will be beneficial.

## Create a Docker Container from a Pre-built Image Available at Docker Hub 

Download and install the Docker software for Apple Mac OS X, GNU/Linux or 
Microsoft Windows following the  [instructions](http://docs.docker.com/linux/started/) at the [Docker](https://www.docker.com) website.

Retrieve the web-development-toolbox repository and the 
web-developmente-toolbox image to create a container, and optionally 
map a host filesystem share for storage as shown.

	$ git clone https://github.com/gdhorne/web-development-toolbox
	$ ./container.sh create toolbox gdhorne/web-development-toolbox \
							/home/me/webdev
	$ ./container.sh status

## Create a Docker Container from a Locally Pre-built Image or from Scratch

Download and install the Docker software for Apple Mac OS X, GNU/Linux or 
Microsoft Windows following the [instructions](http://docs.docker.com/linux/started/) at the [Docker](https://www.docker.com) website.

Retrieve the web-development-toolbox repository and the
web-development-toolbox image to create a container, and optionally   
map a host filesystem share for storage as shown.

	$ git clone https://github.com/gdhorne/web-development-toolbox
	$ ./container.sh create toolbox web-development-toolbox /home/me/webdev
	$ ./container.sh status

## Applications

After creating the container these applications are accessible within a web 
browser.

	Git:		Accessible via WeTTY

	lighttpd:	http://127.0.0.1

	WeTTY:		http://127.0.0.1:8000

				UserID: webdev
				Password: website

				To enable the terminal/console management utility 
				type 'screen' and press ENTER.

The web server is configured to point to /home/webdev/www by default. Type
'http://127.0.0.1' into the web browser address field to view the default
index.html.

If you want to create a separate subdirectory for each project/assignment,

	$ mkdir www/my_first_website

and after adding an index.html file and any supporting files the website can
be viewed by typing 'http://127.0.0.1/my_first_website' into the web browser
address field. The 127.0.0.1 can be replaced by localhost, both are equivalent.

To access the container type 'http://127.0.0.1:8000' into the web browser
address field and use the credentials shown.

The text editor available within the container is vim. For those with a
preference for a GUI-based text editor install your editor of choice on
the host computer, save the website files to the local file system share,
/home/me/webdev in the preceding examples, and from within the container
copy those files from /home/webdev/data/ to /home/webdev/www. 

## Container Management

The container.sh script makes managing the Docker container straight-forward 
via a user-friendly, simplified interface to the Docker container management 
functions covering the entire lifecycle. 

|Action|Command|
|------------------|----------------------------------------|
|Create container|container.sh create \<container\> \<image\> [\<host\_file\_share\>]|
|Access container|container.sh attach \<container\>|
|Pause container|container.sh pause \<container\>|
|Unpause container|container.sh unpause \<container\>|
|Start container|container.sh start \<container\>|
|Stop container|container.sh stop \<container\>|
|Delete container|container.sh kill \<container\>|
|Display container status|container.sh status [\<container\>]|

Throughout these examples the container is named 'toolbox', the image is
named 'web-development-toolbox', and the host file system share is
'/home/me/project'. 

Example 1: Create a container

	$ ./container.sh create toolbox web-development-toolbox /home/me/project

If the fourth argument is omitted the container cannot write to the host 
file system. When you delete the container any files that you created will 
be lost unless you commited them to a remote Git repository.

Example 2: Check the status of a specific container or all containers

    $ ./container.sh status toolbox
    $ ./container.sh status

The current status of all containers is reported.

Example 3: Access a running container at the command line without WeTTY

    $ ./container.sh attach toolbox

Press ENTER if the container's shell prompt does not appear. To exit the 
container and leave it running press CTRL+P, CTRL+Q; this is the preferred 
method. To exit the container and stop it type 'exit'.

Example 4: Pause a running container and unpause a container

    $ ./container.sh pause toolbox
    $ ./container.sh status toolbox
    $ ./container.sh unpause toolbox
    $ ./container.sh status toolbox

Processes running within a container can be paused and will resume when unpaused.

Example 5: Stop a running container and start a container

    $ ./container.sh stop toolbox
    $ ./container.sh status toolbox
    $ ./container.sh start toolbox
    $ ./container.sh status toolbox

Any running process is shutdown potentially loosing any unsaved work.

Example 6: Delete an existing container (non-recoverable)

	$ ./container.sh kill toolbox

A container can be deleted if it is in either started or stopped state. A 
paused container cannot be deleted. This is a non-recoverable action.

Example 7: Error handling

    $ ./container.sh pause toolbox
    $ ./container.sh stop roolbox
    $ ./container.sh attach toolbox

The container.sh script detects attempts to perform an invalid command or 
otherwise attempt an action not possible in the current context of the 
named container. Try the preceding sequence of commands and notice the 
output to the console.

