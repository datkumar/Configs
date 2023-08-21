# PostgreSQL <img src='https://cdn-icons-png.flaticon.com/512/5968/5968342.png' height="25">

---

## [Fedora Postgres Setup](./Fedora_Postgres.md) <img src='https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Fedora_icon_%282021%29.svg/2089px-Fedora_icon_%282021%29.svg.png' width="24">

---

## Linux <img src='https://cdn-icons-png.flaticon.com/512/6124/6124995.png' width="17">

[Postgres Linux Downloads Page](https://www.postgresql.org/download/linux)

Installation commands: [Ubuntu](https://www.postgresql.org/download/linux/ubuntu/) | [RedHat/Fedora/CentOS](https://www.postgresql.org/download/linux/redhat/)

[Digital Ocean article (Ubuntu 20.04)](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04)

[Fedora Quick Docs](https://docs.fedoraproject.org/en-US/quick-docs/postgresql/)

[Postgres Wiki](https://wiki.postgresql.org/wiki/Detailed_installation_guides)

[YT vid](https://www.youtube.com/watch?v=Nt1BjoULGWg)

Upgrading Postgres Version: [Postgres Docs](https://www.postgresql.org/docs/9.0/install-upgrading.html)

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
