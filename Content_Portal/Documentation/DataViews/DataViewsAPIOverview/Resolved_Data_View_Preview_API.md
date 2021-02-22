---
uid: ResolvedDataViewPreviewAPI
---

# Resolved data view preview API

This portion of the overall [data views API](xref:DataViewsAPIOverview) specifies the resources that resolve per-user for an input data view. 
The preview APIs require a data view to be passed in the request body for each request, which provides the user the flexibility to change the data view on the fly without saving/updating it.

## `Get Data Items by Query`
Gets the paged collection of data items returned by an individual query, and which are eligible for use in the provided data view. A data view has a collection of zero or more queries. Each query has an identifier. Those identifiers are used here as part of the request path.

### Request

```text
POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Preview/DataViews/Resolved/DataItems/{queryId}?skip={skip}&count={count}
```
### Request path parameters

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string queryId`  
The `Query` identifier

### Request query parameters

`[optional] int skip`  
An optional parameter representing the zero-based offset of the first data item to retrieve. If not specified, a default value of 0 is used.

`[optional] int count`  
An optional parameter representing the maximum number of data items to retrieve. If not specified, a default value of 100 is used.

### Request body
A `DataView` object to get the results for.

#### Example request body
```json
{
  "IndexField": { "Label": "Timestamp" },
  "Queries": [
    { 
      "Id": "weather",
      "Kind": "Stream",
      "Value":"*WS_BILT*" 
    }
  ],
  "DataFieldSets": [],
  "GroupingFields": [],
  "IndexTypeCode": "DateTime",
  "Shape": "Standard"
}
```

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItems<DataItem>` | An object with a "TimeOfResolution" and a collection of "Items", the `DataItem`s that resolved. |
| 400 Bad Request | error | The data view or the query parameters are not valid. See the response body for details |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The query does not exist |
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Response headers
Successful (200 OK) responses include:

| Header | Description |
|--|--|
| Total-Count | The total count of data items visible to the current user |
| Link | Hyperlinks to the first page and next page of results as applicable |


#### Example response body

```json
HTTP 200 OK
Content-Type: application/json
{
  "TimeOfResolution": "2019-12-13T01:23:45Z",
  "Items": [
    {
      "Id": "WS_BILT",
      "Name": "WS_BILT",
      "TypeId": "quickstart-omf-weather-gen1",
      "ResourceType": "Stream",
      "Tags": [
        "Weather",
        "High Resolution",
        "Gen1"
       ],
       "Metadata": [
         {
           "Name": "Site",
           "Value": "Biltmore",
           "TypeCode": "String"
         }
       ],
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
      ],
      "IneligibleDataItemFields": []
    }
  ]
}
```

### .NET client libraries method
```csharp
   Task<ResolvedItems<DataItem>> GetPreviewDataItemsAsync(string queryId, DataView dataView, int skip = 0, int count = 100);
```
## `Get Ineligible Data Items by Query`
Gets the paged collection of data items returned by an individual query, but which are not eligible for use in the provided data view. A common reason for ineligibility is that the item's index property is of a different type than the data view expects. A data view has a collection of zero or more queries. Each query has an identifier. Those identifiers are used here as part of the request path.

### Request

```text
POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Preview/DataViews/Resolved/IneligibleDataItems/{queryId}?skip={skip}&count={count}
```

### Request path parameters

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string queryId`  
The `Query` identifier

### Request query parameters

`[optional] int skip`  
An optional parameter representing the zero-based offset of the first data item to retrieve. If not specified, a default value of 0 is used.

`[optional] int count`  
An optional parameter representing the maximum number of data items to retrieve. If not specified, a default value of 100 is used.

### Request body
A `DataView` object to get the results for.

#### Example request body
```json
{
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

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItems<DataItem>` | An object with a "TimeOfResolution" and a collection of "Items", the `DataItem`s that resolved. |
| 400 Bad Request | error | The data view or the query parameters are not valid. See the response body for details |
| 403 Forbidden | error | You are not authorized for this operation
| 404 Not Found | error | The query does not exist
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Response headers
Successful (200 OK) responses include:

| Header | Description |
|--|--|
| Total-Count | The total count of data items visible to the current user |
| Link | Hyperlinks to the first page and next page of results as applicable |

#### Example response body

```json
HTTP 200 OK
Content-Type: application/json
{
  "TimeOfResolution": "2019-12-13T01:23:45Z",
  "Items": [
    {
      "Id": "SOME_INELIGIBLE_STREAM",
      "Name": "Some Ineligible Stream",
      "TypeId": "type-with-different-index",
      "ResourceType": "Stream",
      "Tags": [],
      "Metadata": [],
      "DataItemFields": [],
      "IneligibleDataItemFields": [
         {
           "Id": "Depth",
           "Name": "Depth",
           "TypeCode": "Double",
           "IsKey": true
         },
         {
           "Id": "Density",
           "Name": "Density",
           "TypeCode": "Double",
           "IsKey": false
         }
      ]
    }
  ]
}
```

### .NET client libraries method
```csharp
   Task<ResolvedItems<DataItem>> GetPreviewIneligibleDataItemsAsync(string queryId, DataView dataView, int skip = 0, int count = 100);
```

## `Get Groups`
Gets the collection of `Group`s that resolved for the provided data view.

### Request

```text
POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Preview/DataViews/Resolved/Groups?skip={skip}&count={count}
```

### Request path parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

### Request query parameters

`[optional] int skip`  
An optional parameter representing the zero-based offset of the first group to retrieve. If not specified, a default value of 0 is used.

`[optional] int count`  
An optional parameter representing the maximum number of groups to retrieve. If not specified, a default value of 100 is used.

### Request body
A `DataView` object to get the results for.

#### Example request body
```json
{
  "IndexField": { "Label": "Timestamp" },
  "Queries": [
    { 
      "Id": "weather",
      "Kind": "Stream",
      "Value":"*WS_BILT*" 
    }
  ],
  "DataFieldSets": [],
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

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItems<Group>` | An object with a "TimeOfResolution" and a collection of "Items", the `Groups`s that resolved. |
| 400 Bad Request | error | The data view or the query parameters are not valid. See the response body for details |
| 403 Forbidden | error | You are not authorized for this operation
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Response headers
Successful (200 OK) responses include:

| Header | Description |
|--|--|
| Total-Count | The total count of groups |
| Link | Hyperlinks to the first page and next page of results as applicable |

#### Example response body

```json
HTTP 200 OK
Content-Type: application/json
{
  "TimeOfResolution": "2019-12-13T01:23:45Z",
  "Items": [
    {
      "GroupingValues": [ 
        {
          "Value": "Biltmore",
          "TypeCode": "String"
        }
      ],
      "DataItems": {
        "Query1": [
          {
            "Id": "WS_BILT",
            "Name": "WS_BILT",
            "TypeId": "quickstart-omf-weather-gen1",
            "ResourceType": "Stream",
            "Tags": [
                "Weather",
                "High Resolution",
                "Gen1"
            ],
            "Metadata": [
              {
                "Name": "Site",
                "Value": "Biltmore",
                "TypeCode": "String"
              }
            ],
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
            ],
            "IneligibleDataItemFields": []
          }
        ]
      }
    }
  ]
}
```

### .NET client libraries method
```csharp
   Task<ResolvedItems<Group>> GetPreviewGroupsAsync(DataView dataView, int skip = 0, int count = 100);
```

## `Get Available Field Sets`
Gets the collection of field sets that are available for use in the provided data view, and which are not already included in the data view.

### Request

```text
POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Preview/DataViews/Resolved/AvailableFieldSets
```

### Request path parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

### Request body
A `DataView` object to get the results for.

#### Example request body
```json
{
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

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItems<FieldSet>` | An object with a "TimeOfResolution" and a collection of "Items", the `FieldSets`s that resolved and which are still available |
| 400 Bad Request | error | The data view or the query parameters are not valid. See the response body for details |
| 403 Forbidden | error | You are not authorized for this operation
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Example response body

```json
HTTP 200 OK
{
    "TimeOfResolution": "2019-12-13T01:23:45Z",
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
                    "Source": "PropertyId",
                    "Keys": [
                        "SolarRadiation"
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

### .NET client libraries method
```csharp
   Task<ResolvedItems<FieldSet>> GetPreviewAvailableFieldSetsAsync(DataView dataView);
```

## `Get Field Mappings`
Gets the collection of field mappings resolved for the provided data view. These show the exact data behind every field, for each data item, for each group.

### Request

```text
POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Preview/DataViews/Resolved/FieldMappings?skip={skip}&count={count}
```

### Request path parameters

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

### Request query parameters

`[optional] int skip`
An optional parameter representing the zero-based offset of the first field mapping to retrieve. If not specified, a default value of 0 is used.

`[optional] int count`
An optional parameter representing the maximum number of field mappings to retrieve. If not specified, a default value of 100 is used.

### Request body
A `DataView` object to get the results for.

#### Example request body
```json
{
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
                        "Temperature",
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
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

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItems<FieldMapping>` | An object with a "TimeOfResolution" and a collection of "Items", the `FieldMapping`s resolved |
| 400 Bad Request | error | The data view or the query parameters are not valid. See the response body for details |
| 403 Forbidden | error | You are not authorized for this operation
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Response headers
Successful (200 OK) responses include:

| Header | Description |
|--|--|
| Total-Count | The total count of field mappings |
| Link | Hyperlinks to the first page and next page of results as applicable |

#### Example response body

```json
HTTP 200 OK
{
    "TimeOfResolution": "2019-12-13T01:23:45Z",
    "Items": [
      {
        "Id": "Timestamp",
        "Label": "Timestamp",
        "FieldKind": "IndexField",
        "TypeCode": "DateTime",
        "DataMappings": [
          {
            "TypeCode": "DateTime"
          },
          {
            "TypeCode": "DateTime"
          },
          {
            "TypeCode": "DateTime"
          }
        ]
      },
      {
        "Id": "Temperature",
        "Label": "Temperature",
        "FieldKind": "DataField",
        "TypeCode": "Double",
        "DataMappings": [
          {
            "TargetId": "WS_BILT",
            "TargetFieldKey": "Temperature",
            "TypeCode": "Double",
            "FieldSetIndex": 1,
            "FieldIndex": 0
          },
          {
            "TargetId": "WS_ROSE",
            "TargetFieldKey": "Temperature",
            "TypeCode": "Double",
            "FieldSetIndex": 1,
            "FieldIndex": 0
          },
          {
            "TargetId": "WS_WINT",
            "TargetFieldKey": "AmbientTemperature",
            "TypeCode": "Double",
            "FieldSetIndex": 1,
            "FieldIndex": 0
          }
        ]
      },
    ]
}
```

### .NET client libraries method
```csharp
   Task<ResolvedItems<FieldMapping>> GetPreviewFieldMappingsAsync(DataView dataView, int skip = 0, int count = 100);
```

## `Get Statistics`
Gets statistics about the size and shape on how the data view resolved. 

### Request

```text
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Preview/DataViews/Resolved/Statistics
```

### Request path parameters

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

### Request body
A `DataView` object to get the results for.

#### Example request body
```json
{
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
                        "Temperature",
                        "AmbientTemperature"
                    ],
                    "Label": "{IdentifyingValue} {Key}"
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
````

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItem<Statistics>` | Successfully retrieved data. |
| 400 Bad Request | error | The data view or the query parameters are not valid. See the response body for details |
| 403 Forbidden | error | User is not authorized for this operation.
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Example response body

```json
HTTP 200 OK
{
    "TimeOfResolution": "2019-12-13T01:23:45Z",
    "Item": {
    "DataItemCount": 24,
    "GroupCount": 2,
    "FieldMappingCount": 10,
    "DataFieldSets": [
        {
            "DataItemCount": 18,
            "UnmappedDataItemCount": 3,
            "DataFields": [
                {
                    "FieldMappingCount": 3,
                    "DataMappingCount": 6,
                    "EmptyDataMappingCount": 0,
                    "UnmappedGroupCount": 0
                },
                {
                    "FieldMappingCount": 3,
                    "DataMappingCount": 6,
                    "EmptyDataMappingCount": 2,
                    "UnmappedGroupCount": 1
                }
            ]
        },
        {
            "DataItemCount": 6,
            "UnmappedDataItemCount": 0,
            "DataFields": [
                {
                    "FieldMappingCount": 2,
                    "DataMappingCount": 4,
                    "EmptyDataMappingCount": 2,
                    "UnmappedGroupCount": 1
                }
            ]
        }
    ]
  }
}
```

### .NET client libraries method
```csharp
   Task<ResolvedItem<Statistics>> GetPreviewStatisticsAsync(DataView dataView);
```
