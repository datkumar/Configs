# Windows Commands 🪟

---

## Booting ⏯️

**Restart: `shutdown /r`**

**Shutdown: `shutdown /s`**

**Hibernate  `shutdown /h`**

---

**Print `PATH`  with each entry on separate line**

```PowerShell
($env:Path).Replace(';',"`n")
```

---

**Reload Environment Variables:  `refreshenv`**

---

## String Search 🔍

**`findstr` in CMD:**

```cmd
C:\> netstat -na | findstr /c:"PORT"
```

**`Select-String` in PowerShell:**

```PowerShell
C:\> netstat -na | Select-String "PORT"
```

---
