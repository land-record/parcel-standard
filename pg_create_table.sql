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
    zoningdesc text,

    numbldgs int,
    numunits int,
    yearbuilt int,
    numfloors int,
    bldgsqft int,
    bedrooms int,
    baths text,

    imprvalue bigint,
    landvalue bigint,
    agvalue bigint,
    totalvalue bigint,

    saleamt bigint,
    saledate date,

    ownername text,
    owneraddr text,

    parceladdr text,
    legaldesc text,
    township text,
    section text,
    qtrsection text,
    range text,
    plssdesc text,

    plat text,
    book text,
    page text,
    block text,
    lot text,

    updated date,

    centroidx float,
    centroidy float,
    surfpointx float,
    surfpointy float,

    geom geometry(MultiPolygon, 4326),

    unmapped jsonb
);

create index idx_parcel_geom on landrecord_parcel using gist(geom);
create index idx_geoid on landrecord_parcel (geoid);
