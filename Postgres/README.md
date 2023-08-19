# PostgreSQL <img src='https://cdn-icons-png.flaticon.com/512/5968/5968342.png' width="17">

## Linux <img src='https://cdn-icons-png.flaticon.com/512/6124/6124995.png' width="17">

[Postgres Linux Downloads Page](https://www.postgresql.org/download/linux)

Instructions: [Ubuntu](https://www.postgresql.org/download/linux/ubuntu/) | [RedHat/Fedora/CentOS](https://www.postgresql.org/download/linux/redhat/)

[Digital Ocean article (Ubuntu 20.04)](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04)

[Fedora Quick Docs](https://docs.fedoraproject.org/en-US/quick-docs/postgresql/)

[YT vid](https://www.youtube.com/watch?v=Nt1BjoULGWg)

---

## Windows <img src='https://seeklogo.com/images/W/windows-11-icon-logo-6C39629E45-seeklogo.com.png' width="17">

Download the [EDB Installation Wizard **zip file**](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

Default port is 5432

> Set **PORT** `5433` as **default PORT** (`5432` is in use by Postgres version **9** present in Windows itself)

**Start Postgres as Root i.e. `postgres` User (DB is `postgres`):**

```PowerShell
psql -U postgres -p 5433
```

**Start Postgres as role `Kumar` on DB `mytestdb`:**

```PowerShell
psql -U Kumar -d mytestdb -p 5433
```

**Assuming user `Kumar` (as Windows Logged-in User is also `Kumar`):**

```PowerShell
psql -p 5433 -d mytestdb
```

---
