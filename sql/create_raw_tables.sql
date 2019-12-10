drop table if exists raw.hmlr_prices;

--Create a table to load the data into
CREATE TABLE raw.hmlr_prices
(
    uid TEXT,
    price TEXT,
    date_of_transfer TEXT,
    postcode TEXT,
    propert_type TEXT,
    old_new TEXT,
    duration TEXT,
    paon TEXT,
    saon TEXT,
    street TEXT,
    locality TEXT,
    town_city TEXT,
    district TEXT,
    county TEXT,
    ppd_category TEXT,
	record_status TEXT
);

comment on table raw.hmlr_prices is 'Base de datos que contiene las transacciones de compraventa de las viviendas en Reino Unido';
