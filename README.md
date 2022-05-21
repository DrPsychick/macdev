[![Paypal](https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=FTXDN7LCDWUEA&source=url)
[![GitHub Sponsor](https://img.shields.io/badge/github-sponsor-blue?logo=github)](https://github.com/sponsors/DrPsychick)

# purpose
I hate it when I need to setup a computer from scratch, but from time to time I need to do it. To simplify the process AND to share a similar local environment with all colleagues and friends (which makes communication and collaboration far easier), I created this simple ansible playbook.

It is **not** meant to be used for linux or windows environments and **not** meant to support setting up a remote host. It's just a tiny helper to automate installing all the tools and software you expect on your local machine.

**compare with** https://github.com/geerlingguy/mac-dev-playbook as it may make this repo obsolete.

## features
* setup the environment (.profile/.zshrc/aliases/...)
* install brew / pip3 packages
* download and install individual apps (zip or dmg)

## ideas/planned features
* [ ] support multiple environments for pip (virtualenv) 
* [x] support adding brew casks
* [ ] (maybe) add a flag through which you can force install to update apps (most apps ask to update themselves though)
* [ ] maybe add some OSX setting stuff used here: https://github.com/roberth1988/osx-bootstrap

# usage

## install it
* open a terminal
* clone the repository `git clone https://github.com/DrPsychick/macdev.git`
* run `./install.sh` interactively in the shell (requires entering password and/or installing XCode)

```shell
cd git # or wherever you keep stuff like this
git clone https://github.com/DrPsychick/macdev.git
cd macdev
./install.sh
```

## configure it
* use `host_vars/localhost-example.yml` as a base and en-/disable roles, add/remove packages to install via pip or homebrew ...
* save it as `host_vars/localhost.yml` to enable it

```shell
cp host_vars/localhost-example.yml host_vars/localhost.yml
open -e host_vars/localhost.yml
```

## run it
`ansible-playbook macdev.yml`

## maintain it
You want to install a new package? Edit your `host_vars/localhost.yml`, then simply run your alias `localdev` (see `host_vars/localhost-example.yml`) or the above command.

## troubleshooting
* if you get this (after updating brew): `/usr/local/bin/ansible-playbook: bad interpreter: /usr/local/opt/python/bin/python3.7: no such file or directory`
  * then run `pip3 install -U ansible` and try again
* brew upgrade fails: 
  * if brew upgrade sometimes requires user interaction or fails, simply run it manually once: `brew upgrade`

# references
### setup ENV for mac and ansible:
see https://gist.github.com/DrPsychick/847ea32c876fda2337e79096a8a23176
