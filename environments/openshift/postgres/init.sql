CREATE ROLE "bamoedb-user" WITH
    LOGIN
    SUPERUSER
    INHERIT
    CREATEDB
    CREATEROLE
    NOREPLICATION
    PASSWORD 'bamoedb-pass';

CREATE DATABASE bamoedb
    WITH
    OWNER = "bamoedb-user"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE DATABASE keycloak
    WITH
    OWNER = "bamoedb-user"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

GRANT ALL PRIVILEGES ON DATABASE postgres TO "bamoedb-user";

GRANT ALL PRIVILEGES ON DATABASE bamoe TO "bamoedb-user";
GRANT ALL PRIVILEGES ON DATABASE bamoe TO postgres;

GRANT ALL PRIVILEGES ON DATABASE keycloak TO "bamoedb-user";
GRANT ALL PRIVILEGES ON DATABASE keycloak TO postgres;
