---
uid: ""

---

# Client Failover
API for Client Failover application information.

## `Get Information`

<a id="opIdClientFailover_Get Information"></a>

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[EndpointInfo](#schemaendpointinfo)|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|

<h4>Example response body</h4>

> 200 Response ([EndpointInfo](#schemaendpointinfo))

```json
{
  "Version": "string"
}
```

---
## Definitions

### EndpointInfo

<a id="schemaendpointinfo"></a>
<a id="schema_EndpointInfo"></a>
<a id="tocSendpointinfo"></a>
<a id="tocsendpointinfo"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Version|string|false|true|None|

```json
{
  "Version": "string"
}

```

---

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|None|
|Error|string|false|true|None|
|Reason|string|false|true|None|
|Resolution|string|false|true|None|
|AdditionalParameters|object|false|true|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "AdditionalParameters": {
    "property1": null,
    "property2": null
  },
  "property1": null,
  "property2": null
}

```

---

