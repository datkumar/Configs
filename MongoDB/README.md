# MongoDB <img alt="MongoDB" src="../assets/mongodb.svg" height="28">

Refer their [Install MongoDB Community Edition on Linux](https://www.mongodb.com/docs/manual/administration/install-on-linux/) page for installation instructions of your Linux distro

## Install MongoDB Community Edition

### Fedora-specific MongoDB install steps

For installing on MongoDB Community Edition on **Fedora** we'll refer their [RedHat guide](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/)

- Configure the `yum` repository by creating a `.repo` file, for example: `sudo nano /etc/yum.repos.d/mongodb-org-8.0.repo` and paste given contents inside it:

  ```sh
  [mongodb-org-8.0]
  name=MongoDB Repository
  baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/8.0/x86_64/
  gpgcheck=1
  enabled=1
  gpgkey=https://pgp.mongodb.com/server-8.0.asc
  ```

- Install the latest stable version of MongoDB:

  ```sh
  sudo yum install -y mongodb-org
  ```

  `yum` automatically upgrades packages when newer versions become available

  By default, MongoDB runs using the `mongod` user account and uses the following default directories:

  - `/var/lib/mongo` as the **data** directory
  - `/var/log/mongodb` as the **log** directory

  The package manager creates the default directories during installation. The owner and group name are `mongod`. To use non-default directories, refer [here](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#to-use-non-default-directories)

- Configure **SELinux** policy (assuming default settings):

  ```sh
  # Install required dependencies
  sudo yum install git make checkpolicy policycoreutils selinux-policy-devel

  # Download the policy repository
  git clone https://github.com/mongodb/mongodb-selinux

  # Build the policy
  cd mongodb-selinux
  make

  # Apply the policy
  sudo make install
  ```

  The SELinux policy is designed to work with the configuration that results from a standard MongoDB `.rpm` installation and makes [these assumptions](https://github.com/mongodb/mongodb-selinux/blob/master/README.md#standard-installation). It is designed for `mongod` servers and does not apply to other MongoDB daemons or tools such as `mongos`, `mongosh`

  To uninstall the policy, go to the directory where you downloaded the policy repository and run `sudo make uninstall`

### Ubuntu-specific MongoDB install steps

For installing on MongoDB Community Edition on **Ubuntu** we'll refer their [Ubuntu guide](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)

- Import public key

  ```sh
  # Prerequisites
  sudo apt-get install gnupg curl

  # Import MongoDB public GPG key
  curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
    sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
    --dearmor
  ```

- Create a `.list` file for `apt` repositories and reload db

  ```sh
  # Create .list file
  echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

  # Reload the local packages db
  sudo apt-get update
  ```

- Install the latest stable release

  ```sh
  sudo apt-get install -y mongodb-org
  ```

### Verify MongoDB installation

- To run MongoDB Community Edition, check your **Init System** and follow [the procedure](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#procedure) accordingly accordingly:

  ```sh
  ps --no-headers -o comm 1
  ```

  Mine was `systemd` (`systemctl`). Sol I'll do the following to start, enable and verify the `mongod` service:

  ```sh
  sudo systemctl daemon-reload
  sudo systemctl start mongod
  sudo systemctl status mongod
  sudo systemctl enable mongod
  ```

  The output should look like:

  ```txt
  ● mongod.service - MongoDB Database Server
      Loaded: loaded (/usr/lib/systemd/system/mongod.service; enabled; preset: disabled)
      Drop-In: /usr/lib/systemd/system/service.d
              └─10-timeout-abort.conf
      Active: active (running) since Sat 2024-11-02 15:21:19 IST; 3s ago
  Invocation: a2a394e4298640bf98dd7a842064821d
        Docs: https://docs.mongodb.org/manual
    Main PID: 12577 (mongod)
      Memory: 189.9M (peak: 275.8M)
          CPU: 316ms
      CGroup: /system.slice/mongod.service
              └─12577 /usr/bin/mongod -f /etc/mongod.conf

  Nov 02 15:21:19 fedora-pc systemd[1]: Started mongod.service - MongoDB Database Server.
  Nov 02 15:21:19 fedora-pc mongod[12577]: {"t":{"$date":"2024-11-02T09:51:19.218Z"},"s":"I",  "c":"CONTROL",  "id":748>● mongod.service - MongoDB Database Server
      Loaded: loaded (/usr/lib/systemd/system/mongod.service; enabled; preset: disabled)
      Drop-In: /usr/lib/systemd/system/service.d
              └─10-timeout-abort.conf
      Active: active (running) since Sat 2024-11-02 15:21:19 IST; 3s ago
  Invocation: a2a394e4298640bf98dd7a842064821d
        Docs: https://docs.mongodb.org/manual
    Main PID: 12577 (mongod)
      Memory: 189.9M (peak: 275.8M)
          CPU: 316ms
      CGroup: /system.slice/mongod.service
              └─12577 /usr/bin/mongod -f /etc/mongod.conf

  Nov 02 15:21:19 fedora-pc systemd[1]: Started mongod.service - MongoDB Database Server.
  Nov 02 15:21:19 fedora-pc mongod[12577]: {"t":{"$date":"2024-11-02T09:51:19.218Z"},"s":"I",  "c":"CONTROL",  "id":748>
  ```

- Launch the mongo shell as: `mongosh`. When you enter `mongosh`, the output would like below. Enter `help` to know commands and press `Ctrl d` to exit

  ```txt
  Current Mongosh Log ID: 67254482d59e272c2c6b128b
  Connecting to:    mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.3.3
  Using MongoDB:    8.0.3
  Using Mongosh:    2.3.3

  For mongosh info see: https://www.mongodb.com/docs/mongodb-shell/

  ------
    The server generated these startup warnings when booting
    2024-11-02T02:41:47.410+05:30: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
    2024-11-02T02:41:47.410+05:30: For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile
    2024-11-02T02:41:47.410+05:30: For customers running the current memory allocator, we suggest changing the contents of the following sysfsFile
    2024-11-02T02:41:47.410+05:30: We suggest setting the contents of sysfsFile to 0.
    2024-11-02T02:41:47.410+05:30: We suggest setting swappiness to 0 or 1, as swapping can cause performance problems.
  ------

  test>
  ```

- Configure **Access Control**:

  ```sh
  test> use admin
  switched to db admin
  admin> db.createUser(
  ...   {
  ...     user: "kumar",
  ...     pwd: passwordPrompt(),
  ...     roles: [
  ...       { role: "userAdminAnyDatabase", db: "admin" },
  ...       { role: "readWriteAnyDatabase", db: "admin" }
  ...     ]
  ...   }
  ... )
  Enter password
  ********{ ok: 1 }
  admin> disableTelemetry()
  Telemetry is now disabled.
  admin>
  ```

**Troubleshooting**:

If you get connection refused stating some `openssl` configuration error on Fedora, you might need to install openssl variant of the `mongosh` package as mentioned by [this answer](https://www.mongodb.com/community/forums/t/openssl-error-when-starting-mongosh/243323/2):

```sh
sudo yum remove mongodb-mongosh
sudo yum install mongodb-mongosh-shared-openssl3
sudo dnf install mongodb-org
```

## Install MongoDB Compass

As per [their docs](https://www.mongodb.com/docs/compass/current/install/), we'll download the `.rpm` package for Fedora OR the `.deb` package for Debian/Ubuntu

```sh
cd ~/Downloads

# Fedora (.rpm) download and install
wget https://downloads.mongodb.com/compass/mongodb-compass-1.44.5.x86_64.rpm
sudo yum install mongodb-compass-1.44.5.x86_64.rpm

# Ubuntu (.deb) download and install
wget https://downloads.mongodb.com/compass/mongodb-compass_1.46.6_amd64.deb
sudo apt install ./mongodb-compass_1.46.6_amd64.deb

# Launch MongoDB Compass
mongodb-compass
```

**Troubleshooting**:

- **Credentials not being stored**: This can happen especially if you are on non-standard desktop environments such as Sway instead of GNOME. You'll have to copy and modify the `.desktop` application entry as:

  ```sh
  cp /usr/share/applications/mongodb-compass.desktop ~/.local/share/applications
  nano ~/.local/share/applications/mongodb-compass.desktop
  ```

  Replace the `Exec` command's line with this:

  ```sh
  Exec=env XDG_CURRENT_DESKTOP="GNOME" mongodb-compass %U
  ```
