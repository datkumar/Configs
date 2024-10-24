# Postgres on Ubuntu:-

> Following the [Postgres Ubuntu Download docs](https://www.postgresql.org/download/linux/ubuntu/) and [DigitalOcean tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04)


---

## Installing PostgreSQL server and utils

The PostgreSQL Global Development Group (PGDG) maintains an APT repository of PostgreSQL packages for Debian and Ubuntu located at https://apt.postgresql.org/pub/repos/apt


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

To view all your Postgres clusters:

```sh
pg_lsclusters
```

Output:

```sh
Ver Cluster Port Status Owner    Data directory              Log file
15  main    5432 online postgres /var/lib/postgresql/15/main /var/log/postgresql/postgresql-15-main.log
```

If you want to see it in pretty JSON format (ensure `jq` command is installed)

```sh
pg_lsclusters  -j | jq
```

Output:

```json
[
  {
    "version": "15",
    "ownergid": 133,
    "configuid": 127,
    "running": 1,
    "owneruid": 127,
    "port": "5432",
    "start": "auto",
    "configdir": "/etc/postgresql/15/main",
    "cluster": "main",
    "logfile": "/var/log/postgresql/postgresql-15-main.log",
    "socketdir": "/var/run/postgresql",
    "pgdata": "/var/lib/postgresql/15/main",
    "config": {
      "ident_file": "/etc/postgresql/15/main/pg_ident.conf",
      "port": "5432",
      "external_pid_file": "/var/run/postgresql/15-main.pid",
      "log_timezone": "Asia/Kolkata",
      "default_text_search_config": "pg_catalog.english",
      "shared_buffers": "128MB",
      "max_connections": "100",
      "datestyle": "iso, dmy",
      "max_wal_size": "1GB",
      "cluster_name": "15/main",
      "unix_socket_directories": "/var/run/postgresql",
      "lc_monetary": "en_IN",
      "timezone": "Asia/Kolkata",
      "hba_file": "/etc/postgresql/15/main/pg_hba.conf",
      "lc_messages": "en_IN",
      "min_wal_size": "80MB",
      "log_line_prefix": "%m [%p] %q%u@%d ",
      "data_directory": "/var/lib/postgresql/15/main",
      "lc_numeric": "en_IN",
      "dynamic_shared_memory_type": "posix",
      "lc_time": "en_IN"
    }
  }
]
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

To see config file location, enter `SHOW config_file;` inside a `psql` session:

```sql
my_test_db=# SHOW config_file ;
               config_file               
-----------------------------------------
 /etc/postgresql/15/main/postgresql.conf
(1 row)
```

When you view that `postgresql.conf` file, you'll see a section as:

```sh
#------------------------------------------------------------------------------
# FILE LOCATIONS
#------------------------------------------------------------------------------

# The default values of these variables are driven from the -D command-line
# option or PGDATA environment variable, represented here as ConfigDir.

data_directory = '/var/lib/postgresql/15/main'		# use data in another directory
					# (change requires restart)
hba_file = '/etc/postgresql/15/main/pg_hba.conf'	# host-based authentication file
					# (change requires restart)
ident_file = '/etc/postgresql/15/main/pg_ident.conf'	# ident configuration file
					# (change requires restart)

# If external_pid_file is not explicitly set, no extra PID file is written.
external_pid_file = '/var/run/postgresql/15-main.pid'			# write an extra PID file
					# (change requires restart)
```


The `pg_hba.conf` file contains client (host) based authentication rules as:

```sh
# Database administrative login by Unix domain socket
local   all             postgres                                peer

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     peer
# IPv4 local connections:
host    all             all             127.0.0.1/32            scram-sha-256
# IPv6 local connections:
host    all             all             ::1/128                 scram-sha-256
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     peer
host    replication     all             127.0.0.1/32            scram-sha-256
host    replication     all             ::1/128                 scram-sha-256
```


## Installing `pgAdmin4`

Referred from [pdAdmin4 APT download page](https://www.pgadmin.org/download/pgadmin-4-apt/)

```sh
# Install the public key for the repository (if not done previously):
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

# Create the repository configuration file:
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

# Install pgAdmin:
sudo apt install pgadmin4           # for BOTH web and desktop
sudo apt install pgadmin4-desktop   # for ONLY desktop
sudo apt install pgadmin4-web       # for ONLY web

# Configure the webserver (if you installed pgadmin for web)
sudo /usr/pgadmin4/bin/setup-web.sh
```

Web Setup Output:

```txt
Setting up pgAdmin 4 in web mode on a Debian based platform...
Creating configuration database...
NOTE: Configuring authentication for SERVER mode.

Enter the email address and password to use for the initial pgAdmin user account:

Email address: myemail@example.com
Password: 
Retype password:

pgAdmin 4 - Application Initialisation
======================================

Creating storage and log directories...
We can now configure the Apache Web server for you. This involves enabling the wsgi module and configuring the pgAdmin 4 application to mount at /pgadmin4. Do you wish to continue (y/n)? y
The Apache web server is running and must be restarted for the pgAdmin 4 installation to complete. Continue (y/n)? y
Apache successfully restarted. You can now start using pgAdmin 4 in web mode at http://127.0.0.1/pgadmin4
```

You can now visit `http://127.0.0.1/pgadmin4` to log-in to pgAdmin Web


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
