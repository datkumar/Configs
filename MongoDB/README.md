# MongoDB <img src='https://cdn.icon-icons.com/icons2/2415/PNG/512/mongodb_original_logo_icon_146424.png' width="30">

[MongoDB Community Installation Manuals](https://www.mongodb.com/docs/manual/tutorial/)

[Download MongoDB Community Edition Releases](https://www.mongodb.com/download-center/community/releases)

MongoDB Install Docs: [Ubuntu](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#std-label-install-mdb-community-redhat-centos), [RedHat](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#std-label-install-mdb-community-redhat-centos)

MongoDB Installation Docs : [Red Hat](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/) , [Ubuntu]()

[Fedora blog](https://developer.fedoraproject.org/tech/database/mongodb/about.html)

## Configure `yum`

Create a `/etc/yum.repos.d/mongodb-org-7.0.repo` file so that you can install MongoDB directly using `yum` :

```profile
[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/7.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-7.0.asc
```

## Install the MongoDB packages

```sh
sudo yum install -y mongodb-org
```

- Adjust `ulimit` settings to allow _number of open files_ as `64000` or more. Refer [mongodb `ulimit` reference](https://www.mongodb.com/docs/manual/reference/ulimit/)

## Directory Paths:

During installation, by-default, the package manager creates the `mongod` user account and uses:

`/var/lib/mongo` as the data directory

`/var/log/mongodb` as the log directory

Refer [here](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#to-use-non-default-directories) for using non-default directories

## Configure SELinux

- Install the required packages:

  ```sh
  sudo yum install git make checkpolicy policycoreutils selinux-policy-devel
  ```

- Download the SELinux policy repository

  ```sh
  git clone https://github.com/mongodb/mongodb-selinux
  ```

- Build the policy

  ```sh
  cd mongodb-selinux
  make
  ```

- Apply the policy

  ```sh
  sudo make install
  ```

To uninstall the policy, go to the directory where you downloaded the policy repository and run:

```sh
sudo make uninstall
```

## Runing MongoDB

To run and manage your mongod process, you will be using your operating system's built-in **init system**. The init system is the first process started on a Linux platform after the kernel starts, and manages all other processes on the system. The init system uses an **init script** to start, restart, or stop a daemon process, such as `mongod`. If you installed MongoDB via a package manager, an init script has been provided for your system as part of the installation

- Recent versions of Linux tend to use `systemd` (which uses the `systemctl` command), while older versions of Linux tend to use System V `init` (which uses the `service` command).

  To check which init system your platform uses:

  ```sh
  ps --no-headers -o comm 1
  ```

  Assuming `systemd` here, but refer [here](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#procedure) for `init` systems

- Start MongoDB

  ```sh
  https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#start-mongodb
  ```

  if you get error like `Failed to start mongod.service: Unit mongod.service not found`

  Run the following command before starting: `sudo systemctl daemon-reload`

- Verify that MongoDB has started successfully

  ```sh
  sudo systemctl status mongod
  ```

- To ensure that MongoDB will start following a system reboot:

  ```sh
  sudo systemctl enable mongod
  ```

- You can Stop MongoDB via `sudo systemctl stop mongod`

  and Restart it via `sudo systemctl restart mongod`

- Starting a `mongosh` session on the same host machine as the `mongod` (by default, host is `localhost` and post is `27017`)

  ```sh
  mongosh
  ```

---

## Uninstalling MongoDB Community Edition:

Refer [Uninstall guide](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#uninstall-mongodb-community-edition)

Make sure to remove the SELinux policy as instructed [here](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#selinux-policy-considerations)

---
