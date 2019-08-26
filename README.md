
Parcel Standard Schema v1.0.0
=============================


This repository contains tools and documents to help you get the most of your [Land Record](http://www.landrecord.us) parcel dataset.
# Technical Notes


An individual county or state can easily be stored and analyzed in a traditional OLTP database such as PostgreSQL (with the PostGIS extension). For a multi-state or national parcel datastore, we strongly recommend utilizing a scalable cloud-based datastore such as BigQuery. For convenience, this repository includes a BigQuery JSON schema file.
# Schema Definition

|Column|Type|Constraints|Description|
| :--- | :--- | :--- | :--- |
|landrecid|STRING|REQUIRED|Universally unique ID (UUID) assigned to each parcel assigned by the Land Record database.|
|parcelid|STRING|NULLABLE|Parcel id assigned by the local administrative authority. AKA parcel number, APN, and PIN. The format will vary.|
|geoid|STRING|REQUIRED|The full FIPS code of the jurisdiction in which the parcel resides (state fips + county fips).|
|statefp|STRING|REQUIRED|State FIPS code|
|countyfp|STRING|REQUIRED|County FIPS code|
|acctnum|STRING|NULLABLE|The local tax account number associated with this parcel|
|usecode|STRING|NULLABLE|Land use code. These will vary across jurisdiction. These will vary in format between locales.|
|usedesc|STRING|NULLABLE|Description of the land use associated with this parcel|
|zoningcode|STRING|NULLABLE|Zoning code associated with this parcel. These will vary in format.|
|zoningdesc|STRING|NULLABLE|Zoning description associated with this parcel. These will vary in format and length.|
|numbldgs|STRING|NULLABLE|Number of buildings located on the parcel. This includes primary residence as well as any accessory dwellings, garages, sheds, etc.|
|yearbuilt|STRING|NULLABLE|The recorded year that the primary building was constructed|
|numfloors|STRING|NULLABLE|Number of stories/floors/levels in the primary building according to the local authorities|
|bldgsqft|STRING|NULLABLE|Assessed area in square feet of the primary building|
|imprvalue|INT64|NULLABLE|Assessed value of improvements; typically this is the value of any and all buildings located on the parcel|
|landvalue|INT64|NULLABLE|Assessed value of the surface land only. Does not include value of buildings, agriculture, or subsurface minerals or water|
|agvalue|IN64|NULLABLE|Assessed value of any agricutlure or agriculture rights|
|totalvalue|INT64|NULLABLE|Total assessed value, i.e. landvalue + imprvalue + agvalue|
|saleamt|INT64|NULLABLE|Transaction amount of the most recent recorded sale that this parcel was a part of. Usually the parcel comprises the entire sale, but occasionally the sale amount can include other parcels.|
|ownertype|STRING|NULLABLE|Type of owner; e.g. individual, business, government|
|ownername|STRING|NULLABLE|Name of the recorded owner|
|owneraddr|STRING|NULLABLE|Mailing address of the recorded owner, if known|
|parceladdr|STRING|NULLABLE|Mailing address of the parcel|
|legaldesc|STRING|NULLABLE|Legal description of the parcel; this is usually described in terms of lot numbers, plat numbers, book numbers, etc.|
|srclevel|INT64|REQUIRED|Level of detail from which the parcel data was acquired. 1=county, 2=state, 3+ are from nongovernment overlay sources, or an aggregation of multiple sources to form a complete record.|
|srcupdate|DATE|REQUIRED|Date of last known update of the source data. If not specified or unknown, this field represents the date of most recent acquisition of source data|
|centroidx|GEOGRAPHY|NUMERIC|x-coordinate (longitude) of geographic center POINT of the parcel in EPSG 4326. In rare cases the center may lie outside the parcel shape itself in the case of a 'C'shaped parcel|
|centroidy|NUMERIC|REQUIRED|y-coordinate (latitude) of geographic center POINT of the parcel in EPSG 4326. In rare cases the center may lie outside the parcel shape itself in the case of a 'C'shaped parcel|
|surfpointx|NUMERIC|REQUIRED|x-coordinate (longitude) of centermost POINT that is guaranteed to lie within the parcel's surface in EPSG 4326. This point will never lie outside the parcel. Calculated using ST_PointOnSurface|
|surfpointy|NUMERIC|REQUIRED|y-coordinate of centermost POINT that is guaranteed to lie within the parcel's surface in EPSG 4326. This point will never lie outside the parcel. Calculated using ST_PointOnSurface|
|geom|GEOGRAPHY|REQUIRED|MULTIPOLYGON of the parcel lot lines in EPSG 4326|

# Versioning


This standard uses semantic versioning; as such, no breaking changes will occur within major version releases. In other words, all 1.x.x releases will be backward-compatible with all other 1.x.x releases.