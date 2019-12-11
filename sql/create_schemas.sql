CREATE EXTENSION IF NOT EXISTS dblink;

DO $$
BEGIN
PERFORM dblink_exec('', 'CREATE DATABASE realsuk WITH OWNER "postgres" ENCODING "UTF8"');
EXCEPTION WHEN duplicate_database THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END
$$;

drop schema if exists raw cascade;
create schema raw;

drop schema if exists cleaned cascade;
create schema cleaned;

drop schema if exists semantic cascade;
create schema semantic;

