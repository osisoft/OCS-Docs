---
uid: DataViewsQuickStartGetData
---

# Quick Start - Get Data View Data

This quick start is a hands-on tour of the main concepts behind consuming data view data.

It is assumed that you are working with streams as described in the [Example Scenario](xref:DataViewsExampleScenario). The data views API uses the same authentication scheme as the Sequential Data Store.


## Get data using defaults

### Action
```text
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
```

### Expected result
An array of json values similar to:
```json
[
    {
        "Timestamp.0": "2019-10-21T18:00:00Z",
        "Id.1": "WS_WINT",
        "Name.2": "WS_WINT",
        "Tags.3": "Weather, High Resolution, Gen2",
        "Site.4": "Winterthur",
        "SolarRadiation.5": 108,
        "AmbientTemperature.6": 1.0805517883941373,
        "CloudCover.7": 2,
        "Temperature.8": null,
        "Id.9": "WS_ROSE",
        "Name.10": "WS_ROSE",
        "Tags.11": "Weather, Low Resolution, Gen1",
        "Site.12": "Rosecliff",
        "SolarRadiation.13": 132,
        "AmbientTemperature.14": null,
        "CloudCover.15": null,
        "Temperature.16": 14.537369185607899,
        "Id.17": "WS_BILT",
        "Name.18": "WS_BILT",
        "Tags.19": "Weather, High Resolution, Gen1",
        "Site.20": "Biltmore",
        "SolarRadiation.21": 165,
        "AmbientTemperature.22": null,
        "CloudCover.23": null,
        "Temperature.24": 33.589619124193831,
    },
    ...
```

## Get data for a custom range

### Action
```text
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}
```

### Expected result
An array of json values similar to:
```json
[
    {
        "Timestamp.0": "2019-10-21T18:00:00Z",
        "Id.1": "WS_WINT",
        "Name.2": "WS_WINT",
        "Tags.3": "Weather, High Resolution, Gen2",
        "Site.4": "Winterthur",
        "SolarRadiation.5": 108,
        "AmbientTemperature.6": 1.0805517883941373,
        "CloudCover.7": 2,
        "Temperature.8": null,
        "Id.9": "WS_ROSE",
        "Name.10": "WS_ROSE",
        "Tags.11": "Weather, Low Resolution, Gen1",
        "Site.12": "Rosecliff",
        "SolarRadiation.13": 132,
        "AmbientTemperature.14": null,
        "CloudCover.15": null,
        "Temperature.16": 14.537369185607899,
        "Id.17": "WS_BILT",
        "Name.18": "WS_BILT",
        "Tags.19": "Weather, High Resolution, Gen1",
        "Site.20": "Biltmore",
        "SolarRadiation.21": 165,
        "AmbientTemperature.22": null,
        "CloudCover.23": null,
        "Temperature.24": 33.589619124193831,
    },
    ...
```

## Get data in a different format
By default, data is returned in object-style json. Other formats are available: csv and table-style json, each with an optional header row.

### Action
Resubmit the data query with an additional query parameter, `&form=csvh` for csv-formatted data with a header row.
```text
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}&form=csvh
```

### Expected result
Rows of CSV values similar to:

```csv
Timestamp.0,Id.1,Name.2,Tags.3,Site.4,SolarRadiation.5,AmbientTemperature.6,CloudCover.7,Temperature.8,Id.9,Name.10,Tags.11,Site.12,SolarRadiation.13,AmbientTemperature.14,CloudCover.15,Temperature.16,Id.17,Name.18,Tags.19,Site.20,SolarRadiation.21,AmbientTemperature.22,CloudCover.23,Temperature.24
2019-10-21T18:00:00.0000000Z,WS_WINT,WS_WINT,"Weather, High Resolution, Gen2",Winterthur,108,1.080551788,2,,WS_ROSE,WS_ROSE,"Weather, Low Resolution, Gen1",Rosecliff,132,,,14.53736919,WS_BILT,WS_BILT,"Weather, High Resolution, Gen1",Biltmore,165,,,33.58961912
2019-10-21T20:00:00.0000000Z,WS_WINT,WS_WINT,"Weather, High Resolution, Gen2",Winterthur,109,2.501105722,3,,WS_ROSE,WS_ROSE,"Weather, Low Resolution, Gen1",Rosecliff,139,,,14.76498991,WS_BILT,WS_BILT,"Weather, High Resolution, Gen1",Biltmore,157,,,32.41209639
...
```

## Get subsequent pages
By default, each page includes 1000 records. If the requested data spans into another page, the response includes a hyperlink to the next page of data.

### Action
Use the hyperlink in the NextPage header to request the next page.
```text
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}&form=csvh&continuationToken=MjAxOC0wMS0wMVQwMDowMDoxMVo_MD90Yk1OblE_QUxXcEZBP1VEdGxIMWJROG9z&cache=preserve
```

### Expected result
The next page of data:

```csv
Timestamp.0,Id.1,Name.2,Tags.3,Site.4,SolarRadiation.5,AmbientTemperature.6,CloudCover.7,Temperature.8,Id.9,Name.10,Tags.11,Site.12,SolarRadiation.13,AmbientTemperature.14,CloudCover.15,Temperature.16,Id.17,Name.18,Tags.19,Site.20,SolarRadiation.21,AmbientTemperature.22,CloudCover.23,Temperature.24
2019-10-21T22:00:00.0000000Z,WS_WINT,WS_WINT,"Weather, High Resolution, Gen2",Winterthur,108,1.080551788,2,,WS_ROSE,WS_ROSE,"Weather, Low Resolution, Gen1",Rosecliff,132,,,14.53736919,WS_BILT,WS_BILT,"Weather, High Resolution, Gen1",Biltmore,165,,,33.58961912
2019-10-22T00:00:00.0000000Z,WS_WINT,WS_WINT,"Weather, High Resolution, Gen2",Winterthur,109,2.501105722,3,,WS_ROSE,WS_ROSE,"Weather, Low Resolution, Gen1",Rosecliff,139,,,14.76498991,WS_BILT,WS_BILT,"Weather, High Resolution, Gen1",Biltmore,157,,,32.41209639
...
```

## Recover from an invalid paging session
It is possible, though unlikely, for the continuation token to become invalid during paging. When this happens, paging must be restarted from the first page.

### Action
Use the hyperlink in the FirstPage header to request the first page.

```text
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}&form=csvh&cache=preserve
```

### Expected result
The first page of data:

```csv
Timestamp.0,Id.1,Name.2,Tags.3,Site.4,SolarRadiation.5,AmbientTemperature.6,CloudCover.7,Temperature.8,Id.9,Name.10,Tags.11,Site.12,SolarRadiation.13,AmbientTemperature.14,CloudCover.15,Temperature.16,Id.17,Name.18,Tags.19,Site.20,SolarRadiation.21,AmbientTemperature.22,CloudCover.23,Temperature.24
2019-10-21T18:00:00.0000000Z,WS_WINT,WS_WINT,"Weather, High Resolution, Gen2",Winterthur,108,1.080551788,2,,WS_ROSE,WS_ROSE,"Weather, Low Resolution, Gen1",Rosecliff,132,,,14.53736919,WS_BILT,WS_BILT,"Weather, High Resolution, Gen1",Biltmore,165,,,33.58961912
2019-10-21T20:00:00.0000000Z,WS_WINT,WS_WINT,"Weather, High Resolution, Gen2",Winterthur,109,2.501105722,3,,WS_ROSE,WS_ROSE,"Weather, Low Resolution, Gen1",Rosecliff,139,,,14.76498991,WS_BILT,WS_BILT,"Weather, High Resolution, Gen1",Biltmore,157,,,32.41209639
...
```


## Explore what each data field maps to

### Action

```text
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Resolved/FieldMappings
```

### Expected result
An array of field mappings:

```json
{
    "TimeOfResolution": "(a timestamp in ISO8601 format)",
    "Items": [
        {
            "Id": "Timestamp.0",
            "Label": "Timestamp",
            "FieldKind": "IndexField",
            "TypeCode": "DateTime",
            "DataMappings": [
                {
                    "TypeCode": "DateTime"
                }
            ]
        },
        {
            "Id": "Id.1",
            "Label": "Id",
            "FieldKind": "DataField",
            "TypeCode": "String",
            "DataMappings": [
                {
                    "TargetId": "WS_BILT",
                    "TargetFieldKey": "WS_BILT",
                    "TypeCode": "String",
                    "FieldSetIndex": 0,
                    "FieldIndex": 0
                }
            ]
        },
      ...
    ]
}
```
