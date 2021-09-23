---
uid: sds-streams-metadata

---

# Streams metadata
Stream metadata is represented as a dictionary of string keys and associated string values. 
It can be used to associate additional information with a stream. Stream tags are represented 
as a list of strings. Tags can be used to categorize or denote special attributes of streams. 
The Stream Metadata API And Stream Tags API do not accept the search query parameter in their respective
GET methods. However, stream tags and metadata can be used as criteria in search query strings to return 
stream results with the [Streams](xref:sds-streams) API. 

## `Get Stream Metadata Changedata`

<a id="opIdMetadata_Get Stream Metadata Changedata"></a>

Returns a dictionary of metadata keys and their associated `ChangeData` for the specified streamId.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/ChangeData/Metadata
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string streamId`
<br/>Stream identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A dictionary of metadata keys and their associated `ChangeData` for the specified streamId.|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|The request is malformed or invalid.|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized.|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden.|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|The specified stream was not found.|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error.|

#### Example response body
> 200 Response

```json
{
  "Key1": {
    "Value": "metadata value",
    "ChangeData": {
      "Timestamp": "0001-01-01T00:00:00",
      "CreatorId": "00000000-0000-0000-0000-000000000000",
      "CreatorType": "2"
    }
  },
  "Key2": {
    "Value": "metadata value",
    "ChangeData": {
      "Timestamp": "0001-01-01T00:00:00",
      "CreatorId": "00000000-0000-0000-0000-000000000000",
      "CreatorType": "2"
    }
  }
}
```

> 400 Response

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---

## `Get Stream Metadata`

<a id="opIdMetadata_Get Stream Metadata"></a>

Returns the metadata dictionary for the specified stream.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string streamId`
<br/>Stream identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|The metadata dictionary for the specified stream.|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|The request is malformed or invalid.|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized.|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden.|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|The specified stream was not found.|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error.|

#### Example response body
> 200 Response

```json
{
  "key": "value"
}
```

> 400 Response

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---

## `Update Stream Metadata`

<a id="opIdMetadata_Update Stream Metadata"></a>

Replaces the metadata for the specified stream with the metadata in the request body. Overwrites any existing metadata; does not merge.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string streamId`
<br/>Stream identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|The updated metadata dictionary for the specified stream.|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|The request is malformed or invalid.|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized.|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden.|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|The specified stream was not found.|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict.|
|412|[ErrorResponseBody](#schemaerrorresponsebody)|Preconditioned failed.|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error.|

#### Example response body
> 200 Response

```json
{
  "key": "value"
}
```

> 400 Response

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---

## `Patch Stream Metadata`

<a id="opIdMetadata_Patch Stream Metadata"></a>

Modifies the metadata based on operations specified in the request body. The request body follows [JSON Patch format](http://jsonpatch.com/).

### Request
```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string streamId`
<br/>Stream identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|The modified metadata dictionary for the specified stream.|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|The request is malformed or invalid.|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized.|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden.|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|The specified stream was not found.|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict.|
|412|[ErrorResponseBody](#schemaerrorresponsebody)|Preconditioned failed.|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error.|

#### Example response body
> 200 Response

```json
{
  "key": "value"
}
```

> 400 Response

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---

## `Delete Stream Metadata`

<a id="opIdMetadata_Delete Stream Metadata"></a>

Deletes the metadata for the specified stream.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string streamId`
<br/>Stream identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|The request is malformed or invalid.|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized.|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden.|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|The specified stream was not found.|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict.|
|412|[ErrorResponseBody](#schemaerrorresponsebody)|Preconditioned failed.|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error.|

#### Example response body
> 400 Response

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---

## `Get Stream Metadata Value`

<a id="opIdMetadata_Get Stream Metadata Value"></a>

Returns the value for the specified key in the metadata dictionary of the specified stream.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Metadata/{key}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string streamId`
<br/>Stream identifier<br/><br/><br/>`string key`
<br/>Key specifying the metadata value of interest<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|string|The value for the specified key in the metadata dictionary of the specified stream.|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|The request is malformed or invalid.|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized.|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden.|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|The specified key was not found.|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error.|

#### Example response body
> 200 Response

```json
"value"
```

> 400 Response

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---
## Definitions

### ErrorResponseBody

<a id="schemaerrorresponsebody"></a>
<a id="schema_ErrorResponseBody"></a>
<a id="tocSerrorresponsebody"></a>
<a id="tocserrorresponsebody"></a>

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|None|
|Error|string|false|true|None|
|Reason|string|false|true|None|
|Resolution|string|false|true|None|
|Parameters|object|false|true|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}

```

---

### MetadataModel

<a id="schemametadatamodel"></a>
<a id="schema_MetadataModel"></a>
<a id="tocSmetadatamodel"></a>
<a id="tocsmetadatamodel"></a>

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|string|false|true|None|
|ChangeData|[ChangeData](#schemachangedata)|false|true|None|

```json
{
  "Value": "string",
  "ChangeData": {
    "Timestamp": "2019-08-24T14:15:22Z",
    "CreatorId": "string",
    "CreatorType": 0
  }
}

```

---

### ChangeData

<a id="schemachangedata"></a>
<a id="schema_ChangeData"></a>
<a id="tocSchangedata"></a>
<a id="tocschangedata"></a>

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Timestamp|date-time|false|false|The time that the parent MetaObject was created or updated.|
|CreatorId|string|false|true|The user, client or rule ID which created the parent MetaObject. The type of ID is specified by the CreatorType|
|CreatorType|[CreatorType](#schemacreatortype)|false|false|The type of ID specified by the CreatorId|

```json
{
  "Timestamp": "2019-08-24T14:15:22Z",
  "CreatorId": "string",
  "CreatorType": 0
}

```

---

### CreatorType

<a id="schemacreatortype"></a>
<a id="schema_CreatorType"></a>
<a id="tocScreatortype"></a>
<a id="tocscreatortype"></a>

#### Enumerated Values

|Property|Value|
|---|---|
|Unknown|0|
|User|1|
|Client|2|
|Rule|3|

---

