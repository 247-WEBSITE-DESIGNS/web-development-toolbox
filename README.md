# Web Development Toolbox

The web-development-toolbox repository makes it easy to create a Docker
container for use during the 
[Responsive Website Development and Design Specialization](https://www.coursera.org/specializations/website-development).

Download and install the [Docker](https://www.docker.com/) software for Apple
Mac OS X, GNU/Linux or Microsoft Windows following the
[instructions](http://docs.docker.com/linux/started/) at the website.

Retrieve the
[web-development-toolbox](https://github.com/gdhorne/web-development-toolbox)
build repository to create the container. Git, HandlebarsJS, JQuery, MeteorJS
with MongoDB, and Twitter Bootstrap are installed as part of the image.

	$ git clone https://github.com/gdhorne/web-development-toolbox

For ease of instantiating an instance of the container image a script named
'container.sh' can be used to manage the entire lifecycle. For Microsoft Windows
users it is recommended that [Git Bash](https://git-for-windows.github.io/) be
installed instead of the standard [Git](https://git-scm.com) software because
it provides an *nix-like command line environment.

Create the container, optionally mapping a host file system share for storage.
The file system share name '/home/me/projects' is user selectable and host
file system dependent. If no local file system share is desired simply omit the
fourth argument '/home/me/projects'. The container instance name 'toolbox',
in these instructions, is user selectable at time of creation.

     $ ./container.sh create toolbox gdhorne/web-development-toolbox /home/me/projects  

*Apple Mac OS X: /Users/username/directory*
*GNU/Linux: /home/username/directory*
*Microsoft Windows: /c/Users/directory (allegedly)*

Verify the container 'toolbox' has been successfully created and is running

     $ ./container.sh status

Stop the container 'toolbox'.

	$ ./container.sh stop toolbox

Start the container 'toolbox'.

	$ ./container.sh start toolbox

To learn more about the container lifecycle management features supported by 'container.sh' type,

	$ ./container.sh --help


## Applications

After creating the container these applications are accessible within a web 
browser.

	lighttpd:	http://127.0.0.1

	WeTTY:		http://127.0.0.1:8002

				UserID: webdev 
				Password: website 

				To enable the terminal/console management utility 
				type 'screen' and press ENTER.


Alternatively, the web-development-toolbox image provides a traditional 
command line interface, without WeTTY, to some applications such as Git, 
and vim. For convenience the terminal/console management utility 
'screen' has been installed and starts automatically.

	$ ./container.sh attach toolbox

Press ENTER if the container's shell prompt does not appear. To exit the 
container and leave it running press CTRL+P, CTRL+Q; this is the preferred 
method. To exit the container and stop it type 'exit'.

The following need only be executed one time to install the plug-ins specified
in the .vimrc configuration file. This step must be performed if syntax
highlighting within vim is desired, otherwise skip it.

	$ vi

	1. [ESC] :  (no spaces)
	2. PlugInstall [ENTER]
	3. [ESC] : q  (no spaces)

	$ cd ~/.vim/plugged && ./install.sh --clang-completer && cd ~

Several vim text editor plug-ins for syntax highlighting are pre-configured and
automatically activated each time the text editor is launched:

    $ vi

Documentation for these plug-ins is in the ~/.vim/plugin_name subdirectory.
