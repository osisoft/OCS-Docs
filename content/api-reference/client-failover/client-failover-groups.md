---
uid: client-failover-groups

---

# Client Failover Groups
API for Client Failover Groups.

## `List Group Configurations`

<a id="opIdClientFailoverGroups_List Group Configurations"></a>

Returns the list of failover groups.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups
?skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>
`[optional] integer skip`
<br/>The number of items to skip.<br/><br/>`[optional] integer count`
<br/>The number of items to return.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[GroupConfiguration](#schemagroupconfiguration)[]|A list of failover groups.|
|400|[ErrorResponse](#schemaerrorresponse)|Request is not valid. See the response body for additional details.|
|403|[ErrorResponse](#schemaerrorresponse)|Request is not authorized.|

<h4>Response Headers</h4>

|Status|Header|Type|Description|
|---|---|---|---|
|200|Total-Count|integer|Total number of failover groups.|

<h4>Example response body</h4>

> 200 Response ([GroupConfiguration](#schemagroupconfiguration)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "FailoverTimeout": "string",
    "AdditionalData": {
      "property1": null,
      "property2": null
    }
  }
]
```

---

## `Post Group`

<a id="opIdClientFailoverGroups_Post Group"></a>

Creates a failover group.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>

<h4>Request Body</h4>

The configuration of the failover group being created or updated.<br/>

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "FailoverTimeout": "string",
  "AdditionalData": {
    "property1": null,
    "property2": null
  }
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[GroupConfiguration](#schemagroupconfiguration)|Failover group with matching id and configuration exists.|
|201|[GroupConfiguration](#schemagroupconfiguration)|The failover group was created.|
|400|[ErrorResponse](#schemaerrorresponse)|Request is not valid. See the response body for additional details.|
|403|[ErrorResponse](#schemaerrorresponse)|Request is not authorized.|
|409|[ErrorResponse](#schemaerrorresponse)|Group already exists with different configuration.|

<h4>Example response body</h4>

> 200 Response ([GroupConfiguration](#schemagroupconfiguration))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "FailoverTimeout": "string",
  "AdditionalData": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Get Group Configuration`

<a id="opIdClientFailoverGroups_Get Group Configuration"></a>

Gets a failover group by identifier.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/>The identifier of the failover group.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[GroupConfiguration](#schemagroupconfiguration)|Failover group with the specified identifier.|
|400|[ErrorResponse](#schemaerrorresponse)|Request is not valid. See the response body for additional details.|
|403|[ErrorResponse](#schemaerrorresponse)|Request is not authorized.|
|404|[ErrorResponse](#schemaerrorresponse)|A failover group with the specified identifier was not found.|

<h4>Example response body</h4>

> 200 Response ([GroupConfiguration](#schemagroupconfiguration))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "FailoverTimeout": "string",
  "AdditionalData": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Delete Group`

<a id="opIdClientFailoverGroups_Delete Group"></a>

Deletes a failover group by identifier.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/>The identifier of the failover group.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The failover group was deleted.|
|400|[ErrorResponse](#schemaerrorresponse)|Request is not valid. See the response body for additional details.|
|403|[ErrorResponse](#schemaerrorresponse)|Request is not authorized.|
|404|[ErrorResponse](#schemaerrorresponse)|A failover group with the specified identifier was not found.|
|409|[ErrorResponse](#schemaerrorresponse)|The failover group has active sessions and cannot be deleted.|

---

## `Get Group Status`

<a id="opIdClientFailoverGroups_Get Group Status"></a>

Gets the failover group status.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}/status
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/>The identifier of the failover group.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[IGroupStatus](#schemaigroupstatus)|The failover group status.|
|400|[ErrorResponse](#schemaerrorresponse)|Request is not valid. See the response body for additional details.|
|403|[ErrorResponse](#schemaerrorresponse)|Request is not authorized.|
|404|[ErrorResponse](#schemaerrorresponse)|A failover group with the specified identifier was not found.|

<h4>Example response body</h4>

> 200 Response ([IGroupStatus](#schemaigroupstatus))

```json
{
  "Primary": "string",
  "PendingPrimary": "string",
  "LastDataProcessedTime": "2019-08-24T14:15:22Z"
}
```

---
## Definitions

### GroupConfiguration

<a id="schemagroupconfiguration"></a>
<a id="schema_GroupConfiguration"></a>
<a id="tocSgroupconfiguration"></a>
<a id="tocsgroupconfiguration"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Unique group identifier|
|Name|string|false|true|Friendly name of group|
|Description|string|false|true|Description of group|
|FailoverTimeout|time-span|false|false|Amount of time after which a client is considered inactive|
|AdditionalData|object|false|true|Additional group data.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "FailoverTimeout": "string",
  "AdditionalData": {
    "property1": null,
    "property2": null
  }
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

### IGroupStatus

<a id="schemaigroupstatus"></a>
<a id="schema_IGroupStatus"></a>
<a id="tocSigroupstatus"></a>
<a id="tocsigroupstatus"></a>

Group status.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Primary|string|false|true|Unique client session identifier for the primary client|
|PendingPrimary|string|false|true|Unique client session identifier for the pending primary client|
|LastDataProcessedTime|date-time|false|true|Time when last data was processed by primary|

```json
{
  "Primary": "string",
  "PendingPrimary": "string",
  "LastDataProcessedTime": "2019-08-24T14:15:22Z"
}

```

---

