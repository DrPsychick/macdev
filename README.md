# purpose
I hate it when I need to setup a computer from scratch, but from time to time I need to do it. To simplify the process AND to share a similar local environment with all colleagues and friends (which makes communication and collaboration far easier), I created this simple ansible playbook. 

## features
* setup the environment (.profile/.bashrc/...)
* install brew / pip3 packages
* download and install individual apps (zip or dmg)

# prerequisites
* install homebrew: https://brew.sh
* install python/pip `brew install python`
* install ansible: `pip3 install ansible`
* enable SSH access on your mac (Preferences -> Sharing -> Remote login)
* (optionally) run `setup.sh` and follow the instructions (creates ~/.ssh directory and asks you to add your SSH key)

# get it
`git clone git@github.com:DrPsychick/macdev.git` 

# configure it
* use `host_vars/localhost-example.yml` as a base and en-/disable roles, add/remove packages to install via pip or homebrew ...
* save it as `host_vars/localhost.yml`to enable it

# run it
`ansible-playbook macdev.yml`

# setup ENV for mac and ansible:
see https://gist.github.com/DrPsychick/847ea32c876fda2337e79096a8a23176
