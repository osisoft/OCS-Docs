---
uid: ResolvedDataViewAPI
---

# Resolved Data View API

This portion of the overall [data views API](xref:DataViewsAPIOverview) is the resources that resolve per-user for each data view. For a description of what this information is, and how to use it, see the [documentation](xref:ResolvedDataView) for resolved data views.


## `Get Data Items by Query`
Gets the paged collection of data items that are the results of an individual query, and which are eligible for use in the current data view. A data view has a collection of zero or more queries. Each query has an identifier. Those identifiers are used here as part of the request path.

### Request

```text
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/{dataViewId}/Resolved/DataItems/{queryId}?cache={cache}&skip={skip}&count={count}
```
### Request path parameters

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

`string queryId`  
The `Query` identifier

### Request query parameters

`[optional] string cache`  
"Refresh" to force the resource to re-resolve.  
"Preserve" to use cached information, if available. This is the default value.

`[optional] int skip`  
An optional parameter representing the zero-based offset of the first data item to retrieve. If not specified, a default value of 0 is used.

`[optional] int count`  
An optional parameter representing the maximum number of data items to retrieve. If not specified, a default value of 100 is used.

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItems<DataItem>` | An object with a "TimeOfResolution" and a collection of "Items", the `DataItem`s that resolved. |
| 403 Forbidden | error | You are not authorized for this operation
| 404 Not Found | error | The data view or query does not exist
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Response headers
Successful (200 OK) responses include one or more header values related to paging.

| Header | Description |
|--|--|
| FirstPage | Hyperlink to the first page of results |
| NextPage | Hyperlink to the next page of results, if the results span into an additional page. Absence of this header indicates that there are no additional pages to be retrieved. |


#### Example response body

```json
HTTP 200 OK
Content-Type: application/json
{
  "TimeOfResolution": "2019-12-13T01:23:45Z",
  "Items": [
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

## `Get Ineligible Data Items by Query`
Gets the paged collection of data items that are the results of an individual query, but which are not eligible for use in the current data view. A common reason for ineligibility is that the item's index property is of a different type than the data view expects. A data view has a collection of zero or more queries. Each query has an identifier. Those identifiers are used here as part of the request path.

### Request

```text
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/{dataViewId}/Resolved/IneligibleDataItems/{queryId}?cache={cache}&skip={skip}&count={count}
```

### Request path parameters

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

`string queryId`  
The `Query` identifier

### Request query parameters

`[optional] string cache`  
"Refresh" to force the resource to re-resolve.  
"Preserve" to use cached information, if available. This is the default value.

`[optional] int skip`  
An optional parameter representing the zero-based offset of the first data item to retrieve. If not specified, a default value of 0 is used.

`[optional] int count`  
An optional parameter representing the maximum number of data items to retrieve. If not specified, a default value of 100 is used.

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItems<DataItem>` | An object with a "TimeOfResolution" and a collection of "Items", the `DataItem`s that resolved. |
| 403 Forbidden | error | You are not authorized for this operation
| 404 Not Found | error | The data view or query does not exist
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Response headers
Successful (200 OK) responses include one or more header values related to paging.

| Header | Description |
|--|--|
| FirstPage | Hyperlink to the first page of results |
| NextPage | Hyperlink to the next page of results, if the results span into an additional page. Absence of this header indicates that there are no additional pages to be retrieved. |

#### Example response body

```json
HTTP 200 OK
Content-Type: application/json
{
  "TimeOfResolution": "2019-12-13T01:23:45Z",
  "Items": [
    {
      "ResourceType": "Stream",
      "Id": "SOME_INELIGIBLE_STREAM",
      "Name": "Some Ineligible Stream",
      "TypeId": "type-with-different-index",
      "Tags": [],
       "Metadata": { },
       "DataItemFields": [
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

## `Get Groups`
Gets the collection of `Group`s that resolved for a data view.

### Request

```text
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/{dataViewId}/Resolved/Groups?cache={cache}&skip={skip}&count={count}
```

### Request path parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

### Request query parameters

`[optional] string cache`  
"Refresh" to force the resource to re-resolve.  
"Preserve" to use cached information, if available. This is the default value.

`[optional] int skip`  
An optional parameter representing the zero-based offset of the first data item to retrieve. If not specified, a default value of 0 is used.

`[optional] int count`  
An optional parameter representing the maximum number of data items to retrieve. If not specified, a default value of 100 is used.

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItems<Group>` | An object with a "TimeOfResolution" and a collection of "Items", the `Groups`s that resolved. |
| 403 Forbidden | error | You are not authorized for this operation
| 404 Not Found | error | The data view does not exist
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Response headers
Successful (200 OK) responses include one or more header values related to paging.

| Header | Description |
|--|--|
| FirstPage | Hyperlink to the first page of results |
| NextPage | Hyperlink to the next page of results, if the results span into an additional page. Absence of this header indicates that there are no additional pages to be retrieved. |

#### Example response body

```json
HTTP 200 OK
Content-Type: application/json
{
  "TimeOfResolution": "2019-12-13T01:23:45Z",
  "Items": [
    {
      "Values": [ "Biltmore" ],
      "DataItems": {
        "Query1": [
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
    }
  ]
}
```

## `Get Available Field Sets`
Gets the collection of field sets that are available for use in the data view, and which are not already included in the data view.

### Request

```text
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/{dataViewId}/Resolved/AvailableFieldSets?cache={cache}
```

### Request path parameters
`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

### Request query parameters

`[optional] string cache`  
"Refresh" to force the resource to re-resolve.  
"Preserve" to use cached information, if available. This is the default value.

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItems<FieldSet>` | An object with a "TimeOfResolution" and a collection of "Items", the `FieldSets`s that resolved and which are still available |
| 403 Forbidden | error | You are not authorized for this operation
| 404 Not Found | error | The data view does not exist
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Example response body

```json
HTTP 200 OK
{
    "TimeOfResolution": "2019-12-13T01:23:45Z",
    "Items": [
        {
            "SourceType": "DataItem",
            "QueryId": "weather",
            "Fields": [
                {
                    "Source": "Id",
                    "Keys": [],
                    "Label": "{IdentifyingValue} Id"
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
            ]
        }
    ]
}
```

## `Get Field Mappings`
Gets the collection of field mappings resolved for the data view. These show the exact data behind every field, for each data item, for each group.

### Request

```text
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/{dataViewId}/Resolved/FieldMappings?cache={cache}
```

### Request path parameters

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

### Request query parameters

`[optional] string cache`  
"Refresh" to force the resource to re-resolve.  
"Preserve" to use cached information, if available. This is the default value.

### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItems<FieldMapping>` | An object with a "TimeOfResolution" and a collection of "Items", the `FieldMapping`s resolved |
| 403 Forbidden | error | You are not authorized for this operation
| 404 Not Found | error | The data view does not exist
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Response headers
Successful (200 OK) responses include one or more header values related to paging.

| Header | Description |
|--|--|
| FirstPage | Hyperlink to the first page of results |
| NextPage | Hyperlink to the next page of results, if the results span into an additional page. Absence of this header indicates that there are no additional pages to be retrieved. |

#### Example response body

```json
HTTP 200 OK
{
    "TimeOfResolution": "2019-12-13T01:23:45Z",
    "Items": [
      {
        "Id": "Timestamp",
        "Label": "Timestamp",
        "FieldSetIndex": 0,
        "FieldIndex": 0,
        "DataMappings": [
          {
            "TargetId": "",
            "TargetFieldKey": "",
            "TypeCode": "DateTime"
          },
          {
            "TargetId": "",
            "TargetFieldKey": "",
            "TypeCode": "DateTime"
          },
          {
            "TargetId": "",
            "TargetFieldKey": "",
            "TypeCode": "DateTime"
          }
        ]
      },
      {
        "Id": "Temperature",
        "Label": "Temperature",
        "FieldSetIndex": 1,
        "FieldIndex": 0,
        "DataMappings": [
          {
            "TargetId": "WS_BILT",
            "TargetFieldKey": "Temperature",
            "TypeCode": "Double"
          },
          {
            "TargetId": "WS_ROSE",
            "TargetFieldKey": "Temperature",
            "TypeCode": "Double"
          },
          {
            "TargetId": "WS_WINT",
            "TargetFieldKey": "AmbientTemperature",
            "TypeCode": "Double"
          }
        ]
      },
    ]
}
```


## `Get Statistics`
Gets statistics about the size and shape on how the data view resolved. 

### Request

```text
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/DataViews/{dataViewId}/Resolved/Statistics?cache={cache}
```

### Request path parameters

`string tenantId`  
The tenant identifier

`string namespaceId`  
The namespace identifier

`string dataViewId`  
The data view identifier

### Request query parameters

`[optional] string cache`  
"Refresh" to force the resource to re-resolve.  
"Preserve" to use cached information, if available. This is the default value.


### Response
The response includes a status code and, in most cases, a body.

| Status code | Body Type | Description |
|--|--|--|
| 200 OK | `ResolvedItem<Statistics>` | Successfully retrieved data. |
| 403 Forbidden | error | User is not authorized for this operation.
| 404 Not Found | error | The specified data view identifier is not found.
| 500 Internal Server Error | error | An error occurred while processing the request. See the response body for details |

#### Example response body

```json
HTTP 200 OK
{
    "TimeOfResolution": "2019-12-13T01:23:45Z",
    "DataItemCount": 24,
    "GroupCount": 2,
    "FieldCount": 12
}
```
