---
uid: omf-ingress-omf

---

# OMF
API for sending OMF messages.

## `Post OMF Message`

<a id="opIdOmf_Post OMF Message"></a>

[Full OMF Specification](https://omf-docs.osisoft.com)

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/omf
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Headers</h4>

|Header|Type|Required|Description|
|---|---|---|---|
|MessageType|string|true|Describes the type of message contained in the message body. One of: `type`, `container`, or `data`.|
|MessageFormat|string|true|Describes the data serialization format employed in the message body. Currently limited to `json`.|
|OmfVersion|string|true|Specifies the version of the OSIsoft Message Format used in the message. Current supported versions are `1.0`, `1.1`, and `1.2`.|
|Action|string|false|Describes the action to be performed using the data in the message body. One of: `create`, `update`, or `delete`. If omitted, `create` is assumed.|
|Compression|string|false|The compression algorithm used to compress the message body. Currently limited to `gzip`.  If not specified, the message body is assumed to be uncompressed.|

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|202|[OmfResponseBody](#schemaomfresponsebody)|An Operation-Id which can be used to troubleshoot data ingress errors.|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Bad request|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|413|[ErrorResponseBody](#schemaerrorresponsebody)|Payload too large|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

> 202 Response

```json
{
  "Operation-Id": "9d178275-5385-4414-8cc0-dbf3f8759686"
}
```

> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

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

### OmfResponseBody

<a id="schemaomfresponsebody"></a>
<a id="schema_OmfResponseBody"></a>
<a id="tocSomfresponsebody"></a>
<a id="tocsomfresponsebody"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Operation-Id|string|false|true|The `Operation-Id` associated with this request. If there are any issues with data flow, contact OSIsoft Technical Support with this value.|

```json
{
  "Operation-Id": "9d178275-5385-4414-8cc0-dbf3f8759686"
}

```

---

### ErrorResponseBody

<a id="schemaerrorresponsebody"></a>
<a id="schema_ErrorResponseBody"></a>
<a id="tocSerrorresponsebody"></a>
<a id="tocserrorresponsebody"></a>

<h4>Properties</h4>

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

