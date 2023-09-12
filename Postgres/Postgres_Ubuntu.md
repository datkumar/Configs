# Postgres on Ubuntu:-

> Following the [Postgres Ubuntu Download docs](https://www.postgresql.org/download/linux/ubuntu/) and [DigitalOcean tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04)


---

## Installing Postgres


```sh
# Create the file repository configuration:
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# Update the package lists:
sudo apt-get update
# Install latest available version of PostgreSQL and additional utils:
sudo apt-get -y install postgresql postgresql-contrib
# To install a specific version, mention it like 'postgresql-12'
```

> **Enable the postgresql server is to start at boot**

```sh
sudo systemctl enable postgresql
```

Output:

```txt
Synchronizing state of postgresql.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable postgresql
```


> **Start the postgres server and check status:**

```sh
sudo systemctl start postgresql
sudo systemctl status postgresql
```

Output:

```sh
● postgresql.service - PostgreSQL RDBMS
     Loaded: loaded (/lib/systemd/system/postgresql.service; enabled; vendor preset: enabled)
     Active: active (exited) since Tue 2023-09-12 12:22:11 IST; 46min ago
   Main PID: 68475 (code=exited, status=0/SUCCESS)
      Tasks: 0 (limit: 38055)
     Memory: 0B
     CGroup: /system.slice/postgresql.service

Sep 12 12:22:11 kumar-Latitude-3420 systemd[1]: Starting PostgreSQL RDBMS...
Sep 12 12:22:11 kumar-Latitude-3420 systemd[1]: Finished PostgreSQL RDBMS.
```

By default, Postgres uses a concept called **roles** to handle authentication and authorization. These are, in some ways, similar to regular Unix-style accounts, but Postgres does not distinguish between users and groups and instead prefers the more flexible term “role”.

Upon installation, Postgres is set up to use `peer` authentication, meaning that it associates Postgres roles with a matching Unix/Linux system account. If a role exists within Postgres, a Unix/Linux username with the same name is able to sign in as that role. The installation procedure created a user account called `postgres` that is associated with the default Postgres role.

> **Accessing PostgreSQL interactive terminal `psql` as user `postgres`:**


```sh
sudo -u postgres psql
```

Output:

```sql
postgres=# \l
                                            List of databases
   Name    |  Owner   | Encoding | Collate | Ctype | ICU Locale | Locale Provider |   Access privileges   
-----------+----------+----------+---------+-------+------------+-----------------+-----------------------
 postgres  | postgres | UTF8     | en_IN   | en_IN |            | libc            | 
 template0 | postgres | UTF8     | en_IN   | en_IN |            | libc            | =c/postgres          +
           |          |          |         |       |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_IN   | en_IN |            | libc            | =c/postgres          +
           |          |          |         |       |            |                 | postgres=CTc/postgres
(3 rows)
```

```sql
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
```

> **Create new user:**

```sh
sudo -u postgres createuser --interactive
```

Output:

```sh
Enter name of role to add: kumar
Shall the new role be a superuser? (y/n) y
```

```sql
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 kumar     | Superuser, Create role, Create DB                          | {}
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
```

> **Create DB and assign it's owner:**

```sh
sudo -u postgres createdb --owner=kumar my_test_db
```

Now you can access your new database from your user account `kumar` and start using it:

```sh
kumar@kumar-Latitude-3420:~$ psql my_test_db 
psql (15.4 (Ubuntu 15.4-1.pgdg20.04+1))
Type "help" for help.

my_test_db=# 
```


---

## Removing old Postgres installation

> Make sure to back up your databases, logs and configuration files before deleting your installation


Stop the running postgresql service

```sh
sudo systemctl stop postgresql
```

See installed postgres packages

```sh
dpkg -l | grep postgres
```

Output:

```txt
ii  postgresql                                 15+253.pgdg20.04+1                  all          object-relational SQL database (supported version)
ii  postgresql-15                              15.4-1.pgdg20.04+1                  amd64        The World's Most Advanced Open Source Relational Database
ii  postgresql-client-15                       15.4-1.pgdg20.04+1                  amd64        front-end programs for PostgreSQL 15
ii  postgresql-client-common                   253.pgdg20.04+1                     all          manager for multiple PostgreSQL client versions
ii  postgresql-common                          253.pgdg20.04+1                     all          PostgreSQL database-cluster manager
```

Remove those packages along with their config files. It will ask for confirmation to remove configuration files and databases while purging

```sh
sudo apt-get --purge remove postgresql postgresql-15 postgresql-common postgresql-client-15 postgresql-client-common
# OR below command
# sudo apt-get --purge remove postgresql postgresql-*
```

Remove logs and other folders

```sh
sudo rm -rf /var/lib/postgresql/
sudo rm -rf /var/log/postgresql/
sudo rm -rf /etc/postgresql/
# OR below one-liner
# sudo rm -rf {/var/{lib,log},/etc}/postgresql/
```

Delete the `postgres` user:

```sh
sudo deluser postgres
```
