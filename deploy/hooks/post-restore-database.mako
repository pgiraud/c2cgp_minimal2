#!/bin/sh -e
#
# variables set here:
#   $TARGET: name of the symbolic remote host key (see remote_hosts
#            section in config file)
#

DATABASES=$@

## Uncomment the following lines if you want to vacuum the databases after the
## restore. In most cases this is not needed because we are working with
## read-only databases.

# for b in $DATABASES
# do
#   psql -c "VACUUM ANALYZE;" $b
# done

# The following line works only with Postgres 9.3 and upper.
# otherwise the schema should be create manually
# psql -c 'CREATE SCHEMA IF NOT EXISTS ${schema}_static;' ${db}

# The workaround is to ignore the error
psql -c 'CREATE SCHEMA ${schema}_static;' ${db} 2> /dev/null || true

psql -c 'CREATE TABLE IF NOT EXISTS ${schema}_static.shorturl (
    id serial PRIMARY KEY,
    url character varying(1000),
    ref character varying(20) NOT NULL UNIQUE,
    creator_email character varying(200),
    creation timestamp without time zone,
    last_hit timestamp without time zone,
    nb_hits integer
);' ${db}

psql -c 'GRANT USAGE ON SCHEMA "${schema}_static" TO "${dbuser}";' ${db}
psql -c 'GRANT SELECT ON ALL TABLES IN SCHEMA "${schema}_static" TO "${dbuser}";' ${db}

.build/venv/bin/alembic -c alembic_static.ini upgrade head
