#!/bin/sh

# Ejecución de los módulos necesarios en python para procesar la base de datos 

cd moma

python XXXXX.py create-schemas

# Crear tablas de raw schema
python XXXXX.py create-raw-tables

# leer raw data de raw schema
python XXXXX.py load-XXXXXX

# Pasar la raw data al clean schema
python XXXXX.py to-cleaned

# Pasar cleaned data al semantic schema
python XXXXXXX.py to-semantic

# Crear tables para el cohort schema 
python XXXXX.py create-cohorts

# Crear tables para el labels schema
python XXXXXX.py create-labels

# Crear tables para el features schema
python XXXXXX.py create-features
