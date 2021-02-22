---
uid: DefineaDataViewRecommendedWorkflow
---

# Recommended workflow: Define a data view
This is an introduction to the recommended workflow for defining data views. The following sections show these concepts in action.

Designing and tweaking a data view is expected to be an iterative process. You are not expected to "get it right the first time," nor to be an expert at your OCS configuration such as the streams available in the Sequential Data Store. Data views provide an interactive way to select, identify, and arrange the data you and your applications need.

There are three main steps required to define a data view: 
1. Including data items (such as streams)
2. Including specific data fields
3. Arranging them within the data view.

This is not a one-way street. You are likely to keep adjusting the data fields included in the view even after you have begun working on how the fields are arranged in the data view.


## Procedure: Define a data view

This section presents the main concepts behind creating data views.

It is assumed that you are working with streams as described in the [Stream examples](xref:DataViewsExampleScenario). The data views API uses the same authentication scheme as the Sequential Data Store.

### Create a data view
Very little information is required to create a new data view. In fact, if you request that the system generate an identifier for the new data view, no information at all is necessary. However, it is recommended to specify a meaningful `.Id`, because the identifier cannot be changed later without recreating the data view. All other properties are modifiable.

This data view does not accomplish anything yet, but it's a starting point.

#### Action
```json
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{ 
  "Id": "quickstart" 
}
```

#### Expected result
A data view with very few properties populated: `.Id`, `.Name`, `IndexField` (default: `{ "Label": "Timestamp" }`), `.IndexTypeCode` (default: `"DateTime"`), Shape (default: `DataViewShape.Standard`, which as a string is `"Standard"`).
```json
HTTP 201 Created
{
  "Id": "quickstart",
  "Name": "quickstart",
  "IndexField": { "Label": "Timestamp" },
  "Queries": [],
  "DataFieldSets": [],
  "GroupingFields": [],
  "IndexTypeCode": "DateTime",
  "Shape": "Standard"
}
```

The `.Queries` property is empty, `[ ]`. We will address that soon. 

### Retrieve the data view
To access the data view again, it is available via the `GET` verb:

#### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
```

#### Expected result
```json
HTTP 200 OK
{
  "Id": "quickstart",
  "Name": "quickstart",
  "IndexField": { "Label": "Timestamp" },
  "Queries": [],
  "DataFieldSets": [],
  "GroupingFields": [],
  "IndexTypeCode": "DateTime",
  "Shape": "Standard"
}
```

### Add a query for data items

Creating a data view begins with including some data items. This example will use SDS Streams.

#### Action
Use the result of the previous step as the starting point. All following steps will involve modifying the data view definition, or seeing the effects of those modifications.

Add an item to the array of `.Queries`: `{ "Id": "weather", Kind: "Stream", "Value":"*weather*" }`
```json
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{
  "Id": "quickstart",
  "Name": "quickstart",
  "IndexField": { "Label": "Timestamp" },
  "Queries": [
    { 
      "Id": "weather",
      "Kind": "Stream",
      "Value":"*weather*" 
    }
  ],
  "DataFieldSets": [],
  "GroupingFields": [],
  "IndexTypeCode": "DateTime",
  "Shape": "Standard"
}
```

#### Expected result
```text
HTTP 204 No Content
```

### View items found by the query

Data views resolve on a per user basis, executing the queries you defined. The results are available in several “resolved” resources.

#### Action – Page through the data items found by the query
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Resolved/DataItems/weather
```

#### Expected result
An array of the data items matching the query, whose index type is "DateTime" (matching the Data View’s IndexTypeCode)

```json
HTTP 200 OK
{
    "TimeOfResolution": "(a timestamp in ISO8601 format)",
    "Items": [
        {
            "Id": "WS_BILT",
            "Name": "WS_BILT",
            "TypeId": "docs-omf-weather-gen1",
            "ResourceType": "Stream",
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
                    "Name": "Solar Radiation",
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
            "Id": "WS_ROSE",
            "Name": "WS_ROSE",
            "TypeId": "docs-omf-weather-gen1",
            "ResourceType": "Stream",
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
                    "Name": "Solar Radiation",
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
            "Id": "WS_WINT",
            "Name": "WS_WINT",
            "TypeId": "docs-omf-weather-gen2",
            "ResourceType": "Stream",
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
                    "Name": "Solar Radiation",
                    "TypeCode": "Int32",
                    "IsKey": false
                },
                {
                    "Id": "AmbientTemperature",
                    "Name": "Ambient Temperature",
                    "TypeCode": "Double",
                    "IsKey": false
                },
                {
                    "Id": "CloudCover",
                    "Name": "Cloud Cover",
                    "TypeCode": "Int32",
                    "IsKey": false
                 }
             ]
         }
     ]
}
```

#### Action – Page through the ineligible data items found by the query
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Resolved/IneligibleDataItems/weather
```

#### Expected result
An array of the data items matching the query, but whose index type is not "DateTime" and thus not eligible for inclusion in the data view.

With the example streams, this collection is empty.
```json
HTTP 200 OK
{
  "TimeOfResolution": "(a timestamp in ISO 8601 format)",
  "Items": []
}
```

### View fields available to include in the data view

#### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Resolved/AvailableFieldSets
```

#### Expected result
A field set pointing to the query identified by "weather". Assuming some data items were retrieved, this field set shows that attributes of the retrieved data items (id, name, tags) are available, as well as the values of all metadata and properties.

```json
HTTP 200 OK
{
    "TimeOfResolution": "(a timestamp in ISO 8601 format)",
    "Items": [
        {
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
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "Metadata",
                    "Keys": [
                        "Site"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
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
                }
            ]
        }
    ]
}
```

### Include some of the available fields
At this point, if you query for data, the table only contains the `IndexField` – because no fields have been included in the data view. Including fields is a deliberate action, albeit one that is intended to be easy.

#### Action
For ease, grab all of the field sets that are available. 

Set the data view’s `DataFieldSets` property as the contents of the `AvailableFieldSets` response.
```json
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{
  "Id": "quickstart",
  "Name": "quickstart",
  "IndexField": { "Label": "Timestamp" },
  "Queries": [
    { 
      "Id": "weather",
      "Kind": "Stream",
      "Value":"*weather*" 
    }
  ],
  "DataFieldSets": [
        {
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
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "Metadata",
                    "Keys": [
                        "Site"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
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
                }
            ],
       },
  ],
  "GroupingFields": [],
  "IndexTypeCode": "DateTime",
  "Shape": "Standard"
}
```
#### Expected Result
```text
HTTP 204 No Content
```

Now, if we return to the available field sets, all data fields are used so none are available.

#### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Resolved/AvailableFieldSets
```

#### Expected result
No available data fields.

```json
{
    "TimeOfResolution": "(a timestamp in ISO 8601 format)",
    "Items": []
}
```
And if we request data, the table contains multiple fields in addition to the `IndexField`.

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
]
```

There was ambiguity in the field mapping identifiers, so the data views engine suffixed each field mapping id ordinally.

The suffixing (to ensure uniqueness) is done for the sake of client behavior, as it is not expected that ambiguity is an acceptable outcome. The remaining steps show two approaches for disambiguating the content of a data view. 

#### Action – Want csv?
Resubmit the data query with an additional query parameter, `&form=csvh`
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
```

### Group the data view
One way to disambiguate the data items is to “group” them, which amounts to partitioning them based on a value. For example, metadata:Site as the grouping field might yield groups of Biltmore, Rosecliff, and Winterthur, each containing the data items associated with that Site.

You may use multiple grouping fields. This is effectively “group by X then Y then Z”

Grouping fields are a property of the data view, and are an array of `Field` objects. This means the same Field objects contained in the available or included field sets may be reused directly as grouping fields.

#### Action
To group by metadata, copy the field in the `DataView` object with `{ Source: “Metadata”, Keys: [ "Site" ] }`, and add it to the array of `.GroupingFields`.

```json
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{
  "Id": "quickstart",
  "Name": "quickstart",
  "IndexField": { "Label": "Timestamp" },
  "Queries": [
    { 
      "Id": "weather",
      "Kind": "Stream",
      "Value":"*weather*" 
    }
  ],
  "DataFieldSets": [
        {
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
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },                
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
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
      "Label": "{IdentifyingValue} {Key}"
    }
  ],
  "IndexTypeCode": "DateTime",
  "Shape": "Standard"
}
```

#### Expected result
```text
HTTP 204 No Content
```

#### Action

```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}
```

#### Expected result

Data that looks a bit different now. In table terms, the data table would be ultra-skinny instead of ultra-wide.

```json
HTTP 200 OK
[
    {
        "Timestamp": "2019-10-21T18:00:00Z",
        "Site": "Biltmore",
        "Id": "WS_BILT",
        "Name": "WS_BILT",
        "AmbientTemperature": null,
        "CloudCover": null,
        "SolarRadiation": 165,
        "Temperature": 33.589619124193831,
        "Tags": "Weather, High Resolution, Gen1"
    },
    ... 
    (rest of the values for Site:Biltmore), then
    ...
    {
        "Timestamp": "2019-10-21T18:00:00Z",
        "Site": "Rosecliff",
        "Id": "WS_ROSE",
        "Name": "WS_ROSE",
        "AmbientTemperature": null,
        "CloudCover": null,
        "SolarRadiation": 132,
        "Temperature": 14.537369185607899,
        "Tags": "Weather, Low Resolution, Gen1"
    },
    ... 
    (rest of the values for Site:Rosecliff), then
    ...
    {
        "Timestamp": "2019-10-21T18:00:00Z",
        "Site": "Winterthur",
        "Id": "WS_WINT",
        "Name": "WS_WINT",
        "AmbientTemperature": 1.0805517883941373,
        "CloudCover": 2,
        "SolarRadiation": 108,
        "Temperature": null,
        "Tags": "Weather, High Resolution, Gen2"
    },
    ... 
    (rest of the values for Site:Winterthur)
]
```

**Note:** The Data Views product does not assume an intention for ultra-skinny output.

### Identify data items

A different and complementary way of disambiguating the data items is to “identify” them within the field set.

This is also useful for aligning data items across groups. Imagine if each site had an additional stream from a backup weather station:

| Timestamp | Site | Primary Temperature | Primary SolarRadiation | Backup Temperature | Backup SolarRadiation
|--|--|--|--|--|--|
| | Biltmore
| | Rosecliff
| | Winterthur

The data views engine must be told how the streams align across sites. Here, it makes sense to align them by which measurement they represent: _Primary_ or _Backup_.

#### Action

Move the field used as `GroupingField` over to being the “.IdentifyingField” of the weather data items `FieldSet`.
```json
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{
  "Id": "quickstart",
  "Name": "quickstart",
  "IndexField": { "Label": "Timestamp" },
  "Queries": [
    { 
      "Id": "weather",
      "Kind": "Stream",
      "Value":"*weather*" 
    }
  ],
  "DataFieldSets": [
        {
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
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
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
            ],
            "IdentifyingField": {
                "Source": "Metadata",
                "Keys": [
                    "Site"
                ],
                "Label": "{IdentifyingValue} {Key}"
            }
       },
  ],
  "GroupingFields": [],
  "IndexTypeCode": "DateTime",
  "Shape": "Standard"
}
```

#### Expected result
```text
HTTP 204 No Content
```

#### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}
```

#### Expected result
We’re back to a wide table, but the field ids are now distinct. The suggested/default values of the Available Fields’ `.Label` property includes {IdentifyingValue}, so if using those defaults, the impact of adding an identifying field is immediately clear.

```json
HTTP 200 OK
[
    {
        "Timestamp": "2019-10-21T18:00:00Z",
        "Biltmore Id": "WS_BILT",
        "Biltmore Name": "WS_BILT",
        "Biltmore AmbientTemperature": null,
        "Biltmore CloudCover": null,
        "Biltmore SolarRadiation": 165,
        "Biltmore Temperature": 33.589619124193831,
        "Biltmore Tags": "Weather, High Resolution, Gen1",
        "Rosecliff Id": "WS_ROSE",
        "Rosecliff Name": "WS_ROSE",
        "Rosecliff AmbientTemperature": null,
        "Rosecliff CloudCover": null,
        "Rosecliff SolarRadiation": 132,
        "Rosecliff Temperature": 14.537369185607899,
        "Rosecliff Tags": "Weather, Low Resolution, Gen1",
        "Winterthur Id": "WS_WINT",
        "Winterthur Name": "WS_WINT",
        "Winterthur AmbientTemperature": 1.0805517883941373,
        "Winterthur CloudCover": 2,
        "Winterthur SolarRadiation": 108,
        "Winterthur Temperature": null,
        "Winterthur Tags": "Weather, High Resolution, Gen2"
    },
    ...
]
```

### Consolidate data fields

There is a problem with this data view: the Gen1 Weather streams have a "Temperature" property but the Gen2 Weather streams have  renamed it to "AmbientTemperature". The data view has fields for both, but for each stream "Temperature" or "AmbientTemperature" is null. This is undesirable since the fields are semantically identical and should not be separate fields in the data view.

Find the `Field` associated with "AmbientTemperature". To the `Field`'s `.Keys` array, add "Temperature":

```json
{
  "Source": "PropertyId",
  "Keys": [
    "AmbientTemperature",
    "Temperature"
  ],
  "Label": "{IdentifyingValue} {Key}"
},
```
Now that field will match to either "Temperature" or "AmbientTemperature".  
Remove the `Field` associated only with "Temperature".

You can also remove the `Fields` associated with data item Id and Name. These are not providing any additional useful information.

#### Action
```json
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart
{
  "Id": "quickstart",
  "Name": "quickstart",
  "IndexField": { "Label": "Timestamp" },
  "Queries": [
    { 
      "Id": "weather",
      "Kind": "Stream",
      "Value":"*weather*" 
    }
  ],
  "DataFieldSets": [
        {
            "QueryId": "weather",
            "DataFields": [
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "AmbientTemperature",
                        "Temperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "CloudCover"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
                },
                {
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
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
                }
            ],
            "IdentifyingField": {
                "Source": "Metadata",
                "Keys": [
                    "Site"
                ],
                "Label": "{IdentifyingValue} {Key}"
            }
       },
  ],
  "GroupingFields": [],
  "IndexTypeCode": "DateTime",
  "Shape": "Standard"
}
```
#### Expected Result
```text
HTTP 204 No Content
```

#### Action
```text
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/quickstart/Data/Interpolated
?startIndex={your_val_here}&endIndex={your_val_here}&interval={your_val_here}
```

#### Expected Result
```json
HTTP 200 OK
[
    {
        "Timestamp": "2019-10-21T18:00:00Z",
        "Biltmore AmbientTemperature": 33.589619124193831,
        "Biltmore CloudCover": null,
        "Biltmore SolarRadiation": 165,
        "Biltmore Tags": "Weather, High Resolution, Gen1",
        "Rosecliff AmbientTemperature": 14.537369185607899,
        "Rosecliff CloudCover": null,
        "Rosecliff SolarRadiation": 132,
        "Rosecliff Tags": "Weather, Low Resolution, Gen1",
        "Winterthur AmbientTemperature": 1.0805517883941373,
        "Winterthur CloudCover": 2,
        "Winterthur SolarRadiation": 108,
        "Winterthur Tags": "Weather, High Resolution, Gen2"
    }
    ...
]
```
### Further steps
The API is designed to encourage trial-and-error. We encourage you to experiment with other ways to represent this data, and to incorporate information about the solar inverters at each site.

