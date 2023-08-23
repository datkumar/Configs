# MongoDB on Fedora

> ## MongoDB _officialy_ supports RHEL, CentOS but **NOT** Fedora as mentioned [here](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition-on-red-hat-or-centos)

> We are following the [MongoDB manual](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat) and [Fedora guide](https://developer.fedoraproject.org/tech/database/mongodb/about.html)

---

## Configure `yum` repository

Create a `/etc/yum.repos.d/mongodb-org-7.0.repo` file so that you can install MongoDB directly using `yum` :

```sh
sudo nano /etc/yum.repos.d/mongodb-org-7.0.repo
```

Paste these lines inside and save the file.

```sh
[mongodb-org-7.0]
name=MongoDB Repository
# baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/7.0/x86_64/
baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/7.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-7.0.asc
```

---

> ## Note

The upper commented line is the one [as specified by MongoDB](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#configure-the-package-management-system-yum). It uses the $`releasever` variable as parameter in url. But we explicitly specify it as given in the [this Fedora guide](https://developer.fedoraproject.org/tech/database/mongodb/about.html)

Since we are on Fedora, our `releasever` value would be the version number of Fedora (like `38` for me). To check your release version you can run below line: (referred from [here](https://unix.stackexchange.com/questions/19701/yum-how-can-i-view-variables-like-releasever-basearch-yum0))

```sh
python -c 'import dnf, json; db = dnf.dnf.Base(); print(json.dumps(db.conf.substitutions, indent=2))'
```

It gives output as:

```json
{
  "arch": "x86_64",
  "basearch": "x86_64",
  "releasever": "38"
}
```

Since MongoDB supports RHEL, we need to replace `releasever` parameter with the latest available RHEL version. Refer [these Fedora Docs](https://docs.fedoraproject.org/en-US/quick-docs/fedora-and-red-hat-enterprise-linux/index.html) for substituting the appropriate RHEL version for your Fedora version. Also, you can pick the suitable RHEL versions among the ones shown at `https://repo.mongodb.org/yum/redhat/`

---

To add & enable the `yum` repository run: (refered from [Fedora docs](https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/))

```sh
sudo dnf config-manager --add-repo /etc/yum.repos.d/mongodb-org-7.0.repo
sudo dnf config-manager --set-enabled mongodb-org-7.0
```

## Install the MongoDB packages

```sh
sudo yum install -y mongodb-org
```

On Successful install, the output looks like:

```sh
Installed:
  mongodb-database-tools-100.8.0-1.x86_64             mongodb-mongosh-1.10.5-1.el8.x86_64   mongodb-org-7.0.0-1.el9.x86_64        mongodb-org-database-7.0.0-1.el9.x86_64
  mongodb-org-database-tools-extra-7.0.0-1.el9.x86_64 mongodb-org-mongos-7.0.0-1.el9.x86_64 mongodb-org-server-7.0.0-1.el9.x86_64 mongodb-org-tools-7.0.0-1.el9.x86_64
  openssl-1:3.0.9-2.fc38.x86_64

Complete!
```

Adjust `ulimit` settings to allow _number of open files_ as `64000` or more. Refer [mongodb `ulimit` reference](https://www.mongodb.com/docs/manual/reference/ulimit/)

## Directory Paths:

During installation, by-default, the package manager creates the `mongod` user account and uses:

`/var/lib/mongo` as the data directory

`/var/log/mongodb` as the log directory

Refer [here](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#to-use-non-default-directories) for using non-default directories

## Configure SELinux

- Install the required packages:

  ```sh
  sudo yum install -y git make checkpolicy policycoreutils selinux-policy-devel
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

> To uninstall the policy, go to the directory where you downloaded the policy repository and run: `sudo make uninstall`

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
  sudo systemctl start mongod
  ```

  if you get error like `Failed to start mongod.service: Unit mongod.service not found`

  Run the following command before starting: `sudo systemctl daemon-reload`

- Verify that MongoDB has started successfully

  ```sh
  sudo systemctl status mongod
  ```

  It gives output like:

  ```sh
  ● mongod.service - MongoDB Database Server
      Loaded: loaded (/usr/lib/systemd/system/mongod.service; enabled; preset: disabled)
      Drop-In: /usr/lib/systemd/system/service.d
              └─10-timeout-abort.conf
      Active: active (running) since Thu 2023-08-24 01:52:52 IST; 25s ago
      Docs: https://docs.mongodb.org/manual
  Main PID: 323533 (mongod)
      Memory: 182.5M
          CPU: 1.015s
      CGroup: /system.slice/mongod.service
              └─323533 /usr/bin/mongod -f /etc/mongod.conf

  Aug 24 01:52:52 fedora systemd[1]: Started mongod.service - MongoDB Database Server.
  Aug 24 01:52:52 fedora mongod[323533]: {"t":{"$date":"2023-08-23T20:22:52.911Z"},"s":"I",  "c":"CONTROL",  "id":7484500, "ctx":"main","msg":"Environment variable MONGODB_>
  ```

- To ensure that MongoDB will start following a system reboot:

  ```sh
  sudo systemctl enable mongod
  ```

- You can Stop MongoDB server via `sudo systemctl stop mongod`

  and Restart it via `sudo systemctl restart mongod`

- Starting a `mongosh` session on the same host machine as the `mongod` (by default, host is `localhost` and post is `27017`)

  ```sh
  mongosh
  ```

---

## Uninstalling MongoDB Community Edition:

- Refer [Uninstall guide](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#uninstall-mongodb-community-edition)

- Remove the SELinux policy as instructed [here](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#selinux-policy-considerations)

- Disable and remove the `yum` repository you added. Refer [these Fedora docs](https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/)

---
