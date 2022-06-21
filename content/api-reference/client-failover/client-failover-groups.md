---
uid: ""

---

# Client Failover Groups
API for Client Failover Groups.

## `List Group Configurations`

<a id="opIdClientFailoverGroups_List Group Configurations"></a>

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
<br/><br/>`[optional] integer count`
<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[GroupConfiguration](#schemagroupconfiguration)[]|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|

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

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>

<h4>Request Body</h4>

<br/>

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
|200|[GroupConfiguration](#schemagroupconfiguration)|None|
|201|[GroupConfiguration](#schemagroupconfiguration)|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|
|409|[ErrorResponse](#schemaerrorresponse)|None|

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

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[GroupConfiguration](#schemagroupconfiguration)|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|
|404|[ErrorResponse](#schemaerrorresponse)|None|

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

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|
|404|[ErrorResponse](#schemaerrorresponse)|None|
|409|[ErrorResponse](#schemaerrorresponse)|None|

---

## `Get Group Status`

<a id="opIdClientFailoverGroups_Get Group Status"></a>

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}/status
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[IGroupStatus](#schemaigroupstatus)|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|
|404|[ErrorResponse](#schemaerrorresponse)|None|

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
|Id|string|false|true|None|
|Name|string|false|true|None|
|Description|string|false|true|None|
|FailoverTimeout|time-span|false|false|None|
|AdditionalData|object|false|true|None|

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

### IGroupStatus

<a id="schemaigroupstatus"></a>
<a id="schema_IGroupStatus"></a>
<a id="tocSigroupstatus"></a>
<a id="tocsigroupstatus"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Primary|string|false|true|None|
|PendingPrimary|string|false|true|None|
|LastDataProcessedTime|date-time|false|true|None|

```json
{
  "Primary": "string",
  "PendingPrimary": "string",
  "LastDataProcessedTime": "2019-08-24T14:15:22Z"
}

```

---

