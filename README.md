## Generic Java Github Fork project builder
Build tools for project on top of docker

Installation steps:
- Setup mongo server and prepare image with storage utility (https://github.com/hapylestat/storage)
- Downlod repo, rename `amsh_settigns.sample` to `.amsh_settigns`
- Change such settings inside file: `BRANCH`, `USER`, `KEY`, `MONGODB_URL`, `M2_CACHE_PATH`, `DOCKER`

- `USER` and `KEY` - is a username and password for GitHub account, where `KEY` could be an special token, generated for application-only use
If you wish to use key file instead and ssh access to github, put you private key to file `build_container\keys\github_custom` and uncomment respective line in `build_container\Dockerfile`
- `M2_CACHE_PATH` is a patch, where your maven cache would be stored outside of the container
- `BRANCH`, `STACK_BRANCH` name of branches, which would be checkout on command shell launch
- `MONGODB_URL` url for working mongodb, if shared storage supposed to be used. Check `mongo` folder for the details

- `DOCKER` - is an array of docker hosts, where this shell would running

##Building image
`docker build -t project-env build_container`

##MongoDB
This is document-oriented database. Via gridFS it could store binary files and could be used as tool in scripts, to
distribute them across containers without any installed ssh/ftp on the host.  All configuration for the server can
be founded here: `mongo/server`.

##How to work with the shell
When running, shell exposing bash functions as commands, which could be running. For the full available list type inside shell help, or `sandbox/lib/shell-functions` for details. In same manner new functions could be written.


##How to run shell
For windows could be created shortcut like:
Target: %SystemRoot%\system32\bash.exe -i amsh /mnt/e/git/project_stuff/project
Start In: E:\git\project_stuff\_project_docker

