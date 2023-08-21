# Postgres on Fedora:-

> Following [this guide](https://docs.fedoraproject.org/en-US/quick-docs/postgresql/)

---

## Installation:-

- Installing postgres server & it's additional supplied modules

  ```sh
  sudo dnf install postgresql-server postgresql-contrib
  ```

- The postgresql server is disabled by default. To set it to start at boot, run:

  ```sh
  sudo systemctl enable postgresql
  ```

- Initialise database and populate with initial data. It creates the configuration files `postgresql.conf` and `pg_hba.conf`

  ```sh
  sudo postgresql-setup --initdb --unit postgresql
  ```

- To start the postgresql server manually, run

  ```sh
  sudo systemctl start postgresql
  ```

---

### Create User and DB :-

- To create a user and database, you need to be run from a `postgres` user account on your system:

    ```sh
    sudo -u postgres psql
    ```

- Create a postgres user and a database.

    ```sql
    postgres=# CREATE USER kumar WITH PASSWORD 'SecretPassword';
    postgres=# CREATE DATABASE my_db OWNER kumar;
    ```

    Add **password** for the `postgres` user while you’re at it

    ```sql
    postgres=# \password postgres
    ```

    > Alternatively, you can do it right from your shell as:

    ```sh
    createuser kumar and createdb --owner=kumar test_db
    ```

- Now you can access your new database from your user account `kumar` and start using it.

    ```sh
    psql my_project
    ```

---

> ### Note:-

The postgresql server is using two main configuration files:

`/var/lib/pgsql/data/postgresql.conf`

`/var/lib/pgsql/data/pg_hba.conf`

If you’re getting `ident` errors from your app, refer [this post](https://serverfault.com/questions/406606/postgres-error-message-fatal-ident-authentication-failed-for-user?newreg=a4fdc3e21349449985cc65b82399c5b4). Ident auth automatically matches **Unix** usernames with Postgres usernames.

```sh
sudo gedit /var/lib/pgsql/data/pg_hba.conf
```

Edit `host all all 127.0.0.1/32 ident` to `host all all 127.0.0.1/32 md5`

This should allow most applications to connect with username/password.

---

## Postgres Download Page Instructions:-

The [Download Page](https://www.postgresql.org/download/linux/redhat/) has the binaries packaged for Red Hat distros

### PostgreSQL Yum Repository

The PostgreSQL Yum Repository will integrate with your normal systems and patch management, and provide ***automatic updates*** for all supported versions of PostgreSQL throughout the support lifetime of PostgreSQL.

The PostgreSQL Yum Repository currently supports:

```md
Red Hat Enterprise Linux
Rocky Linux
CentOS (7 and 6 only)
Oracle Linux
Fedora*
```

> *Due to the shorter support cycle on Fedora, all supported versions of PostgreSQL are not available on this platform. Don't use Fedora for server deployments.

### Setup Script

```sh
# Install the repository RPM:
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-38-x86_64/pgdg-fedora-repo-latest.noarch.rpm

# Install PostgreSQL:
sudo dnf install -y postgresql15-server

# Optionally initialize the database and enable automatic start:
sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
sudo systemctl enable postgresql-15
sudo systemctl start postgresql-15
```

These distributions all include PostgreSQL by default. To install PostgreSQL from these repositories, use the `dnf` command on Fedora:

```sh
dnf install postgresql-server
```

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

The repository contains many different packages including third party addons. The most common and important packages are (substitute the version number as required):

```txt
postgresql-server   ->  core database server
postgresql-contrib  ->  additional supplied modules
postgresql-client   ->  libraries and client binaries
postgresql-devel    ->  libraries and headers for C language development
```

### Post-installation

Due to policies for Red Hat family distributions, the PostgreSQL installation will not be enabled for automatic start or have the database initialized automatically. To make your database installation complete, you need to perform the following steps, based on your distribution:

```sh
postgresql-setup --initdb
systemctl enable postgresql.service
systemctl start postgresql.service
```

---
