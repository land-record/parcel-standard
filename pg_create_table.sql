create table if not exists landrecord_parcel (
  landrecid uuid primary key,

  parcelid text,
  geoid text,

  statefp text,
  countyfp text,

  acctnum text,

  usecode text,
  usedesc text,
  zoningcode text,

  numbldgs int,
  yearbuilt int,
  numfloors int,
  bldgsqft int,

  imprvalue int,
  landvalue int,
  agvalue int,
  totalvalue int,
  saleamt int,

  ownertype text,
  ownername text,
  owneraddr text,

  parceladdr text,
  legaldesc text,

  srclevel int,
  srcupdate date,

  centroidx float,
  centroidy float,
  surfpointx float,
  surfpointy float,

  geom geometry(MultiPolygon, 4326)
);

create index idx_parcel_centroid on landrecord_parcel using gist(centroid);
create index idx_parcel_pt on landrecord_parcel using gist(surfpoint);
create index idx_parcel_geom on landrecord_parcel using gist(geom);
