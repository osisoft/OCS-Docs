---
uid: ""

---

# Configuration

## `Get Configuration (Edge path)`

<a id="opIdConfiguration_Get Configuration (Edge path)"></a>

Returns an Edge System Configuration.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Systems/{edgeSystemId}/Configuration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier used as blob name in the storage account.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Configuration for the specified Edge System.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Configuration not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Create Configuration (Edge path)`

<a id="opIdConfiguration_Create Configuration (Edge path)"></a>

Creates an Edge System Configuration in the storage account. Does not save any secrets supplied as part of the edge system configuration.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Systems/{edgeSystemId}/Configuration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier used as blob name in the storage account.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|Inline|Configuration created.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|409|[ErrorResponse](#schemaerrorresponse)|Conflict.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Update Configuration (Edge path)`

<a id="opIdConfiguration_Update Configuration (Edge path)"></a>

Updates an Edge System Configuration. Does not save any secrets supplied as part of the edge system configuration.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Systems/{edgeSystemId}/Configuration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier used as blob name in the storage account.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Delete Configuration (Edge path)`

<a id="opIdConfiguration_Delete Configuration (Edge path)"></a>

Deletes an Edge System Configuration.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Edge/Systems/{edgeSystemId}/Configuration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier used as blob name in the storage account.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Configuration not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Get Configuration 1`

<a id="opIdConfiguration_Get Configuration 1"></a>

Returns an Edge System Configuration.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Systems/{edgeSystemId}/Configuration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier used as blob name in the storage account.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Configuration for the specified Edge System.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Configuration not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Create Configuration 1`

<a id="opIdConfiguration_Create Configuration 1"></a>

Creates an Edge System Configuration in the storage account. Does not save any secrets supplied as part of the edge system configuration.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Systems/{edgeSystemId}/Configuration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier used as blob name in the storage account.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|Inline|Configuration created.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|409|[ErrorResponse](#schemaerrorresponse)|Conflict.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Update Configuration 1`

<a id="opIdConfiguration_Update Configuration 1"></a>

Updates an Edge System Configuration. Does not save any secrets supplied as part of the edge system configuration.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Systems/{edgeSystemId}/Configuration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier used as blob name in the storage account.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---

## `Delete Configuration 1`

<a id="opIdConfiguration_Delete Configuration 1"></a>

Deletes an Edge System Configuration.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/SoftwareManagement/Systems/{edgeSystemId}/Configuration
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string edgeSystemId`
<br/>Edge System identifier used as blob name in the storage account.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|404|[ErrorResponse](#schemaerrorresponse)|Configuration not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

---
## Definitions

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|true|false|None|
|Error|string|true|false|None|
|Reason|string|true|false|None|
|Resolution|string|true|false|None|
|DynamicProperties|object|false|true|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "DynamicProperties": {
    "property1": null,
    "property2": null
  },
  "property1": null,
  "property2": null
}

```

---

