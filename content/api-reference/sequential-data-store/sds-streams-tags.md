---
uid: sds-streams-tags

---

# Streams tags
Stream metadata is represented as a dictionary of string keys and associated string values. 
It can be used to associate additional information with a stream. Stream tags are represented 
as a list of strings. Tags can be used to categorize or denote special attributes of streams. 
The Stream Metadata API And Stream Tags API do not accept the search query parameter in their respective
GET methods. However, stream tags and metadata can be used as criteria in search query strings to return 
stream results with the [Streams](xref:sds-streams) API. 

## `List Stream Tags`

<a id="opIdTags_List Stream Tags"></a>

Returns the tag list for the specified stream.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Tags
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string streamId`
<br/>Stream identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|The tag list for the specified stream.|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|The request is malformed or invalid.|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized.|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden.|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|The specified stream was not found.|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error.|

#### Example response body
> 200 Response

```json
[
  "tag1",
  "tag2"
]
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

## `Update Stream Tags`

<a id="opIdTags_Update Stream Tags"></a>

Replaces the tag list for the specified stream with the tags listed in the request body. Overwrites any existing tags; does not merge.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Tags
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string streamId`
<br/>Stream identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|The updated list of tags for the specified stream.|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|The request is malformed or invalid.|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized.|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden.|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|The specified stream was not found.|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict.|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error.|

#### Example response body
> 200 Response

```json
[
  "tag1",
  "tag2"
]
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

## `Delete Stream Tags`

<a id="opIdTags_Delete Stream Tags"></a>

Deletes the tag list for the specified stream.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Tags
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

