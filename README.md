Simple Postgres Backup
======================

A very simple docker container that uses `pg_dumpall` to back
up a database running in a _different_ container. The container
runs once, and so you should exec it inside a cron job (e.g.
inside a kubernetes cron job).

Backups are set to have 640 permissions.

Configuration
-------------

There are a few important environment variables, *all of which
must be set, there are no defaults*:

+ `POSTGRES_USER` - Postgres username to use
+ `POSTGRES_PASSWORD` - Postgres password to use
+ `POSTGRES_PORT` - Postgres port to use
+ `POSTGRES_HOST` - Postgres host to use (e.g. your container name)
+ `BACKUP_LOCATION` - Filesystem location to store all the backups
+ `BACKUP_KEY` - The start of the filename.

You should bind-mount a reliable disk into the container with
a directory that you use as `BACKUP_LOCATION`. Dates are automatically
appended and you cannot control the date format. For example,
setting `BACKUP_LOCATION=/backups` and `BACKUP_KEY=mydb_backup`,
you would get backup names of the form:

```
/backups/mydb_backup_2024-04-23.sql.gz
```
