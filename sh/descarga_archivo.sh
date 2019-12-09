#!/bin/sh

# Este shel descarga la base de datos de la venta de las casas para el primer periodo del 2019.
# Es un documento de tipo .CSV con un peso de 12.6MB

# El archivo se llama pp-2019-part1.csv
wget http://prod.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-2019-part1.csv > pp-2019-part1.csv
