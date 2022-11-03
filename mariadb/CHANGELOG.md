# Changelog

## 2.5.1.4 (forked)

- Bump base image to 2022.09.0

## 2.5.1.3 (forked)

- Bugfix in periodic export bash script

## 2.5.1.2 (forked)

- **New function**: Periodically export homeassistant database to minimize data loss in case of power failure. Disabled by default. 

## 2.5.1.1 (forked)

- **New function**: Automatically export homeassistant database on add-on backup and stop, automatically import homeassistant database on add-on start (see documentation for details)
- Automatically apply schema modifications to the schema created by the recorder, no more add-on updates because of schema changes
- Sign add-on with Codenotary Community Attestation Service (CAS)
- Merge upstream changes

## 2.5.1

- Remove deprecated `innodb-buffer-pool-instances`

## 2.5.0

- Update alpine to 3.16 and s6 to v3

## 2.4.0.24 (forked)

- Fix issue [Backup of the add-on is impossible #11](https://github.com/lmagyar/homeassistant-addon-mariadb-inmemory/issues/11)
- Fix finish script for S6-overlay v3
- Update apparmor.txt for S6-overlay v3

## 2.4.0.23 (forked)

- Use new recorder schema from core 2022.5.0 and 2022.6.0
- Use dynamic row format
- Bump alpine base image from 3.13 to 3.15
- Bump MariaDB from 10.5.16 to 10.6.8

## 2.4.0.22 (forked)

- Use new recorder schema from core 2022.4.0

## 2.4.0.21 (forked)

- Use new recorder schema from core 2022.2.0

## 2.4.0.20 (forked)

- Use new recorder schema for statistics from core 2021.11.0

## 2.4.0.19 (forked)

- Merge unreleased changes from official add-on [#3](https://github.com/lmagyar/homeassistant-addon-mariadb-inmemory/issues/3)
- Use new recorder schema for statistics from core 2021.10.0

## 2.4.0.18 (forked)

- Use new recorder schema for statistics from core 2021.9.0

## 2.4.0.17 (forked)

- Use new recorder schema for statistics from core 2021.7.0

## 2.4.0.16 (forked)

- Merge changes from official add-on

## 2.4.0

- Add lock capabilities during snapshot

## 2.3.0.15 (forked)

- Use new recorder schema for statistics from core 2021.6.0

## 2.3.0.14 (forked)

- Use new recorder schema from core 2021.5.0
- Use new recorder schema from core 2021.4.0
- Merge changes from official add-on

## 2.3.0

- Option to grant user specific privileges for a database

## 2.2.2.13 (forked)

- Use modified recorder schema (without crash safety overhead, TRANSACTIONAL=0)

## 2.2.2.12 (forked)

- Upgrade Alpine Linux to 3.13, MariaDB to 10.5.8
- Use default recorder schema
- Merge changes from official add-on

## 2.2.2

- Update options schema for passwords

## 2.2.1.11 (forked)

- Use new tmpfs location in Supervisor 2021.2.9

## 2.2.1.10 (forked)

- Use new tmpfs add-on config format in Supervisor 2021.2.0

## 2.2.1.9 (forked)

- Use tmpfs for data storage
- Tweak InnoDB to use minimal disk space overhead
- Make the size of the tmpfs filesystem configurable

## 2.2.1

- Don't delete the mariadb.sys user, it's needed in MariaDB >= 10.4.13

## 2.2.0

- Upgrade Alpine Linux to 3.12
- Increase innodb_buffer_pool_size to 128M

## 2.1.2

- Fix S6-Overlay shutdown timeout

## 2.1.0

- Migrate to S6-Overlay
- Use jemalloc for faster database memory management

## 2.0.0

- Pin add-on to Alpine Linux 3.11
- Redirect MariaDB error log to add-on logs
- Remove grant & host options
- Add support for the mysql service
- Use a more secure default on install
- Skip DNS name resolving
- Improve integrity checks and recovery
- Tune MariaDB for lower memory usage
- Close port 3306 by default
- Ensure a proper collation set is used
- Adds database upgrade process during startup
- Change default configuration username from "hass" to "homeassistant"

## 1.3.0

- Update from bash to bashio

## 1.2.0

- Change the way to migrate data

## 1.1.0

- Fix connection issue with 10.3.13

## 1.0.0

- Update MariaDB to 10.3.13
