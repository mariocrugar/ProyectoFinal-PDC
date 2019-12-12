create table if not exists semantic.entities as (
    select distinct
      uid,
      postcode,
      propert_type,
      old_new,
      street,
      locality,
      town_city,
      district,
      county
      from
          cleaned.hmlr_prices
  );  
 
 
 create table if not exists semantic.events as (
    select distinct
      uid,
      price,
      date_of_transfer,
      postcode,
      duration,
      ppd_category,
	  record_status
      from
          cleaned.hmlr_prices
  );  

create index semantic_entities_property on semantic.entities(uid);
create index semantic_entities_transaction on semantic.events(uid);  
