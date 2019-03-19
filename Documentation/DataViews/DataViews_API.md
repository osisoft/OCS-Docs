---
uid: DataViewsApi
---

# DataViews

APIs for working with data views.

## Properties

For HTTP requests and responses, the DataViewDefinition object has the following properties and JSON-serialized body: (Note that this is a sample object with default/example field values. Subsequent references to DataViewDefinition in this documentation will be abbreviated.) 

Property | Type | Descriptions
 --- | --- | ---
Id | string | Id of the data view
Name | string | (Optional) Name of the data view
Description | string | (Optional) Description of the data view
Queries | [QueryInfo] | A list of queries to select the data items to be displayed in the data view
GroupRules | [GroupRule] | (Optional) A list of group rules to organize data items into data groups
Mappings | Mappings | (Optional) Mappings define the names of the columns and the stream properties that get mapped to them
IndexDataType | string | Defines the index data type that index config uses
IndexConfig | IndexConfig | (Optional) Defines the index information from which to retrieve data. Currently, only interpolation mode is supported

### Full object example:
```json
{
  "Id": "DataViewDefinition_Id",
  "Name": "DataViewDefinition_Name",
  "Description": "DataViewDefinition_Description",
  "Queries": [
    {
      "Id": "pump",
      "Query": {
        "Resource": "Streams",
        "Field": "Id",
        "Name": null,
        "Value": "TestPump",
        "Operator": "Contains"
      }
    }
  ],
  "GroupRules": [
    {
      "Id": "DefaultGroupRule",
      "Type": "StreamName",
      "TokenRules": null
    }
  ],
  "Mappings": {
    "SharedMappingRules": [
      {
        "Id": "shared mapping rule",
        "Token": "{measurement}",
        "MappingRulePattern": {
          "PropertyPaths": [
            "Value"
          ],
          "ItemIdentifier": {
            "Resource": "Streams",
            "Field": "Id",
            "Name": null,
            "Value": "{measurement}",
            "Operator": "Equals"
          }
        }
      }
    ],
    "Columns": [
      {
        "Name": "keyColumn",
        "MappingRule": {
          "PropertyPaths": [
            "path"
          ],
          "ItemIdentifier": null
        },
        "IsKey": true,
        "DataType": "DateTime"
      },
      {
        "Name": "group rule",
        "MappingRule": {
          "GroupRuleId": "id",
          "GroupRuleToken": "token"
        },
        "IsKey": false,
        "DataType": "string"
      },
      {
        "Name": "column1",
        "MappingRule": {
          "PropertyPaths": [
            "path"
          ],
          "ItemIdentifier": null
        },
        "IsKey": false,
        "DataType": null
      },
      {
        "Name": "column2",
        "MappingRule": {
          "PropertyPaths": [
            "path"
          ],
          "ItemIdentifier": {
            "Resource": "Streams",
            "Field": "Id",
            "Name": null,
            "Value": "test",
            "Operator": "Equals"
          }
        },
        "IsKey": false,
        "DataType": null
      },
      {
        "Name": "column3",
        "MappingRule": {
          "SharedMappingRuleId": "shared mapping rule",
          "Token": "{measurement}"
        },
        "IsKey": false,
        "DataType": null
      }
    ],
    "IsDefault": false
  },
  "IndexDataType": "DateTime",
  "IndexConfig": {
    "IsDefault": false,
    "StartIndex": "2018-01-01T00:00:00Z",
    "EndIndex": "2018-01-02T00:00:00Z",
    "Mode": "Interpolated",
    "Interval": "00:05:00"
  }
}
```
***

## `Get Data Views`

Get all created dataviews

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Skip:
```csharp
Int32 skip [FromQuery] [Required] [No Default Value]
```


Count:
```csharp
Int32 count [FromQuery] [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the data views (could be an empty array). Return type: [DataViewDefinition]

```json
[
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": "List`1",
  "GroupRules": "List`1",
  "Mappings": "Mappings object",
  "IndexDataType": "String",
  "IndexConfig": "IndexConfig object"
}
]
```

#### 400

Bad request


#### 500

Internal server error

***

## `Get Data View`

Get a dataview by id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of dataview:
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the data view. Return type: DataViewDefinition

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": "List`1",
  "GroupRules": "List`1",
  "Mappings": "Mappings object",
  "IndexDataType": "String",
  "IndexConfig": "IndexConfig object"
}
```

#### 403

Unauthorized


#### 404

Specified data view not found


#### 500

Internal server error

***

## `Create Data View`

Create a new dataview

### Request
`POST api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```

### Parameters from request body: 

Dataview definition object:
```csharp
DataViewDefinition dataViewDefinition [FromBody] [Required] [No Default Value]
```

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": "List`1",
  "GroupRules": "List`1",
  "Mappings": "Mappings object",
  "IndexDataType": "String",
  "IndexConfig": "IndexConfig object"
}
```

### Returns

#### 201

Successfully created a dataview definition. Return type: DataViewDefinition

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": "List`1",
  "GroupRules": "List`1",
  "Mappings": "Mappings object",
  "IndexDataType": "String",
  "IndexConfig": "IndexConfig object"
}
```

#### 400

Bad request


#### 403

Unauthorized


#### 500

Internal server error

***

## `Create Data View With Id`

Create a new dataview

### Request
`POST api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of dataview:
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Dataview definition object:
```csharp
DataViewDefinition dataViewDefinition [FromBody] [Required] [No Default Value]
```

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": "List`1",
  "GroupRules": "List`1",
  "Mappings": "Mappings object",
  "IndexDataType": "String",
  "IndexConfig": "IndexConfig object"
}
```

### Returns

#### 201

Successfully created a dataview definition. Return type: DataViewDefinition

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": "List`1",
  "GroupRules": "List`1",
  "Mappings": "Mappings object",
  "IndexDataType": "String",
  "IndexConfig": "IndexConfig object"
}
```

#### 400

Bad request


#### 403

Unauthorized


#### 409

Data view definition with the specified Id already exists


#### 500

Internal server error

***

## `Update Data View`

Edit the dataview with specified Id

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of dataview:
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Updated dataview definition object in the request body:
```csharp
DataViewDefinition updates [FromBody] [Required] [No Default Value]
```

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": "List`1",
  "GroupRules": "List`1",
  "Mappings": "Mappings object",
  "IndexDataType": "String",
  "IndexConfig": "IndexConfig object"
}
```

### Returns

#### 200

OK - retrieved the data view. Return type: DataViewDefinition

```json
{
  "Id": "String",
  "Name": "String",
  "Description": "String",
  "Queries": "List`1",
  "GroupRules": "List`1",
  "Mappings": "Mappings object",
  "IndexDataType": "String",
  "IndexConfig": "IndexConfig object"
}
```

#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified data view not found


#### 500

Internal server error

***

## `Delete Data View`

Delete the dataview with specified Id

### Request
`DELETE api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of dataview:
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 204

Successfully deleted the data view


#### 403

Unauthorized


#### 404

Specified data view not found


#### 500

Internal server error

***

## `Preview Data View Data`

Get data preview based on created data view definition

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/preview/interpolated`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of dataview:
```csharp
string id  [Required] [No Default Value]
```


Start index for the data:
```csharp
string startIndex [FromQuery] [Required] [No Default Value]
```


End index for the data:
```csharp
string endIndex [FromQuery] [Required] [No Default Value]
```


Data interval:
```csharp
string interval [FromQuery] [Required] [No Default Value]
```


Data form:
```csharp
string form [FromQuery] [Required] [No Default Value]
```


Max count of data points to retrieve:
```csharp
Int32 maxcount [FromQuery] [Optional] [Default = 1000]
```


### Returns

#### 200

Successfully retrieved data. Return type: ContentResult

```json
Returns data formatted according to the user settings. Output formats: Default, Table, Tableh, Csv, Csvh
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

## `Get Data View Data`

Get data from a specific session

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/data/interpolated`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of dataview:
```csharp
string id  [Required] [No Default Value]
```


Id of session:
```csharp
string sessionId [FromQuery] [Required] [No Default Value]
```


Form:
```csharp
string form [FromQuery] [Required] [No Default Value]
```


Skip:
```csharp
Int32 skip [FromQuery] [Required] [No Default Value]
```


Count:
```csharp
Int32 count [FromQuery] [Optional] [Default = 1000]
```


### Returns

#### 200

Successfully retrieved data. Return type: ContentResult

```json
Returns data formatted according to the user settings. Output formats: Default, Table, Tableh, Csv, Csvh
```

#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified data view Id or session Id not found


#### 500

Internal server error

***

## `Get Data Groups`

Get data groups for a specified data view

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/datagroups`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of dataview:
```csharp
string id  [Required] [No Default Value]
```


Skip:
```csharp
Int32 skip [FromQuery] [Required] [No Default Value]
```


Count:
```csharp
Int32 count [FromQuery] [Required] [No Default Value]
```


### Returns

#### 200

Successfully retrieved data. Return type: DataGroupCollection

```json
{
  "DataGroups": "Dictionary of <Int32, IDataGroup> pairs",
  "Errors": "List`1"
}
```

#### 207

Multi-status. Look at response message. Return type: DataGroupCollection

```json
{
  "DataGroups": "Dictionary of <Int32, IDataGroup> pairs",
  "Errors": "List`1"
}
```

#### 403

Unauthorized


#### 404

Specified data view Id not found


#### 500

Internal server error

***

## `Get Data Group`

Get a specific data group

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/dataGroups/{dataGroupId}`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of dataview:
```csharp
string id  [Required] [No Default Value]
```


Id of the data group:
```csharp
string dataGroupId  [Required] [No Default Value]
```


### Returns

#### 200

Successfully retrieved data group. Return type: DataGroup

```json
{
  "Errors": "List`1",
  "Tokens": "Dictionary of <String, Dictionary`2> pairs",
  "DataItems": "Dictionary of <String, IDataItem> pairs"
}
```

#### 403

Unauthorized


#### 404

Specified data view Id not found


#### 500

Internal server error

***

## `Create Data View Session`

Create a session for a dataview

### Request
`POST api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/sessions`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Dataview id:
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Session configuration object:
```csharp
SessionIndexAndTimeout sessionConfig [FromBody] [Required] [No Default Value]
```

```json
{
  "IndexConfig": "IndexConfig object",
  "SessionTimeout": "String"
}
```

### Returns

#### 201

Successfully created a session. Return type: SessionInfo

```json
{
  "Id": "String",
  "Status": "SessionStatus object",
  "SessionTimeout": "String",
  "CreatedDate": "DateTime",
  "LastAccessedTime": "DateTime",
  "DataViewDefinition": "DataViewDefinition object",
  "DataGroups": "DataGroupCollection object",
  "IdleTimeout": "TimeSpan"
}
```

#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified data view id not found


#### 500

Internal server error

***

## `Get Data View Session`

Get a specific session corresponding to a specific dataview

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/sessions/{sessionId}`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Dataview id:
```csharp
string id  [Required] [No Default Value]
```


Session Id:
```csharp
string sessionId  [Required] [No Default Value]
```


### Returns

#### 200

Successfully retrieved the session. Return type: SessionInfo

```json
{
  "Id": "String",
  "Status": "SessionStatus object",
  "SessionTimeout": "String",
  "CreatedDate": "DateTime",
  "LastAccessedTime": "DateTime",
  "DataViewDefinition": "DataViewDefinition object",
  "DataGroups": "DataGroupCollection object",
  "IdleTimeout": "TimeSpan"
}
```

#### 403

Unauthorized


#### 404

Session or dataview not found


#### 500

Internal server error

***

## `Get Data View Sessions`

Get all sessions for a dataview

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/sessions`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Dataview id:
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

Successfully retrieved sessions. Return type: [SessionInfo]

```json
[
{
  "Id": "String",
  "Status": "SessionStatus object",
  "SessionTimeout": "String",
  "CreatedDate": "DateTime",
  "LastAccessedTime": "DateTime",
  "DataViewDefinition": "DataViewDefinition object",
  "DataGroups": "DataGroupCollection object",
  "IdleTimeout": "TimeSpan"
}
]
```

#### 403

Unauthorized


#### 404

Specified data view id not found


#### 500

Internal server error

***

## `Get Sessions`

Get all sessions for all dataviews

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/sessions`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


### Returns

#### 200

Successfully retrieved all sessions. Return type: [SessionInfo]

```json
[
{
  "Id": "String",
  "Status": "SessionStatus object",
  "SessionTimeout": "String",
  "CreatedDate": "DateTime",
  "LastAccessedTime": "DateTime",
  "DataViewDefinition": "DataViewDefinition object",
  "DataGroups": "DataGroupCollection object",
  "IdleTimeout": "TimeSpan"
}
]
```

#### 500

Internal server error

***

## `Delete Data View Session`

Delete a specific session

### Request
`DELETE api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/sessions/{sessionId}`

### Parameters

Id of tenant:
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace:
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of dataview:
```csharp
string id  [Required] [No Default Value]
```


Id of the session:
```csharp
string sessionId  [Required] [No Default Value]
```


### Returns

#### 204

Successfully deleted session


#### 403

Unauthorized


#### 404

Session with specified Id not found


#### 500

Internal server error

***

