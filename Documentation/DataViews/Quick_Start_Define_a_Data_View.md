---
uid: DataViewsQuickStartDefine
---

# Quick Start - Define a Data View

This quick start is a hands-on tour of the main concepts behind creating data views.

It is assumed that you are working with streams as described in the [Example Scenario](xref:DataViewsExampleScenario). The data views API uses the same authentication scheme as the Sequential Data Store.


## Create a data view

Creating a data view requires only an identifier, `.Id`. The data view does not accomplish anything yet, but it's a starting point.

### Action
```json
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{ 
  "Id": "quickstart" 
}
```

### Expected result
A data view with very few properties populated: `.Id`, `.Name`, `IndexField` (default: { "Label": "Timestamp" }), `.IndexTypeCode` (default: `"DateTime"`), Shape (default: `DataViewShape.Standard`, which as a string is `"Standard"`).
```json
HTTP 201 Created
{
  "Id": "quickstart",
  "Name": "quickstart",
  "Description": null,
  "Queries": [],
  "DataFieldSets": [],
  "GroupingFields": [],
  "Shape": "Standard",
  "IndexField": { "Label": "Timestamp" },
  "IndexTypeCode": "DateTime"
}
```

The `.Queries` property is empty, `[ ]`. We will address that soon. 

## Retrieve the data view

To access the data view again, it is available via the `GET` verb:

### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
```

### Expected result
```json
HTTP 200 OK
{
  "Id": "quickstart",
  "Name": "quickstart",
  "Description": null,
  "Queries": [],
  "DataFieldSets": [],
  "GroupingFields": [],
  "Shape": "Standard",
  "IndexField": { "Label": "Timestamp" },
  "IndexTypeCode": "DateTime"
}
```

## Add a query for data items

Creating a data view begins with including some data items: today, those are SDS Streams.

### Action
Use the result of the previous step as the starting point. All following steps will involve modifying the data view definition, or seeing the effects of those modifications.

Add an item to the array of `.Queries`: `{ "Id": "weather", "Value":"*weather*" }`
```json
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{
  "Id": "quickstart",
  "Name": "quickstart",
  "Description": null,
  "Queries": [
    { 
      "Id": "weather",
      "Value":"*weather*" 
    }
  ],
  "DataFieldSets": [],
  "GroupingFields": [],
  "Shape": "Standard",
  "IndexField": { "Label": "Timestamp" },
  "IndexTypeCode": "DateTime"
}
```

### Expected result
```text
HTTP 204 No Content
```

## View items found by the query

Data views resolve on a per user basis, executing the queries you defined. The results are available in several “resolved” resources.

### Action – Page through the data items found by the query
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Resolved/DataItems/weather
```

### Expected result
An array of the data items matching the query, whose index type is "DateTime" (matching the Data View’s IndexTypeCode)

```json
HTTP 200 OK
{
    "TimeOfResolution": "(a timestamp in ISO8601 format)",
    "Items": [
        {
            "ResourceType": "Stream",
            "Id": "WS_WINT",
            "Name": "WS_WINT",
            "TypeId": "quickstart-omf-weather-gen2",
            "Tags": [
                "Weather",
                "High Resolution",
                "Gen2"
            ],
            "Metadata": {
                "Site": "Winterthur"
            },
            "DataItemFields": [
                {
                    "Id": "Timestamp",
                    "Name": "Timestamp",
                    "TypeCode": "DateTime",
                    "IsKey": true
                },
                {
                    "Id": "SolarRadiation",
                    "Name": "SolarRadiation",
                    "TypeCode": "Int32",
                    "IsKey": false
                },
                {
                    "Id": "AmbientTemperature",
                    "Name": "AmbientTemperature",
                    "TypeCode": "Double",
                    "IsKey": false
                },
                {
                    "Id": "CloudCover",
                    "Name": "CloudCover",
                    "TypeCode": "Int32",
                    "IsKey": false
                }
            ]
        },
        {
            "ResourceType": "Stream",
            "Id": "WS_ROSE",
            "Name": "WS_ROSE",
            "TypeId": "quickstart-omf-weather-gen1",
            "Tags": [
                "Weather",
                "Low Resolution",
                "Gen1"
            ],
            "Metadata": {
                "Site": "Rosecliff"
            },
            "DataItemFields": [
                {
                    "Id": "Timestamp",
                    "Name": "Timestamp",
                    "TypeCode": "DateTime",
                    "IsKey": true
                },
                {
                    "Id": "SolarRadiation",
                    "Name": "SolarRadiation",
                    "TypeCode": "Int32",
                    "IsKey": false
                },
                {
                    "Id": "Temperature",
                    "Name": "Temperature",
                    "TypeCode": "Double",
                    "IsKey": false
                }
            ]
        },
        {
            "ResourceType": "Stream",
            "Id": "WS_BILT",
            "Name": "WS_BILT",
            "TypeId": "quickstart-omf-weather-gen1",
            "Tags": [
                "Weather",
                "High Resolution",
                "Gen1"
            ],
            "Metadata": {
                "Site": "Biltmore"
            },
            "DataItemFields": [
                {
                    "Id": "Timestamp",
                    "Name": "Timestamp",
                    "TypeCode": "DateTime",
                    "IsKey": true
                },
                {
                    "Id": "SolarRadiation",
                    "Name": "SolarRadiation",
                    "TypeCode": "Int32",
                    "IsKey": false
                },
                {
                    "Id": "Temperature",
                    "Name": "Temperature",
                    "TypeCode": "Double",
                    "IsKey": false
                }
            ]
        }
    ]
}
```

### Action – Page through the ineligible data items found by the query
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Resolved/IneligibleDataItems/weather
```

### Expected result
An array of the data items matching the query, but whose index type is not "DateTime" and thus not eligible for inclusion in the data view.

With the example streams, this collection is empty.
```json
HTTP 200 OK
{
  "TimeOfResolution": "(a timestamp in ISO 8601 format)",
  "Items": []
}
```

## View fields available to include in the data view

### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Resolved/AvailableFieldSets
```

### Expected result
A field set with a source type of "DataItem" pointing to the query identified by "weather". Assuming some data items were retrieved, this field set shows that attributes of the streams (id, name, tags) are available, as well as the values of all metadata keys and properties.

```json
HTTP 200 OK
{
    "TimeOfResolution": "(a timestamp in ISO 8601 format)",
    "Items": [
        {
            "SourceType": "DataItem",
            "QueryId": "weather",
            "DataFields": [
                {
                    "Source": "Id",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Id"
                },
                {
                    "Source": "Name",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Name"
                },
                {
                    "Source": "Tags",
                    "Keys": [
                        "Weather",
                        "Low Resolution",
                        "High Resolution",
                        "Gen1",
                        "Gen2",
                    ],
                    "Label": "{IdentifyingValue} Tags"
                },
                {
                    "Source": "Metadata",
                    "Keys": [
                        "Site"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Timestamp"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                }
            ]
        }
    ]
}
```

## Include some of the available fields
At this point, if you query for data, the table only contains the `IndexField` – because no fields have been included in the data view. Including fields is a deliberate action, albeit one that is intended to be easy.

### Action
For ease, grab all of the field sets that are available. 

Set the data view’s `DataFieldSets` property as the contents of the `AvailableFieldSets` response.
```json
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{
  "Id": "quickstart",
  "Name": "quickstart",
  "Description": null,
  "Queries": [
    { 
      "Id": "weather",
      "Value":"*weather*" 
    }
  ],
  "DataFieldSets": [
        {
            "SourceType": "DataItem",
            "QueryId": "weather",
            "DataFields": [
                {
                    "Source": "Id",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Id"
                },
                {
                    "Source": "Name",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Name"
                },
                {
                    "Source": "Tags",
                    "Keys": [
                        "Weather",
                        "Low Resolution",
                        "High Resolution",
                        "Gen1",
                        "Gen2",
                    ],
                    "Label": "{IdentifyingValue} Tags"
                },
                {
                    "Source": "Metadata",
                    "Keys": [
                        "Site"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                }
            ],
       },
  ],
  "GroupingFields": [],
  "Shape": "Standard",
  "IndexField": { "Label": "Timestamp" },
  "IndexTypeCode": "DateTime"
}
```
### Expected Result
```text
HTTP 204 No Content
```

Now, if we return to the available field sets, all data fields are used so none are available.

### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Resolved/AvailableFieldSets
```

### Expected result
No available data fields.
```json
{
    "TimeOfResolution": "(a timestamp in ISO 8601 format)",
    "Items": []
}
```

### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
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

There was ambiguity in the field mapping identifiers, so the data views engine suffixed each field mapping id ordinally.

The suffixing (to ensure uniqueness) is done for the sake of client behavior, as it is not expected that ambiguity is an acceptable outcome. The remaining steps show two approaches for disambiguating the content of a data view. 

### Action – Want csv?
Resubmit the data query with an additional query parameter, `&form=csvh`
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}&form=csvh
```

### Expected result
Rows of CSV values similar to:
```csv
Timestamp.0,Id.1,Name.2,Tags.3,Site.4,SolarRadiation.5,AmbientTemperature.6,CloudCover.7,Temperature.8,Id.9,Name.10,Tags.11,Site.12,SolarRadiation.13,AmbientTemperature.14,CloudCover.15,Temperature.16,Id.17,Name.18,Tags.19,Site.20,SolarRadiation.21,AmbientTemperature.22,CloudCover.23,Temperature.24
2019-10-21T18:00:00.0000000Z,WS_WINT,WS_WINT,"Weather, High Resolution, Gen2",Winterthur,108,1.080551788,2,,WS_ROSE,WS_ROSE,"Weather, Low Resolution, Gen1",Rosecliff,132,,,14.53736919,WS_BILT,WS_BILT,"Weather, High Resolution, Gen1",Biltmore,165,,,33.58961912
2019-10-21T20:00:00.0000000Z,WS_WINT,WS_WINT,"Weather, High Resolution, Gen2",Winterthur,109,2.501105722,3,,WS_ROSE,WS_ROSE,"Weather, Low Resolution, Gen1",Rosecliff,139,,,14.76498991,WS_BILT,WS_BILT,"Weather, High Resolution, Gen1",Biltmore,157,,,32.41209639
```

## Group the data view
One way to disambiguate the data items is to “group” them, which amounts to partitioning them based on a value. For example, metadata:Site as the grouping field might yield groups of Biltmore, Rosecliff, and Winterthur, each containing the data items associated with that Site.

You may use multiple grouping fields. This is effectively “group by X then Y then Z”

Grouping fields are a property of the data view, and are an array of `Field` objects. This means the same Field objects contained in the available or included field sets may be reused directly as grouping fields.

### Action
Grouping by metadata is likely to be most satisfying, but here, start with grouping by data item id. In the `DataView` object, copy the field with `{ Source: “Metadata”, Keys: [ "Site" ] }`, and add it to the array of `.GroupingFields`.
```json
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{
  "Id": "quickstart",
  "Name": "quickstart",
  "Description": null,
  "Queries": [
    { 
      "Id": "weather",
      "Value":"*weather*" 
    }
  ],
  "DataFieldSets": [
        {
            "SourceType": "DataItem",
            "QueryId": "weather",
            "DataFields": [
                {
                    "Source": "Id",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Id"
                },
                {
                    "Source": "Name",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Name"
                },
                {
                    "Source": "Tags",
                    "Keys": [
                        "Weather",
                        "Low Resolution",
                        "High Resolution",
                        "Gen1",
                        "Gen2",
                    ],
                    "Label": "{IdentifyingValue} Tags"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                }
            ],
       },
  ],
  "GroupingFields": [
    {
      "Source": "Metadata",
      "Keys": [
        "Site" 
      ],
      "Label": "{IdentifyingValue} {FirstKey}"
    }
  ],
  "Shape": "Standard",
  "IndexField": { "Label": "Timestamp" },
  "IndexTypeCode": "DateTime"
}
```

### Expected result
```text
HTTP 204 No Content
```

### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}
```

### Expected result
Data that looks a bit different now. In table terms, the data table would be ultra-skinny instead of ultra-wide.

```json
HTTP 200 OK
[
    {
        "Timestamp": "2019-10-21T18:00:00Z",
        "Id": "WS_BILT",
        "Name": "WS_BILT",
        "Tags": "Weather, High Resolution, Gen1",
        "Site": "Biltmore",
        "SolarRadiation": 165,
        "AmbientTemperature": null,
        "CloudCover": null,
        "Temperature": 33.589619124193831
    },
    ... 
    (rest of the values for Site:Biltmore), then
    ...
    {
        "Timestamp": "2019-10-21T18:00:00Z",
        "Id": "WS_ROSE",
        "Name": "WS_ROSE",
        "Tags": "Weather, Low Resolution, Gen1",
        "Site": "Rosecliff",
        "SolarRadiation": 132,
        "AmbientTemperature": null,
        "CloudCover": null,
        "Temperature": 14.537369185607899
    },
    ... 
    (rest of the values for Site:Rosecliff), then
    ...
    {
        "Timestamp": "2019-10-21T18:00:00Z",
        "Id": "WS_WINT",
        "Name": "WS_WINT",
        "Tags": "Weather, High Resolution, Gen2",
        "Site": "Winterthur",
        "SolarRadiation": 108,
        "AmbientTemperature": 1.0805517883941373,
        "CloudCover": 2,
        "Temperature": null
    },
    ... 
    (rest of the values for Site:Winterthur)
]
```

**Note:** The Data Views product does not assume an intention for ultra-skinny output.

## Identify data items

A different and complementary way of disambiguating the data items is to “identify” them within the field set.

This is also useful for aligning data items across groups. Imagine if each site had an additional stream from a backup weather station:

| Timestamp |	Site |	Primary Temperature | Primary SolarRadiation | Backup Temperature | Backup SolarRadiation
|--|--|--|--|--|--|
| | Biltmore						
| | Rosecliff
| | Winterthur						

The data views engine must be told how the streams align across sites. Here, it makes sense to align them by which measurement they represent: _Primary_ or _Backup_.

### Action
Move the field used as `GroupingField` over to being the “.IdentifyingField” of the weather data items `FieldSet`.
```json
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{
  "Id": "quickstart",
  "Name": "quickstart",
  "Description": null,
  "Queries": [
    { 
      "Id": "weather",
      "Value":"*weather*" 
    }
  ],
  "DataFieldSets": [
        {
            "SourceType": "DataItem",
            "QueryId": "weather",
            "IdentifyingField": {
                "Source": "Metadata",
                "Keys": [
                    "Site"
                ],
                "Label": "{IdentifyingValue} {FirstKey}"
            },
            "DataFields": [
                {
                    "Source": "Id",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Id"
                },
                {
                    "Source": "Name",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Name"
                },
                {
                    "Source": "Tags",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Tags"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                }
            ],
       },
  ],
  "GroupingFields": [],
  "Shape": "Standard",
  "IndexField": { "Label": "Timestamp" },
  "IndexTypeCode": "DateTime"
}
```

### Expected result
```text
HTTP 204 No Content
```

### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}
```

### Expected result
We’re back to a wide table, but the field ids are now distinct. The suggested/default values of the Available Fields’ `.Label` property includes {IdentifyingValue}, so if using those defaults, the impact of adding an identifying field is immediately clear.

```json
HTTP 200 OK
[
    {
        "Timestamp": "2019-10-21T18:00:00Z",
        "Winterthur Id": "WS_WINT",
        "Winterthur Name": "WS_WINT",
        "Winterthur Tags": "Weather, High Resolution, Gen2",
        "Winterthur SolarRadiation": 108,
        "Winterthur AmbientTemperature": 1.0805517883941373,
        "Winterthur CloudCover": 2,
        "Winterthur Temperature": null,
        "Rosecliff Id": "WS_ROSE",
        "Rosecliff Name": "WS_ROSE",
        "Rosecliff Tags": "Weather, Low Resolution, Gen1",
        "Rosecliff SolarRadiation": 132,
        "Rosecliff AmbientTemperature": null,
        "Rosecliff CloudCover": null,
        "Rosecliff Temperature": 14.537369185607899,
        "Biltmore Id": "WS_BILT",
        "Biltmore Name": "WS_BILT",
        "Biltmore Tags": "Weather, High Resolution, Gen1",
        "Biltmore SolarRadiation": 165,
        "Biltmore AmbientTemperature": null,
        "Biltmore CloudCover": null,
        "Biltmore Temperature": 33.589619124193831,
    },
    ...
```

## Consolidate data fields

There is a problem with this data view: the Gen1 Weather streams have a "Temperature" property but the Gen2 Weather streams have  renamed it to "AmbientTemperature". The data view has fields for both, but for each stream "Temperature" or "AmbientTemperature" is null. This is undesirable since the fields are semantically identical and should not be separate fields in the data view.

Find the `Field` associated with "AmbientTemperature". To the `Field`'s `.Keys` array, add "Temperature":

```json
{
  "Source": "PropertyId",
  "Keys": [
    "AmbientTemperature",
    "Temperature"
  ],
  "Label": "{IdentifyingValue} {FirstKey}"
},
```
Now that field will match to either "Temperature" or "AmbientTemperature".  
Remove the `Field` associated only with "Temperature".

You can also remove the `Fields` associated with data item Id and Name. These are not providing any additional useful information.

```json
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{
  "Id": "quickstart",
  "Name": "quickstart",
  "Description": null,
  "Queries": [
    { 
      "Id": "weather",
      "Value":"*weather*" 
    }
  ],
  "DataFieldSets": [
        {
            "SourceType": "DataItem",
            "QueryId": "weather",
            "IdentifyingField": {
                "Source": "Metadata",
                "Keys": [
                    "Site"
                ],
                "Label": "{IdentifyingValue} {FirstKey}"
            },
            "DataFields": [
                {
                    "Source": "Tags",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Tags"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature",
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {FirstKey}"
                },
            ],
       },
  ],
  "GroupingFields": [],
  "Shape": "Standard",
  "IndexField": { "Label": "Timestamp" },
  "IndexTypeCode": "DateTime"
}
```
### Expected Result
```text
HTTP 204 No Content
```

### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}
```

### Expected Result
```json
HTTP 200 OK
[
    {
        "Timestamp": "2019-10-21T18:00:00Z",
        "Winterthur Tags": "Weather, High Resolution, Gen2",
        "Winterthur SolarRadiation": 108,
        "Winterthur AmbientTemperature": 1.0805517883941373,
        "Winterthur CloudCover": 2,
        "Rosecliff Tags": "Weather, Low Resolution, Gen1",
        "Rosecliff SolarRadiation": 132,
        "Rosecliff AmbientTemperature": 14.537369185607899,
        "Rosecliff CloudCover": null,
        "Biltmore Tags": "Weather, High Resolution, Gen1",
        "Biltmore SolarRadiation": 165,
        "Biltmore AmbientTemperature": 33.589619124193831,
        "Biltmore CloudCover": null,
    }
    ...
```


## Further steps
The API is designed to encourage trial-and-error. We encourage you to experiment with other ways to represent this data, and to incorporate information about the solar inverters at each site.
