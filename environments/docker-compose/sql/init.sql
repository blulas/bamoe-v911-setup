CREATE ROLE "bamoe-user" WITH
    LOGIN
    SUPERUSER
    INHERIT
    CREATEDB
    CREATEROLE
    NOREPLICATION
    PASSWORD 'bamoe-pass';

GRANT ALL PRIVILEGES ON DATABASE postgres TO "bamoe-user";
GRANT ALL PRIVILEGES ON DATABASE bamoe TO "bamoe-user";
GRANT ALL PRIVILEGES ON DATABASE bamoe TO postgres;

