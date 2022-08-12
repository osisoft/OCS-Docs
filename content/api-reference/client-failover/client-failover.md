---
uid: client-failover

---

# Client Failover
API for Client Failover application information.

## `Get Information`

<a id="opIdClientFailover_Get Information"></a>

Gets the Client Failover application information.

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
|200|[EndpointInfo](#schemaendpointinfo)|The application information.|
|400|[ErrorResponse](#schemaerrorresponse)|Request is not valid. See the response body for additional details.|
|403|[ErrorResponse](#schemaerrorresponse)|Request is not authorized.|

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
|Version|string|false|true|Endpoint version|

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

Response error for controller methods.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Operation identifier|
|Error|string|false|true|Error string|
|Reason|string|false|true|Error reason string|
|Resolution|string|false|true|Resolution string|
|AdditionalParameters|object|false|true|Additional parameters to add to the response.|

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

