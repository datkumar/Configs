# PostgreSQL <img alt="PostgreSQL" src="../assets/postgres.svg" height="28">

Go to the [Postgres Linux downloads page](https://www.postgresql.org/download/linux/) and follow instructions as per your Linux distro and postgres versions

## Packages available

An overview of the various library packages available (names as present for **Fedora**):

| Package              | Purpose                                                                                                                                                                                                                                                                                                       |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `postgresql`         | Core PostgreSQL client utilities like `psql`, `pg_dump`, `pg_restore`                                                                                                                                                                                                                                         |
| `postgresql-server`  | Everything needed to run a PostgreSQL server instance on your machine. Includes server binaries like `postgres` daemon, init-tools, config files etc                                                                                                                                                          |
| `postgresql-client`  | Client-only package that provides the tools needed to connect to a PostgreSQL server (local or remote)                                                                                                                                                                                                        |
| `pgAdmin4`           | A GUI tool for managing PostgreSQL databases                                                                                                                                                                                                                                                                  |
| `postgresql-contrib` | A set of additional modules and extensions to add extra functionality to PostgreSQL such as full-text search, advanced statistical analysis, or custom data types. For example, `hstore` (key-value store), `pg_stat_statements` (query performance stats), `tablefunc` (functions for crosstab/pivot tables) |
| `libpq`              | The C library for interfacing with PostgreSQL                                                                                                                                                                                                                                                                 |

---

- You can either install Postgres via your Linux distro's **package manager** (`dnf`, `apt` etc.) or via the packages from the **PGDG repo**
- The latter is better for the latest up-to-date releases, but the former is better for stability as it's well-tested for your distro. Last time I tried, PgAdmin4 didn't install correctly via the Fedora's `dnf`, so **I'll recommend PGDG** method

> Whichever one you pick **don't mix packages** between the two i.e. install all your packages from only either one of the two, NOT like `postgres*` ones from package manager and `pgadmin4` ones from PGDG. This is done to avoid conflicts

---

## Installing Postgres (via PGDG)

As per the instructions for **Postgres 17** on **Fedora** selected from their [RedHat guide](https://www.postgresql.org/download/linux/redhat/):

- Add the PGDG Fedora repository RPM

  ```sh
  sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-40-x86_64/pgdg-fedora-repo-latest.noarch.rpm
  ```

  > Due to the shorter support cycle on Fedora, **all supported versions of PostgreSQL are not available for Fedora**

  For example, when I recently upgraded to **Fedora 41**, the PGDG repo's `.rpm` files were not yet present for Fedora 41 at `https://download.postgresql.org/pub/repos/yum/reporpms/F-41-x86_64/` url, but were available at one Fedora version lower at `https://download.postgresql.org/pub/repos/yum/reporpms/F-40-x86_64/` from which `pgdg-fedora-repo-latest.noarch.rpm` was the required one

- Install specified latest-version packages for server, client and extensions. Note that the client package is called `postgresql`; no such package as `postgresql-client` for Fedora

  ```sh
  # Might ask to import GPG keys
  sudo dnf install -y postgresql17-server postgresql17 postgresql17-contrib
  ```

  The binaries (like `psql`, `pg_dump`, `createdb` etc.) would be installed in location such as: `/usr/pgsql-17/bin`

- Initialize Postgres:

  ```sh
  sudo /usr/pgsql-17/bin/postgresql-17-setup initdb
  ```

  Database would be initialized in the folder `/var/lib/pgsql/17/data`. Within it, the `pg_hba.conf` file is used for configuring Client Authentication

  Also, you can find the DB initialization log would be at `/var/lib/pgsql/17/initdb.log`

- Enable automatic start on booting up and verify status

  ```sh
  sudo systemctl enable postgresql-17
  sudo systemctl start postgresql-17
  sudo systemctl status postgresql-17
  ```

  The output would look like:

  ```sh
  ● postgresql-17.service - PostgreSQL 17 database server
      Loaded: loaded (/usr/lib/systemd/system/postgresql-17.service; enabled; preset: disabled)
      Drop-In: /usr/lib/systemd/system/service.d
              └─10-timeout-abort.conf
      Active: active (running) since Sat 2024-11-02 15:07:13 IST; 29min ago
  Invocation: 334f6941dbcc4ffda358e991e1a99d5a
        Docs: https://www.postgresql.org/docs/17/static/
    Main PID: 1449 (postgres)
        Tasks: 7 (limit: 37332)
      Memory: 47.5M (peak: 50M)
          CPU: 303ms
      CGroup: /system.slice/postgresql-17.service
              ├─1449 /usr/pgsql-17/bin/postgres -D /var/lib/pgsql/17/data/
              ├─1490 "postgres: logger "
              ├─1495 "postgres: checkpointer "
              ├─1496 "postgres: background writer "
              ├─1498 "postgres: walwriter "
              ├─1499 "postgres: autovacuum launcher "
              └─1500 "postgres: logical replication launcher "

  Nov 02 15:07:13 fedora-pc systemd[1]: Starting postgresql-17.service - PostgreSQL 17 database server...
  Nov 02 15:07:13 fedora-pc postgres[1449]: 2024-11-02 15:07:13.071 IST [1449] LOG:  redirecting log output to logging collector process
  Nov 02 15:07:13 fedora-pc postgres[1449]: 2024-11-02 15:07:13.071 IST [1449] HINT:  Future log output will appear in directory "log".
  Nov 02 15:07:13 fedora-pc systemd[1]: Started postgresql-17.service - PostgreSQL 17 database server.
  ```

## Post-install steps for Postgres

Run `psql --help` to know available options

- First admin login (As user `postgres`, connect to db `postgres`):

  ```sh
  sudo -u postgres psql
  ```

- Set Admin password:

  ```sh
  postgres=# \password postgres
  Enter new password for user "postgres":
  Enter it again:
  postgres=#
  ```

- Create User i.e. role and their owned DB

  ```sql
  postgres=# CREATE USER kumar WITH PASSWORD 'abcd1234';
  CREATE ROLE
  postgres=# ALTER USER kumar SUPERUSER;
  ALTER ROLE
  postgres=# CREATE DATABASE my_db OWNER kumar;
  CREATE DATABASE
  postgres=# exit
  ```

  You can also create new user from Shell:

  ```sh
  createuser --interactive
  ```

  The output would look like:

  ```txt
  Enter name of role to add: kumar-alt
  Shall the new role be a superuser? (y/n) n
  Shall the new role be allowed to create databases? (y/n) n
  Shall the new role be allowed to create more new roles? (y/n) n
  ```

- Current shell user is `kumar` (type `whomai` to know your username in shell). Connect to db `my_db` (whose owner is also `kumar`) as:

  ```sh
  psql my_db
  ```

  The **ident** auth automatically matches UNIX usernames with Postgres usernames. See the `/var/lib/pgsql/17/data/pg_ident.conf` file

- List Databases:

  ```sh
  my_db=# \l
                                                        List of databases
    Name    |  Owner   | Encoding | Locale Provider |   Collate   |    Ctype    | ICU Locale | ICU Rules |   Access privileges
  -----------+----------+----------+-----------------+-------------+-------------+------------+-----------+-----------------------
  my_db     | kumar    | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |            |           |
  postgres  | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |            |           |
  template0 | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |            |           | =c/postgres          +
            |          |          |                 |             |             |            |           | postgres=CTc/postgres
  template1 | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |            |           | =c/postgres          +
            |          |          |                 |             |             |            |           | postgres=CTc/postgres
  (4 rows)
  ```

- List Users:

  ```sql
  my_db=# \du
                              List of roles
  Role name |                         Attributes
  -----------+------------------------------------------------------------
  kumar     | Superuser
  kumar-alt |
  postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS
  ```

- List Tables:

  ```sh
  postgres=# \dt
  Did not find any relations.
  ```

- Connect to another database:

  ```sh
  my_db=# \c postgres
  You are now connected to database "postgres" as user "kumar".
  ```

- More commands:

  - Describe table schema: `\d tablename`
  - Clear screen: `Ctrl + l`
  - Quit: `\q` or `Ctrl d`
  - Show more slash commands: `\?`

## Installing PgAdmin

Visit the [pgAgmin download page](https://www.pgadmin.org/download/) and refer instructions as per your distro's package manager (`dnf`, `apt` etc)

> If your current version of your distro is supported, then only go ahead with the mentioned installation steps. If not supported, you might not get everything installed as expected

### Steps to install `pgadmin4` on Fedora

Following the [pgAdmin download guide for RPM](https://www.pgadmin.org/download/pgadmin-4-rpm/):

- Uninstall any pgAdmin repo packages that you may already have installed

  ```sh
  sudo rpm -e pgadmin4-fedora-repo
  ```

- Setup the repository for this set of builds on Fedora

  ```sh
  sudo rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-fedora-repo-2-1.noarch.rpm
  ```

- Check details of `pgadmin4` package now available to install: `dnf info pgadmin4`

  - You might get some **not found errors** in the metadata like I got below when I was on **Fedora 41**:

    ```txt
    pgadmin4                                                                     100% | 625.0   B/s | 584.0   B |  00m01s
    >>> Status code: 404 for https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/fedora/fedora-41-x86_64/repodata/repomd.x
    >>> Status code: 404 for https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/fedora/fedora-41-x86_64/repodata/repomd.x
    >>> Status code: 404 for https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/fedora/fedora-41-x86_64/repodata/repomd.x
    >>> Status code: 404 for https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/fedora/fedora-41-x86_64/repodata/repomd.x
    >>> Librepo error: Cannot download repomd.xml: Cannot download repodata/repomd.xml: All mirrors were tried
    ```

    You can visit `https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/fedora/fedora-41-x86_64` to confirm there are no entries available or either the page doesn't exist for Fedora 41 files; but they do exist for a lower version at `https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/fedora/fedora-40-x86_64`. So you'll have to manually edit the repo file as `sudo nano /etc/yum.repos.d/pgadmin4.repo` and replace the `baseurl` with the valid url

  - Also in that `pdadmin4` packages available output, you might have more than one packages named `pgadmin4`. This is because Fedora maintains it's own `pgadmin4` package in it's repositories, but we want to install the one provided by our newly added `pgadmin4.repo` and set it as the highest priority one. It's also better to disable the `padmin4` package from fedora and it's update repositories

  - So finally, our `/etc/yum.repos.d/pgadmin4.repo` file would look like:

    ```sh
    [pgAdmin4]
    name=pgadmin4
    #baseurl=https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/fedora/fedora-$releasever-$basearch
    enabled=1
    repo_gpgcheck=1
    gpgcheck=1
    gpgkey=file:///etc/pki/rpm-gpg/PGADMIN_PKG_KEY
    # our changes:
    baseurl=https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/fedora/fedora-40-x86_64
    priority=1
    ```

  - To disable the `pdamin4` coming from Fedora's repositories, add below line at the end of each entry within the repo files `/etc/yum.repos.d/fedora.repo` and `/etc/yum.repos.d/fedora-updates.repo`:

    ```sh
    excludepkgs=pgadmin4*
    ```

  - Refresh the package manager's cache:

    ```sh
    dnf clean all
    dnf makecache
    ```

- Install pgAdmin for both desktop and web modes (might ask to import keys)

  ```sh
  sudo yum install pgadmin4
  ```

- Run the web setup script to configure the system to run in web mode:

  ```sh
  # Would ask for email and password
  sudo /usr/pgadmin4/bin/setup-web.sh
  ```

---

## Install DBeaver <img alt="DBeaver" src="../assets/dbeaver.svg" height="28">

DBeaver supports all popular SQL databases. It's a free cross-platform database tool for everyone working with data (devs, admins, analysts etc)

As per the [DBeaver Community Edition download](https://dbeaver.io/download/) page, to install it as a `flatpak`:

```sh
flatpak install flathub io.dbeaver.DBeaverCommunity
```
