# Parameters:
# $1: Project name.
# $2: URL to the empty git repo where the project will be hosted.
# $3: Git repo folder name.
# $4: Theme folder name.
#
# !NOTICE: No spaces allowed in parameters.

# Check for parameters.
if [ "$1" = "" ] || [ "$2" = "" ] || [ "$3" = "" ] || [ "$4" = "" ] ; then
	echo "============ NOTICE ============"
	echo "Pass project name, remote"
	echo "repository URL, repository"
	echo "folder name and theme name to"
	echo "generate the project structure."
	echo "Script terminated."
	echo "================================"
	echo "Usage:"
	echo "'./create_wp_project.sh' <project-name> <repository-url> <repository-folder-name> <theme-folder-name>"
	echo "================================"
else
	# Create the project folder & go in.
	mkdir $1
	cd $1;

	# Clone the passed repository recursively.
	# This should be an empty remote repository.
	git clone $2 $3

	# Create dev folder to the cloned repository.
	mkdir $3/dev

	# Pull in the theme base.
	git clone --recursive https://github.com/sarukuku/WPTB.git $3/$4

	# Remove the git files from the pulled theme.
	rm -rf $3/$4/.git # Theme base
	rm $3/$4/.gitattributes
	rm $3/$4/.gitignore
	rm $3/$4/.gitmodules
	rm -rf $3/$4/library/scss/inuitcss/.git # Inuit.css submodule
	rm -rf $3/$4/plugins/tmg-plugin-activation/.git # TMG Plugin Activation submodule
	rm -rf $3/$4/plugins/tmg-plugin-activation/plugins
	rm $3/$4/plugins/tmg-plugin-activation/composer.json
	rm $3/$4/plugins/tmg-plugin-activation/example.php

	# Fetch the newest version of Wordpress.
	wget http://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz

	# Remove the wp tar ball.
	rm latest.tar.gz

	# Remove the sample config from the wp dir
	# and move one in from the theme base.
	rm wordpress/wp-config-sample.php
	mv $3/$4/wp-config-sample.php wordpress/wp-config.php

	echo "============ DONE ============"
	echo "We're done. Now setup local"
	echo "server + databases & install"
	echo "Wordpress. Happy developing!"
	echo "=============================="

fi