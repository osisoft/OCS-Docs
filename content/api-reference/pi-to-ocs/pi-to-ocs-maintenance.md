---
uid: pi-to-ocs-maintenance

---

# Maintenance

## `Get Data Source Owner For Agent`

<a id="opIdMaintenance_Get Data Source Owner For Agent"></a>

Internal-Only method for looking up a DataSource `Trustee` object, using a specified `agentId`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pitoocs/maintenance/{agentId}/dataSourceOwner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string agentId`
<br/>The Id of the Agent that belongs to the desired DataSource.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|A `Trustee` representing the owner of the agent's DataSource.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

<h4>Example response body</h4>

> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

---

## `Verify Namespace Scoped Resources Consistent`

<a id="opIdMaintenance_Verify Namespace Scoped Resources Consistent"></a>

Verify that all agent resources associated with the specified `namespaceId` exist.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pitoocs/maintenance/NamespaceScopedResources
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|List of inconsistent agents.|
|204|None|No Content - all agent resources are consistent.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `Update Namespace Scoped Resources`

<a id="opIdMaintenance_Update Namespace Scoped Resources"></a>

Update all agent resources associated with the specified `namespaceId` to be consistent with Agent Status.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pitoocs/maintenance/NamespaceScopedResources
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Agent resources associated with the specified `namespaceId` were updated to be consistent with agent status.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---

## `Delete Namespace Scoped Resources`

<a id="opIdMaintenance_Delete Namespace Scoped Resources"></a>

Delete all agent resources associated with the specified `namespaceId`.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/pitoocs/maintenance/NamespaceScopedResources
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|All agent resources associated with the specified `namespaceId` have been deleted.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error|

---
## Definitions

### Trustee

<a id="schematrustee"></a>
<a id="schema_Trustee"></a>
<a id="tocStrustee"></a>
<a id="tocstrustee"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Type|[TrusteeType](#schematrusteetype)|false|false|None|
|ObjectId|string|false|true|None|
|TenantId|string|false|true|None|

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}

```

---

### TrusteeType

<a id="schematrusteetype"></a>
<a id="schema_TrusteeType"></a>
<a id="tocStrusteetype"></a>
<a id="tocstrusteetype"></a>

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|User|1||
|Client|2||
|Role|3||

---

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

