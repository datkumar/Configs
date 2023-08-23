# Postgres on Fedora:-

> Following the [Fedora docs](https://docs.fedoraproject.org/en-US/quick-docs/postgresql/) and [Postgres docs](https://www.postgresql.org/download/linux/redhat/)

---

## Useful Packages

The repository contains many different packages including third party addons. The most common and important packages are as below.

> Substitute the version number as required

```txt
postgresql-server   ->  core database server
postgresql-contrib  ->  additional supplied modules
postgresql-client   ->  libraries and client binaries
```

---

## Check current package version available

Which version of PostgreSQL you get will depends on the version of the distribution. Red Hat family distributions may ship with different versions of PostgreSQL by default, check with your distribution vendor to be sure.

Searching available postgres package for your distro:

```sh
dnf search postgresql-server
```

It gives output like:

```sh
=================== Name Exactly Matched: postgresql-server ===================
postgresql-server.i686 : The programs needed to create and run a PostgreSQL server
postgresql-server.x86_64 : The programs needed to create and run a PostgreSQL server
=================== Name Matched: postgresql-server ===================
postgresql-server-devel.i686 : PostgreSQL development header files and libraries
postgresql-server-devel.x86_64 : PostgreSQL development header files and libraries
```

> Note: The `i686` package corresponds to 32-bit and `x86_64` to 64-bit architecture.

For more details about the available packages:

```sh
dnf info postgresql-server
```

It gives output like:

```txt
Available Packages
Name         : postgresql-server
Version      : 15.1
Release      : 2.fc38
Architecture : i686
Size         : 6.4 M
Source       : postgresql-15.1-2.fc38.src.rpm
Repository   : fedora
Summary      : The programs needed to create and run a PostgreSQL server
URL          : http://www.postgresql.org/
License      : PostgreSQL
Description  : PostgreSQL is an advanced Object-Relational database management system (DBMS).
             : The postgresql-server package contains the programs needed to create
             : and run a PostgreSQL server, which will in turn allow you to create
             : and maintain PostgreSQL databases.

Name         : postgresql-server
Version      : 15.1
Release      : 2.fc38
Architecture : x86_64
Size         : 6.2 M
Source       : postgresql-15.1-2.fc38.src.rpm
Repository   : fedora
Summary      : The programs needed to create and run a PostgreSQL server
URL          : http://www.postgresql.org/
License      : PostgreSQL
Description  : PostgreSQL is an advanced Object-Relational database management system (DBMS).
             : The postgresql-server package contains the programs needed to create
             : and run a PostgreSQL server, which will in turn allow you to create
             : and maintain PostgreSQL databases.

```

If you want to install this available version, you don't need to specify the version in `sudo dnf install postgresql-server`

But if you want to install another version, add the Yum repository and then specify version during installation.

---

## PostgreSQL Yum Repository

The [Postgres Download Page](https://www.postgresql.org/download/linux/redhat/) has the binaries packaged for Red Hat distros

The PostgreSQL Yum Repository will integrate with your normal systems and patch management, and provide **_automatic updates_** for all supported versions of PostgreSQL throughout the support lifetime of PostgreSQL.

The PostgreSQL Yum Repository currently supports:

```md
Red Hat Enterprise Linux
Rocky Linux
CentOS (7 and 6 only)
Oracle Linux
Fedora\*
```

> \*Due to the shorter support cycle on Fedora, all supported versions of PostgreSQL are not available on this platform. Don't use Fedora for server deployments.

---

## Install Server & Supplied modules

> Install current available version in your distro:

```sh
sudo dnf install postgresql-server postgresql-contrib
```

**_OR_**

> Install Specific Version:

```sh
# Below commands could be diffferent for your distro.
# Refer https://www.postgresql.org/download/linux/redhat for the exact commands

# Install YUM repository RPM for your distro:
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-38-x86_64/pgdg-fedora-repo-latest.noarch.rpm

# Install server and modules of the specific version:
sudo dnf install -y postgresql15-server postgresql15-contrib
```

## Configuration

> If you installed a specific version use respective name wherever applicable

- The postgresql server is disabled by default. To set it to start at boot, run:

  ```sh
  sudo systemctl enable postgresql  # Or postgresql-15
  ```

  Output:

  ```sh
  Created symlink /etc/systemd/system/multi-user.target.wants/postgresql.service → /usr/lib/systemd/system/postgresql.service.
  ```

- Initialise database and populate with initial data.

  ```sh
  sudo postgresql-setup --initdb --unit postgresql
  ```

  **_OR_**

  ```sh
  sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
  ```

  It creates the files `/var/lib/pgsql/data/postgresql.conf` & `/var/lib/pgsql/data/pg_hba.conf` which the postgresql server uses as it's configuration.

  In addition,

  Database initialized in `/var/lib/pgsql/data`

  Logs initialized in `/var/lib/pgsql/initdb_postgresql.log`

- To start the postgresql server manually, run

  ```sh
  sudo systemctl start postgresql # Or postgresql-15
  ```

- To view status, run : `sudo systemctl status postgresql`

  Output:

  ```sh
  ● postgresql.service - PostgreSQL database server
      Loaded: loaded (/usr/lib/systemd/system/postgresql.service; enabled; preset: disabled)
      Drop-In: /usr/lib/systemd/system/service.d
              └─10-timeout-abort.conf
      Active: active (running) since Wed 2023-08-23 00:32:48 IST; 10s ago
      Process: 191597 ExecStartPre=/usr/libexec/postgresql-check-db-dir postgresql (code=exited, status=0/SUCCESS)
    Main PID: 191599 (postmaster)
        Tasks: 7 (limit: 11770)
      Memory: 17.2M
          CPU: 45ms
      CGroup: /system.slice/postgresql.service
              ├─191599 /usr/bin/postmaster -D /var/lib/pgsql/data
              ├─191600 "postgres: logger "
              ├─191601 "postgres: checkpointer "
              ├─191602 "postgres: background writer "
              ├─191604 "postgres: walwriter "
              ├─191605 "postgres: autovacuum launcher "
              └─191606 "postgres: logical replication launcher "

  Aug 23 00:32:47 fedora systemd[1]: Starting postgresql.service - PostgreSQL database server...
  Aug 23 00:32:48 fedora postmaster[191599]: 2023-08-23 00:32:48.022 IST [191599] LOG:  redirecting log output to logging collector process
  Aug 23 00:32:48 fedora postmaster[191599]: 2023-08-23 00:32:48.022 IST [191599] HINT:  Future log output will appear in directory "log".
  Aug 23 00:32:48 fedora systemd[1]: Started postgresql.service - PostgreSQL database server.
  ```

---

## Create User and DB :-

- To create a user and database, you need to be run from a `postgres` user account on your system:

  ```sh
  sudo -u postgres psql
  ```

- Add **password** for the `postgres` user

  ```txt
  postgres=# \password postgres
  ```

- Create a postgres user and a database.

  ```txt
  postgres=# CREATE USER kumar WITH PASSWORD 'SecretPassword';
  postgres=# ALTER USER kumar Superuser;
  postgres=# CREATE DATABASE my_db OWNER kumar;
  ```

  Alternatively, you can do it right from your shell as:

  ```sh
  createuser kumar and createdb --owner=kumar test_db
  ```

- Now you can access your new database from your user account `kumar` and start using it.

  ```sh
  psql my_db
  ```

---

> ### Ident error

Ident auth automatically matches **Unix** usernames with **Postgres** usernames.

If you’re getting `ident` errors from your app, refer [this post](https://serverfault.com/questions/406606/postgres-error-message-fatal-ident-authentication-failed-for-user?newreg=a4fdc3e21349449985cc65b82399c5b4) .

```sh
sudo gedit /var/lib/pgsql/data/pg_hba.conf
```

Edit `host all all 127.0.0.1/32 ident` to `host all all 127.0.0.1/32 md5`

This should allow most applications to connect with username/password.

---

## Additional Configuration

[Postgres Server Configuration](https://www.postgresql.org/docs/current/runtime-config.html)

> ### SELinux

SELinux (Security Enhacned Linux) is a security architecture for Linux systems that allows administrators to have more control over who can access the system. It was originally developed by the United States National Security Agency (NSA) as a series of patches to the Linux kernel using Linux Security Modules (LSM).

[Fedora Postgres docs](https://docs.fedoraproject.org/en-US/quick-docs/selinux-getting-started/#_SELinux_states_and_modes)

States and Modes: [Intro](https://docs.fedoraproject.org/en-US/quick-docs/selinux-getting-started/#_SELinux_states_and_modes) , [Management](https://docs.fedoraproject.org/en-US/quick-docs/selinux-changing-states-and-modes/)

---

> ### Logging

[Fedora Docs](https://docs.fedoraproject.org/en-US/quick-docs/postgresql/#logging) , [Postgres Docs](https://www.postgresql.org/docs/current/runtime-config-logging.html)

---

> ### Optimize Performance

[Fedora Docs](https://docs.fedoraproject.org/en-US/quick-docs/postgresql/#optimization) , [Postgres Wiki](https://wiki.postgresql.org/wiki/Tuning_Your_PostgreSQL_Server)

---

> ### Config: `systemd`, `postgresql.conf` , `pg_hba.conf`

[Fedora Postgres docs](https://docs.fedoraproject.org/en-US/quick-docs/postgresql/#configuration) , [Fedora `systemd` docs](https://docs.fedoraproject.org/en-US/quick-docs/systemd-understanding-and-administering/) ,

[Postgres Client Auth config in `pg_hba.conf`](https://www.postgresql.org/docs/current/auth-pg-hba-conf.html) (HBA is Host-based Authentication)

---

## Install `pdAdmin4`

Following [their download page instructions](https://www.pgadmin.org/download/pgadmin-4-rpm/)

- First, uninstall any pgAdmin repo packages that you may already have installed

  ```sh
  sudo rpm -e pgadmin4-fedora-repo
  ```

- To setup the repository for this set of builds on Fedora:

  ```sh
  sudo rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-fedora-repo-2-1.noarch.rpm
  ```

- To install pdAdmin, run **one** of these commands:

  ```sh
  sudo yum install pgadmin4           # both web and desktop
  sudo yum install pgadmin4-desktop   # ONLY desktop
  sudo yum install pgadmin4-web       # ONLY web
  ```

- The web mode requires an additional step:

  ```sh
  sudo /usr/pgadmin4/bin/setup-web.sh
  ```

  It will prompt you to provide an email & password. Then you can start using pgAdmin 4 in web mode at `http://127.0.0.1/pgadmin4`

---

### Upgrading pdAdmin4

```sh
sudo yum upgrade pgadmin4
```

---

[Other Postgres Clients](https://wiki.postgresql.org/wiki/PostgreSQL_Clients)
