---
uid: GetDataViewDataRecommendedWorkflow
---

# Recommended workflow: Get data view data
This is an introduction to the recommended workflow to get data from a data view. The following sections show how to carry out each required step.
For detailed information about the source behind each data field, see the [Data API reference](xref:DataViewsDataAPI). For detailed information about the source of each field's data, see the data view's resolved field mappings.

To get data view data:

1. Unless configured in the `DataView` object, you must include in the get data request the startIndex, endIndex, and interval query parameters.
2. Specify the desired response format as csv, table-style json, or object-style json.
3. Specify the page size.

**Note:** If data spans into additional page(s), follow the hyperlinks in each HTTP `Link` header to retrieve the full requested dataset page by page.

## Procedure: Get Data View Data
It is assumed that you are working with streams as described in the [stream examples](xref:DataViewsStreamExamples). The data views API uses the same authentication scheme as the Sequential Data Store.

### Get data using defaults
The default start index, end index, and interval are configured in the `DataView` object. If not null, the get data request must include the startIndex, endIndex, and interval query parameters.

#### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
```

#### Expected result
An array of json values similar to:
```json
[
    {
        "Timestamp.0": "2019-10-21T18:00:00Z",
        "Id.1": "WS_BILT",
        "Name.2": "WS_BILT",
        "AmbientTemperature.3": null,
        "CloudCover.4": null,
        "SolarRadiation.5": 165,
        "Temperature.6": 33.589619124193831,
        "Site.7": "Biltmore",
        "Tags.8": "Weather, High Resolution, Gen1",
        "Id.9": "WS_ROSE",
        "Name.10": "WS_ROSE",
        "AmbientTemperature.11": null,
        "CloudCover.12": null,
        "SolarRadiation.13": 132,
        "Temperature.14": 14.537369185607899,
        "Site.15": "Rosecliff",
        "Tags.16": "Weather, Low Resolution, Gen1",
        "Id.17": "WS_WINT",
        "Name.18": "WS_WINT",
        "AmbientTemperature.19": 1.0805517883941373,
        "CloudCover.20": 2,
        "SolarRadiation.21": 108,
        "Temperature.22": null,
        "Site.23": "Winterthur",
        "Tags": "Weather, High Resolution, Gen2",
    },
    ...
```

### Get data for a custom range

#### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}
```

#### Expected result
An array of json values similar to:
```json
[
    {
        "Timestamp.0": "2019-10-21T18:00:00Z",
        "Id.1": "WS_BILT",
        "Name.2": "WS_BILT",
        "AmbientTemperature.3": null,
        "CloudCover.4": null,
        "SolarRadiation.5": 165,
        "Temperature.6": 33.589619124193831,
        "Site.7": "Biltmore",
        "Tags.8": "Weather, High Resolution, Gen1",
        "Id.9": "WS_ROSE",
        "Name.10": "WS_ROSE",
        "AmbientTemperature.11": null,
        "CloudCover.12": null,
        "SolarRadiation.13": 132,
        "Temperature.14": 14.537369185607899,
        "Site.15": "Rosecliff",
        "Tags.16": "Weather, Low Resolution, Gen1",
        "Id.17": "WS_WINT",
        "Name.18": "WS_WINT",
        "AmbientTemperature.19": 1.0805517883941373,
        "CloudCover.20": 2,
        "SolarRadiation.21": 108,
        "Temperature.22": null,
        "Site.23": "Winterthur",
        "Tags.24": "Weather, High Resolution, Gen2"
    },
    ...
```

### Get data in a different format
By default, data is returned in object-style json. Other formats are available: csv and table-style json, each with an optional header row.

#### Action
Resubmit the data query with an additional query parameter, `&form=csvh` for csv-formatted data with a header row.
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}&form=csvh
```

#### Expected result
Rows of CSV values similar to:

```csv
Timestamp.0,Id.1,Name.2,AmbientTemperature.3,CloudCover.4,SolarRadiation.5,Temperature.6,Site.7,Tags.8,Id.9,Name.10,AmbientTemperature.11,CloudCover.12,SolarRadiation.13,Temperature.14,Site.15,Tags.16,Id.17,Name.18,AmbientTemperature.19,CloudCover.20,SolarRadiation.21,Temperature.22,Site.23,Tags.24
2019-10-21T18:00:00.0000000Z,WS_BILT,WS_BILT,,,165,33.58961912,Biltmore,"Weather, High Resolution, Gen1",WS_ROSE,WS_ROSE,,,132,14.53736919,Rosecliff,"Weather, Low Resolution, Gen1",WS_WINT,WS_WINT,1.080551788,2,108,,Winterthur,"Weather, High Resolution, Gen2"
2019-10-21T20:00:00.0000000Z,WS_BILT,WS_BILT,,,157,32.41209639,Biltmore,"Weather, High Resolution, Gen1",WS_ROSE,WS_ROSE,,,139,14.76498991,Rosecliff,"Weather, Low Resolution, Gen1",WS_WINT,WS_WINT,2.501105722,3,109,,Winterthur,"Weather, High Resolution, Gen2"
...
```

### Get subsequent pages
By default, each page includes 1000 records. If the requested data spans into another page, the response includes a hyperlink to the next page of data.

#### Action
Use the "next" hyperlink from the Link header to request the next page.

```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}&form=csvh&continuationToken=MjAxOC0wMS0wMVQwMDowMDoxMVo_MD90Yk1OblE_QUxXcEZBP1VEdGxIMWJROG9z
```

#### Expected result
The next page of data:

```csv
Timestamp.0,Id.1,Name.2,AmbientTemperature.3,CloudCover.4,SolarRadiation.5,Temperature.6,Site.7,Tags.8,Id.9,Name.10,AmbientTemperature.11,CloudCover.12,SolarRadiation.13,Temperature.14,Site.15,Tags.16,Id.17,Name.18,AmbientTemperature.19,CloudCover.20,SolarRadiation.21,Temperature.22,Site.23,Tags.24
2019-10-21T22:00:00.0000000Z,WS_BILT,WS_BILT,,,165,33.58961912,Biltmore,"Weather, High Resolution, Gen1",WS_ROSE,WS_ROSE,,,132,14.53736919,Rosecliff,"Weather, Low Resolution, Gen1",WS_WINT,WS_WINT,1.080551788,2,108,,Winterthur,"Weather, High Resolution, Gen2"
2019-10-22T00:00:00.0000000Z,WS_BILT,WS_BILT,,,157,32.41209639,Biltmore,"Weather, High Resolution, Gen1",WS_ROSE,WS_ROSE,,,139,14.76498991,Rosecliff,"Weather, Low Resolution, Gen1",WS_WINT,WS_WINT,2.501105722,3,109,,Winterthur,"Weather, High Resolution, Gen2"
...
```

### Recover from an invalid paging session
It is possible, though unlikely, for the continuation token to become invalid during paging. When this happens, paging must be restarted from the first page.

#### Action
Use the "first" hyperlink from the Link header to request the first page.

```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}&form=csvh&cache=preserve
```

#### Expected result
The first page of data:

```csv
Timestamp.0,Id.1,Name.2,AmbientTemperature.3,CloudCover.4,SolarRadiation.5,Temperature.6,Site.7,Tags.8,Id.9,Name.10,AmbientTemperature.11,CloudCover.12,SolarRadiation.13,Temperature.14,Site.15,Tags.16,Id.17,Name.18,AmbientTemperature.19,CloudCover.20,SolarRadiation.21,Temperature.22,Site.23,Tags.24
2019-10-21T18:00:00.0000000Z,WS_BILT,WS_BILT,,,165,33.58961912,Biltmore,"Weather, High Resolution, Gen1",WS_ROSE,WS_ROSE,,,132,14.53736919,Rosecliff,"Weather, Low Resolution, Gen1",WS_WINT,WS_WINT,1.080551788,2,108,,Winterthur,"Weather, High Resolution, Gen2"
2019-10-21T20:00:00.0000000Z,WS_BILT,WS_BILT,,,157,32.41209639,Biltmore,"Weather, High Resolution, Gen1",WS_ROSE,WS_ROSE,,,139,14.76498991,Rosecliff,"Weather, Low Resolution, Gen1",WS_WINT,WS_WINT,2.501105722,3,109,,Winterthur,"Weather, High Resolution, Gen2"
...
```

### Explore what each data field maps to

#### Action

```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Resolved/FieldMappings
```

#### Expected result
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
           "DataMappings":  [
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
           "DataMappings":  [
                {
                   "TargetId": "WS_BILT",
                   "TargetFieldKey": "WS_BILT",
                   "TypeCode": "String",
                   "FieldSetIndex": 0,
                   "FieldIndex": 0,
                }
             ]
          },
      ...
    ]
}
```

