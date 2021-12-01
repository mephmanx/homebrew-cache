# homebrew-cache
Project to build homebrew cache for Openstack Project builds

This container will build a tar file of a functional homebrew for linux install ready to extract, update PATH, and use.

The build line is:

docker run --rm -v /(directory to put resulting tar file):/tmp/export mephmanx/homebrew-cache (active terraform version to set)

To use cache, extract tar file to:

/home/linuxbrew

And then update PATH and init homebrew using the following commands:

export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

Homebrew is then installed and ready to use as if it was installed using the script provided on the homebrew site.

The cache is built with core homebrew, bbl, cloudfoundry, bosh, terraform, and tfenv.  After installation, tfenv is used to install and set a specific version of terraform as active as the projects are constantly changing and the latest versions don't always play together well.