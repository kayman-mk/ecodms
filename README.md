# EcoDMS

Collecting tips and tricks to work with EcoDMS.

## Start reindex of documents
Sometimes the index process fails. But where is the button to trigger the index process again?

Open the EcoDMS client as administrator and navigate to Optionen > Einstellungen > Einstellungen >
Datei Indizierung and press Ctrl + F7 to reset the index (press the button which pops up).

## Perform a backup
Last time the backup triggerd on the UI didn't work. It threw an error message like "Process exited with
error code 1". To perform a backup do the following:

1. Stop EcoDMS `service ecodms stop`
1. Create a backup of the pg_hba.conf file: `cp /etc/postgresql/10.0/main/pg_hba.conf ~/pg_hba.conf.backup`
2. Allow all users to connect to Postgres database without credentials. Make sure that your database can't be reached
   from the internet! Add `local all all trust` as first line to the file.
3. Restart Postgres: `service postgresql restart`
4. Dump the database: `pg_dumpall -U postgres -f ~/ecodms_postgres.sql`
5. Copy the following directories from EcoDMS:
  - /opt/ecodms/workdir
  - /opt/ecodms/data
  - /opt/ecodms/ocr

## Restore a backup
I prefer to use a docker container for EcoDMS. I can simply kill the old container and start a new one. To restore
the data do the following:

1. Stop EcoDMS `service ecodms stop`
1. Create a backup of the pg_hba.conf file: `cp /etc/postgresql/10.0/main/pg_hba.conf ~/pg_hba.conf.backup`
2. Allow all users to connect to Postgres database without credentials. Make sure that your database can't be reached
   from the internet! Add `local all all trust` as first line to the file.
3. Restart Postgres: `service postgresql restart`
3. Drop the existing database: `psql -U postgres` and then `drop database ecosims;` 
4. Restore the database: `psql -U postgres < ecodms_postgres.sql`
5. Restore all ecodms directories which were backed up.
