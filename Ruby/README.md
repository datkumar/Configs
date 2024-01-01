# Ruby

[Ruby Installation docs](https://www.ruby-lang.org/en/documentation/installation)

> Install via RVM to manage various Ruby versions

## RVM install

Following [Install instructions on RVM page](https://rvm.io/rvm/install):

### Install GPG keys

```sh
gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```

### Basic Install

For **Ubuntu**, they have a dedicated Ubuntu package: [**ubuntu_rvm**](https://github.com/rvm/ubuntu_rvm)

For other systems:

Installing **`rvm`** :

```sh
# Latest RVM
\curl -sSL https://get.rvm.io | bash

# Stable RVM
\curl -sSL https://get.rvm.io | bash -s stable
```

If you get error: [might need to speicfy openssl path](https://stackoverflow.com/questions/72179373/cant-install-ruby-via-rvm-error-running-rvm-make-j4-on-ubuntu-22-04)

Installing **`ruby`** :

```sh
rvm install ruby
```

Add these lines at the end of your SHELL profile file (`.bashrc`/`.zshrc`)

```profile
source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin"
```

## Install `jekyll` & `bundler` (for GitHub Pages)

Add your user to rvm group ($USER will automatically insert your username):

```sh
gem install jekyll bundler
```

---

## Jekyll ruby commands:

Run local server: `bundle exec jekyll serve --livereload`

Install project dependencies: `bundle`

Add a dependency: `bundle add minima`

```sh
mkdir my-proj
cd my-proj
bundle init     # creates Gemfile
bundle config set path 'vendor/bundle'
bundle add jekyll
bundle exec jekyll new --force --skip-bundle .
bundle install
bundle exec jekyll serve --livereload
```
