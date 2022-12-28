# PostgreSQL 🐘

## Linux 🐧

Follow the [Download instructions on official page](https://www.postgresql.org/download/linux/ubuntu/)

Also refer this [Digital Ocean Article](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04)

---

## Windows 🪟

Download the [EDB Installation Wizard (.zip) file](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

Default port is 5432
>Set **PORT** `5433` as **default PORT** (`5432` is in use by Postgres version **9** present in Windows itself)

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
