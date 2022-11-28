---
uid: omf-ingress-omf-connections

---

# OMF Connections
APIs for managing OmfConnections.

## `Get OMF Connections`

<a id="opIdOmfConnections_Get OMF Connections"></a>

Gets a list of all `OmfConnection` objects in the given namespace.

<h3>Request</h3>

```text 
GET /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/omfConnections
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[OmfConnections](#schemaomfconnections)|`OmfConnections` object that contains a list of `OmfConnection` objects|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Results": [
    {
      "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
      "Name": "OmfConnection1 name",
      "State": "Active",
      "Description": "OmfConnection1 description",
      "CreatedDate": "2021-03-18T23:57:44.6109361Z",
      "ClientIds": [
        "d6b178a4-0de5-4c30-8ba7-0a84751be854"
      ]
    },
    {
      "Id": "b7e1393c-ebd1-41e0-97ef-362bead4508d",
      "Name": "OmfConnection2 name",
      "State": "Creating",
      "Description": "OmfConnection2 description",
      "CreatedDate": "2022-01-05T03:35:24.6309361Z",
      "ClientIds": [
        "feecf1d0-b366-4a8b-91d2-92bee976686e"
      ]
    }
  ]
}
```

> 401 Response ([ErrorResponseBody](#schemaerrorresponsebody))

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

## `Create OMF Connection`

<a id="opIdOmfConnections_Create OMF Connection"></a>

Creates a new `OmfConnection` mapped to the specified `ClientIds`. A given `ClientId` may only be mapped to one `OmfConnection` per namespace.

<h3>Request</h3>

```text 
POST /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/omfConnections
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

The `omfConnectionCreate` object to create<br/>

```json
{
  "Name": "OmfConnection name",
  "Description": "OmfConnection description",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|202|[OmfConnection](#schemaomfconnection)|The created `OmfConnection`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Bad request|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

> 202 Response

```json
{
  "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
  "Name": "OmfConnection name",
  "State": "Active",
  "Description": "OmfConnection description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
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

## `Get OMF Connection`

<a id="opIdOmfConnections_Get OMF Connection"></a>

Gets the specified `OmfConnection`.

<h3>Request</h3>

```text 
GET /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/omfConnections/{omfConnectionId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string omfConnectionId`
<br/>OMF connection identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[OmfConnection](#schemaomfconnection)|The specified `OmfConnection`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
  "Name": "OmfConnection name",
  "State": "Active",
  "Description": "OmfConnection description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
}
```

> 401 Response ([ErrorResponseBody](#schemaerrorresponsebody))

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

## `Update OMF Connection`

<a id="opIdOmfConnections_Update OMF Connection"></a>

Updates the `Name`, `Description`, and/or `ClientIds` for the specified `OmfConnection`.

<h3>Request</h3>

```text 
PUT /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/omfConnections/{omfConnectionId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string omfConnectionId`
<br/>OMF connection identifier.<br/><br/>

<h4>Request Body</h4>

The `OmfConnectionUpdate` with the fields to update<br/>

```json
{
  "Name": "OmfConnection name",
  "Description": "OmfConnection description",
  "ClientIds": [
    "7f17ba9e-51cc-47c4-8df4-22e5e641e9a4"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[OmfConnection](#schemaomfconnection)|The updated `OmfConnection`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Bad request|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
  "Name": "OmfConnection name",
  "State": "Active",
  "Description": "OmfConnection description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
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

## `Delete OMF Connection`

<a id="opIdOmfConnections_Delete OMF Connection"></a>

Deletes the specified `OmfConnection`.

<h3>Request</h3>

```text 
DELETE /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/omfConnections/{omfConnectionId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string omfConnectionId`
<br/>OMF connection identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|202|[OmfConnection](#schemaomfconnection)|No content|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

> 202 Response

```json
{
  "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
  "Name": "OmfConnection name",
  "State": "Active",
  "Description": "OmfConnection description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
}
```

> 401 Response ([ErrorResponseBody](#schemaerrorresponsebody))

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

### OmfConnections

<a id="schemaomfconnections"></a>
<a id="schema_OmfConnections"></a>
<a id="tocSomfconnections"></a>
<a id="tocsomfconnections"></a>

Object returned when fetching all `OmfConnection` objects in the given namespace.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Results|[[OmfConnection](#schemaomfconnection)]|false|true|List of `OmfConnection` objects.|

```json
{
  "Results": [
    {
      "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
      "Name": "OmfConnection1 name",
      "State": "Active",
      "Description": "OmfConnection1 description",
      "CreatedDate": "2021-03-18T23:57:44.6109361Z",
      "ClientIds": [
        "d6b178a4-0de5-4c30-8ba7-0a84751be854"
      ]
    },
    {
      "Id": "b7e1393c-ebd1-41e0-97ef-362bead4508d",
      "Name": "OmfConnection2 name",
      "State": "Creating",
      "Description": "OmfConnection2 description",
      "CreatedDate": "2022-01-05T03:35:24.6309361Z",
      "ClientIds": [
        "feecf1d0-b366-4a8b-91d2-92bee976686e"
      ]
    }
  ]
}

```

---

### OmfConnection

<a id="schemaomfconnection"></a>
<a id="schema_OmfConnection"></a>
<a id="tocSomfconnection"></a>
<a id="tocsomfconnection"></a>

Object returned from `OmfConnection` routes.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Server-generated unique identifier.|
|Name|string|false|true|User-specified name. Limit 200 characters.|
|State|string|false|true|Current `OmfConnection` state. Possible values are `Creating`, `Active`, `Deleting` and `Deleted`. Set by the server.|
|Description|string|false|true|A description. Limit 1000 characters.|
|CreatedDate|date-time|false|false|Server-generated creation timestamp (UTC).|
|ClientIds|string[]|false|true|List of `Client` identifiers. Data sent by these clients will be sent to this `OmfConnection`. Limit 10000 `Client` identifiers.|

```json
{
  "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
  "Name": "OmfConnection name",
  "State": "Active",
  "Description": "OmfConnection description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
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

### OmfConnectionCreate

<a id="schemaomfconnectioncreate"></a>
<a id="schema_OmfConnectionCreate"></a>
<a id="tocSomfconnectioncreate"></a>
<a id="tocsomfconnectioncreate"></a>

Object used to create an `OmfConnection`.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|User-specified name. Limit 200 characters.|
|Description|string|false|true|A description. Limit 1000 characters.|
|ClientIds|string[]|true|false|List of `Client` identifiers. Data sent by these clients will be sent to this `OmfConnection`. Limit 10000 `Client` identifiers.|

```json
{
  "Name": "OmfConnection name",
  "Description": "OmfConnection description",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
}

```

---

### OmfConnectionUpdate

<a id="schemaomfconnectionupdate"></a>
<a id="schema_OmfConnectionUpdate"></a>
<a id="tocSomfconnectionupdate"></a>
<a id="tocsomfconnectionupdate"></a>

Object used to update an `OmfConnection`.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|true|false|User-specified name. Limit 200 characters.|
|Description|string|false|true|A description. Limit 1000 characters.|
|ClientIds|string[]|true|false|List of `Client` identifiers. Data sent by these clients will be sent to this `OmfConnection`. Limit 10000 `Client` identifiers.|

```json
{
  "Name": "OmfConnection name",
  "Description": "OmfConnection description",
  "ClientIds": [
    "7f17ba9e-51cc-47c4-8df4-22e5e641e9a4"
  ]
}

```

---

