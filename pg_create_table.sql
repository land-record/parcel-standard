create table if not exists lr_parcel (
    landrecid uuid primary key,

    parcelid text,
    parcelid2 text,

    geoid text,
    statefp text,
    countyfp text,

    parceltype text,
    acctnum text,
    taxyear int,

    usecode text,
    usedesc text,
    zoningcode text,
    zoningdesc text

    numbldgs int,
    numunits int,
    yearbuilt int,
    numfloors int,
    bldgsqft int,
    bedrooms int,
    baths int,

    imprvalue int,
    landvalue int,
    agvalue int,
    totalvalue int,

    saleamt int,
    saledate date,

    ownertype text,
    ownername text,
    owneraddr text,

    parceladdr text,
    legaldesc text,
    juris text,
    township text,
    sectino text,
    qtrsection text,
    range text,
    plssdesc text,

    platbook text,
    platpage text,
    platblock text,

    srclevel int,
    srcupdate date,

    centroidx float,
    centroidy float,
    surfpointx float,
    surfpointy float,

    geom geometry(MultiPolygon, 4326)
);

create index idx_parcel_geom on landrecord_parcel using gist(geom);
create index idx_geoid on landrecord_parcel (geoid);
