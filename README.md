## Deveplopment Environment

Installation assumes using a Mac OS X system and requires Docker Desktop for Mac.

## Installation

To get everything installed, you need to pull the database and content from the server and then you import these into the Docker container.

### Pull Database

```bash
sh scripts/db/pull.sh ~/Desktop
```

### Pull Content

```bash
sh scripts/content/pull.sh ~/Desktop
```

### Site Setup

```bash
sh scripts/setup.sh ~/Desktop
```

## Usage

Once you have completed installation, you should be able to load the site at [http://localhost:8082](http://localhost:8082).

You can login at [http://localhost:8082/wp-admin](http://localhost:8082/wp-admin) using the same username and password that you use at your production site.

To explore the database with phpMyAdmin, you can go to [http://localhost:8083/wp-admin](http://localhost:8083) and login with the database username and password in the `docker-compose.yml` file.
