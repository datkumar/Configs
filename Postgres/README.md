# PostgreSQL 🐘

## Linux 🐧

Follow [Download instructions](https://www.postgresql.org/download/linux/ubuntu/)

---

## Windows 🪟

Download the [EDB Installation Wizard (.zip) file](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

>Use **PORT** `5433` as **default PORT** `5432` is in use by Postgres version **9**)

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
