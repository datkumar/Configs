# Git-GitHub <img alt="Git" src='https://git-scm.com/images/logos/downloads/Git-Icon-1788C.svg' height="25">

## Install `git`

Git usually comes pre-installed with most Linux distros, but you if not in yours, you can install it via you package manager (`apt`, `dnf` etc) as instructed on [Git download](https://git-scm.com/downloads/linux) page:

```sh
# For Fedora:
sudo dnf install git
```

## Set name and email

Referring the [First-Time Git Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup) page:

- To set name and email across all your repos, set it in global Git config as:

  ```sh
  git config --global user.name "John Doe"
  git config --global user.email "john.doe@example.com"
  ```

- To verify, you can view your global git config as: `git config list --global`. Your global git config is stored in `~/.gitconfig` file

You can also refer [my git config](https://github.com/datkumar/Configs/blob/main/config-files/.gitconfig)

## GitHub SSH setup

- Generate new key pair (passing parameters: type `-t` and comment `-C`):

  ```sh
  # You will be prompted for the key's storage location and passphrase
  ssh-keygen -t ed25519 -C "john.doe@example.com"
  ```

  Your keys would be saved in the `~/.ssh/` folder and the pair would be named like:

  - `keyname` for private key
  - `keyname.pub` for the public key

  You can notice it in the output or previous command as:

  ```txt
  Your identification has been saved in /home/kumar/.ssh/id_ed25519
  Your public key has been saved in /home/kumar/.ssh/id_ed25519.pub
  ```

- Start `ssh-agent` in the background:

  ```sh
  eval "$(ssh-agent -s)"
  ```

- Add your SSH private key to the `ssh-agent`:

  ```sh
  ssh-add ~/.ssh/id_ed25519
  ```

- View your SSH public key and copy the output contents

  ```sh
  cat ~/.ssh/id_ed25519.pub
  ```

- Log into your GitHub account. Go to `Settings` > `SSH and GPG keys`. Click `New SSH key`. Give it a title and paste the previous noted output into the `Key` textarea box. Finally click Add `SSH key`

- Test if the SSH connection method works:

  ```sh
  ssh -vT git@github.com
  ```

  In the output:

  ```txt
  ...
  Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
  ...
  Hi datkumar! You've successfully authenticated, but GitHub does not provide shell access.
  ```

Also try cloning any GitHub repo via the SSH method url: `git@github.com:USERNAME/REPONAME.git`

**References**:

- [GitHub Account Setup and Configuration](https://git-scm.com/book/en/v2/GitHub-Account-Setup-and-Configuration)
- [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Generating your SSH Public Key](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key#_generate_ssh_key)

<!-- ---

`git config --global pull.rebase true`

---

## Removing old SSH Identity:

SSH identities are stored in `~/.ssh` folder and SSH manages these identities

- To **view all** existing identites: `ssh-add -l` or `ssh-add -L`
- To **remove all** existing SSH identites: `ssh-add -D`
- To remove a specific identity, delete the private key and the associated `.pub` file of that identity in `~/.ssh` folder

---

> For error `git: fatal: Could not read from remote repository`. Refer [this post](https://stackoverflow.com/questions/13509293/git-fatal-could-not-read-from-remote-repository)

--- -->
