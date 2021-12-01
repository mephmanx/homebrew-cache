# homebrew-cache
Project to build homebrew cache for Openstack Project builds

This container will build a tar file of a functional homebrew for linux install ready to extract, update PATH, and use.

The build line is:

docker run --rm -v /(directory to put resulting tar file):/tmp/export mephmanx/homebrew-cache (active terraform version to set)

The cache is built with core homebrew, bbl, cloudfoundry, bosh, terraform, and tfenv.  After installation, tfenv is used to install and set a specific version of terraform as active as the projects are constantly chnaging and the latest versions dont always play together well.