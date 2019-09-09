---
uid: DataRetrievalApi
---

# DataRetrieval

APIs for Retrieving Data

***

## `Get Data View Data`

Get data for the provided index parameters with paging

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/data/interpolated`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of the Data View
```csharp
string id  [Required] [No Default Value]
```


Specifies beginning index. The default value is specified by the [Index Config](IndexConfig.md).
```csharp
string startIndex [FromQuery] [Required] [No Default Value]
```


Specifies end index. The default value is specified by the [Index Config](IndexConfig.md).
```csharp
string endIndex [FromQuery] [Required] [No Default Value]
```


Specifies data retrieval interval. The default value is specified in the [Index Config](IndexConfig.md).
```csharp
string interval [FromQuery] [Required] [No Default Value]
```


Specifies the data [output format](DataOutputFormats.md). Output formats: default, table, tableh, csv, csvh
```csharp
string form [FromQuery] [Required] [No Default Value]
```


Not used on the first data call. Afterwards, a continuationToken is provided in the NextPage HTTP response header. It contains all necessary information for the next page of data such as index config and resolved resources.
```csharp
string continuationToken [FromQuery] [Required] [No Default Value]
```


Specifies if Data View backing resources are to be refreshed. Used only on the first data call. Ignored if used with the continuationToken.
```csharp
string cache [FromQuery] [Optional] [Default = "refresh"]
```


Specifies the total count of retrieved events. The default value is 1000. The maximum is 250,000.
```csharp
Int32 count [FromQuery] [Optional] [Default = 1000]
```


### Returns

#### 200

Successfully retrieved data

```json

Time,Temperature,Flowrate,Volume
2018-01-01T00:00:00Z,24,44,245
2018-01-01T00:00:01Z,24,44,245
2018-01-01T00:00:02Z,24,44,245
```

#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified data view Id not found


#### 500

Internal server error

***

## `Get Data Groups`

Get Data Groups for a specified Data View

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/datagroups`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of the Data View
```csharp
string id  [Required] [No Default Value]
```


Specifies if Data View backing resources are to be refreshed. See [Retrieving Data](DataRetrieval.md)
```csharp
string cache [FromQuery] [Optional] [Default = "preserve"]
```


The number of data groups to skip
```csharp
Int32 skip [FromQuery] [Optional] [Default = 0]
```


The number of data groups to display per page. Maximum count allowed is 1000
```csharp
Int32 count [FromQuery] [Optional] [Default = 100]
```


### Returns

#### 200

Successfully retrieved data

```json
{
  "TimeOfResolution": "DateTimeOffset",
  "DataGroups": [
    {
      "TimeOfResolution": "DateTimeOffset",
      "Id": "Int32",
      "ItemCount": "Int32",
      "Values": [
        {
          "Chars": "Char",
          "Length": "Int32"
        }
      ],
      "DataItems": [
        {
          "ItemType": "ItemType enumeration",
          "Id": "String",
          "Name": "String",
          "TenantId": "String",
          "NamespaceId": "String"
        }
      ]
    }
  ]
}
```

#### 207

Multi-status. Successfully retrieved data groups along with errors

```json
{
  "TimeOfResolution": "DateTimeOffset",
  "Errors": [
    {
      "OperationId": "String",
      "Error": "String",
      "Reason": "String",
      "Resolution": "String",
      "AdditionalParameters": [
        {
          "Chars": "Char",
          "Length": "Int32"
        }
      ]
    }
  ],
  "DataGroups": [
    {
      "TimeOfResolution": "DateTimeOffset",
      "Id": "Int32",
      "ItemCount": "Int32",
      "Values": [
        {
          "Chars": "Char",
          "Length": "Int32"
        }
      ],
      "DataItems": [
        {
          "ItemType": "ItemType enumeration",
          "Id": "String",
          "Name": "String",
          "TenantId": "String",
          "NamespaceId": "String"
        }
      ]
    }
  ]
}
```

#### 403

Unauthorized


#### 404

Specified Data View Id not found


#### 500

Internal server error

***

## `Get Data Mappings`

Get mappings for a Data View by Id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/datamappings`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of the Data View
```csharp
string id  [Required] [No Default Value]
```


Specifies if Data View backing resources are to be refreshed. See [Retrieving Data](DataRetrieval.md)
```csharp
string cache [FromQuery] [Optional] [Default = "preserve"]
```


### Returns

#### 200

Successfully retrieved data mappings

```json
{
  "SharedMappingRules": [
    {
      "Id": "String",
      "Pattern": "String",
      "MappingRule": {
        "PropertyPaths": [
          {
            "Chars": "Char",
            "Length": "Int32"
          }
        ],
        "ItemIdentifier": {
          "FilterResource": "FilterResource enumeration",
          "FilterField": "FilterField enumeration",
          "Name": "String",
          "Value": "String"
        }
      }
    }
  ],
  "Columns": [
    {
      "Name": "String",
      "NamespaceId": "String",
      "MappingRule": {},
      "IsKey": "Boolean",
      "DataType": "String",
      "UOM": "String"
    }
  ]
}
```

#### 403

Unauthorized


#### 404

Specified data view Id not found


#### 500

Internal server error

***

## `Get DataItems`

Get data items for a Data View by Id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/dataitems`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of the Data View
```csharp
string id  [Required] [No Default Value]
```


Specifies if Data View backing resources are to be refreshed. See [Retrieving Data](DataRetrieval.md)
```csharp
string cache [FromQuery] [Optional] [Default = "preserve"]
```


The number of data items to skip
```csharp
Int32 skip [FromQuery] [Optional] [Default = 0]
```


The number of data items to display per page. Maximum count allowed is 1000
```csharp
Int32 count [FromQuery] [Optional] [Default = 100]
```


### Returns

#### 200

Successfully retrieved data items

```json
{
  "TimeOfResolution": "DateTimeOffset",
  "Items": [
    {
      "ItemType": "ItemType enumeration",
      "Id": "String",
      "Name": "String",
      "TenantId": "String",
      "NamespaceId": "String"
    }
  ]
}
```

#### 207

Multi-status. Successfully retrieved data groups along with errors

```json
{
  "TimeOfResolution": "DateTimeOffset",
  "Errors": [
    {
      "OperationId": "String",
      "Error": "String",
      "Reason": "String",
      "Resolution": "String",
      "AdditionalParameters": [
        {
          "Chars": "Char",
          "Length": "Int32"
        }
      ]
    }
  ],
  "Items": [
    {
      "ItemType": "ItemType enumeration",
      "Id": "String",
      "Name": "String",
      "TenantId": "String",
      "NamespaceId": "String"
    }
  ]
}
```

#### 403

Unauthorized


#### 404

Specified data view Id not found


#### 500

Internal server error

***

## `Get Statistics`

Get statistics for a Data View by Id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/statistics`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of the Data View
```csharp
string id  [Required] [No Default Value]
```


Specifies if Data View backing resources are to be refreshed. See [Retrieving Data](DataRetrieval.md)
```csharp
string cache [FromQuery] [Optional] [Default = "preserve"]
```


### Returns

#### 200

Successfully retrieved data view statistics

```json
{
  "TimeOfResolution": "DateTimeOffset",
  "DataItemsCount": "Int32",
  "DataGroupsCount": "Int32",
  "ColumnCount": "Int32"
}
```

#### 403

Unauthorized


#### 404

Specified data view Id not found


#### 500

Internal server error

***

