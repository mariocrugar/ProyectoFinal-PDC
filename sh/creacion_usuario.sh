#!/bin/sh

# Template para la cración del usuario y la BD

# Creación del usuario "XXXX" en postgres y la base de datos "VVVVV".

# Creación del usuario "XXXX" con permisos para crear bases de datos.
# password: WWWWW
sudo -i -u postgres psql -c "CREATE USER XXXX WITH PASSWORD 'WWWWW' NOCREATEDB;"


# Creación de la base de datos VVVVV asignada al usuario XXXX. 
sudo -i -u postgres psql -c "CREATE DATABASE VVVVV OWNER XXXX ENCODING 'UTF-8' LC_CTYPE 'en_US.UTF-8' LC_COLLATE 'en_US.UTF-8' TEMPLATE template0;"
