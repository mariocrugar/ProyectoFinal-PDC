create table cleaned.hmlr_prices
as (
select
    btrim(uid) as uid,
    price::decimal,
    substring(date_of_transfer,1,10)::date as date_of_transfer,
    btrim(postcode) as postcode,
    btrim(propert_type) as propert_type,
    btrim(old_new) as old_new,
    case when duration = 'F' then 'freehold' 
    	 when duration = 'L' then 'leasehold' else '?' end as duration,
    paon,
    saon,
    lower(btrim(street)) as street,
    lower(btrim(locality)) as locality,
    lower(btrim(town_city)) as town_city,
    lower(btrim(district)) as district,
    lower(btrim(county)) as county,
    ppd_category,
	record_status
	from raw.hmlr_prices
	where uid is not null
	and
	case when duration = 'F' then 'freehold' 
    	 when duration = 'L' then 'leashold' else '?' end <> '?');
