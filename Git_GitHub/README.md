# Git_GitHub <img src='https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png' width="28">

Install Git: https://git-scm.com/download/linux

Git Setup:
https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup

`git config --global user.name "Kumar Deshmukh"`

`git config --global user.email kumar.deshmukh945@gmail.com`

To view the config: `git config --global -l`

## SSH setup:


> ### Removing old SSH Identity:

SSH identities are stored in `~/.ssh` folder and SSH manages these identities

- To view all existing identites: `ssh-add -l` or `ssh-add -L`
- To remove all existing SSH identites: `ssh-add -D`
- To remove a specific identity, delete the private key  and the associated `.pub` file of that identity in `~/.ssh` folder

---

[Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

[GitHub Account Setup and Configuration](https://git-scm.com/book/en/v2/GitHub-Account-Setup-and-Configuration)

Generating a new SSH key and adding it to the ssh-agent: [*Github Article*](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) , [*Git Article*](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key#_generate_ssh_key)

```sh
# Generate new key pair (passing parameters: type -t and comment -C)
ssh-keygen -t ed25519 -C "myemail@example.com"
# You will be prompted for the key's storage location and passphrase

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add your SSH private key to the ssh-agent
ssh-add ~/.ssh/id_ed25519

# View the SSH public key 
cat ~/.ssh/id_ed25519.pub
# Copy the output and paste it into GitHub's Add new SSH key box
```

> For error `git: fatal: Could not read from remote repository`. Refer [this post](https://stackoverflow.com/questions/13509293/git-fatal-could-not-read-from-remote-repository)

`ssh -v git@github.com`

---
