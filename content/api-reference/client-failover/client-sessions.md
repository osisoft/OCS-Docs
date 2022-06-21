---
uid: ""

---

# Client Sessions
API for Client Sessions.

## `List Client Sessions`

<a id="opIdClientSessions_List Client Sessions"></a>

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}/clientsessions
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSession](#schemaclientsession)[]|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|
|404|[ErrorResponse](#schemaerrorresponse)|None|

<h4>Example response body</h4>

> 200 Response ([ClientSession](#schemaclientsession)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Heartbeat": {
      "FailoverStatus": 0,
      "LastDataProcessedTime": "2019-08-24T14:15:22Z",
      "HeartbeatTime": "2019-08-24T14:15:22Z"
    },
    "Role": 0,
    "HeartbeatPosted": true,
    "RoleOverride": 0,
    "RoleOverrideExpirationTime": "2019-08-24T14:15:22Z",
    "AdditionalData": {
      "property1": null,
      "property2": null
    }
  }
]
```

---

## `Post Client Session`

<a id="opIdClientSessions_Post Client Session"></a>

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}/clientsessions
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/><br/>

<h4>Request Body</h4>

<br/>

```json
{
  "Id": "string",
  "Name": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSession](#schemaclientsession)|None|
|201|[ClientSession](#schemaclientsession)|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|
|404|[ErrorResponse](#schemaerrorresponse)|None|
|409|[ErrorResponse](#schemaerrorresponse)|None|

<h4>Example response body</h4>

> 200 Response ([ClientSession](#schemaclientsession))

```json
{
  "Id": "string",
  "Name": "string",
  "Heartbeat": {
    "FailoverStatus": 0,
    "LastDataProcessedTime": "2019-08-24T14:15:22Z",
    "HeartbeatTime": "2019-08-24T14:15:22Z"
  },
  "Role": 0,
  "HeartbeatPosted": true,
  "RoleOverride": 0,
  "RoleOverrideExpirationTime": "2019-08-24T14:15:22Z",
  "AdditionalData": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Get Client Session`

<a id="opIdClientSessions_Get Client Session"></a>

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}/clientsessions/{sessionId}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/><br/>`string sessionId`
<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ClientSession](#schemaclientsession)|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|
|404|[ErrorResponse](#schemaerrorresponse)|None|

<h4>Example response body</h4>

> 200 Response ([ClientSession](#schemaclientsession))

```json
{
  "Id": "string",
  "Name": "string",
  "Heartbeat": {
    "FailoverStatus": 0,
    "LastDataProcessedTime": "2019-08-24T14:15:22Z",
    "HeartbeatTime": "2019-08-24T14:15:22Z"
  },
  "Role": 0,
  "HeartbeatPosted": true,
  "RoleOverride": 0,
  "RoleOverrideExpirationTime": "2019-08-24T14:15:22Z",
  "AdditionalData": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Delete Client Session`

<a id="opIdClientSessions_Delete Client Session"></a>

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}/clientsessions/{sessionId}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/><br/>`string sessionId`
<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|
|404|[ErrorResponse](#schemaerrorresponse)|None|

---

## `Post Heartbeat Message`

<a id="opIdClientSessions_Post Heartbeat Message"></a>

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}/clientsessions/{sessionId}/heartbeat
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/><br/>`string sessionId`
<br/><br/>

<h4>Request Body</h4>

<br/>

```json
{
  "FailoverStatus": 0,
  "LastDataProcessedTime": "2019-08-24T14:15:22Z",
  "HeartbeatTime": "2019-08-24T14:15:22Z"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[FailoverResponse](#schemafailoverresponse)|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|
|404|[ErrorResponse](#schemaerrorresponse)|None|
|429|[ErrorResponse](#schemaerrorresponse)|None|

<h4>Example response body</h4>

> 200 Response ([FailoverResponse](#schemafailoverresponse))

```json
{
  "Role": 0,
  "LastDataProcessedTime": "2019-08-24T14:15:22Z"
}
```

---

## `Post Role Override`

<a id="opIdClientSessions_Post Role Override"></a>

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/clientfailover/groups/{groupId}/clientsessions/{sessionId}/roleoverride
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string groupId`
<br/><br/>`string sessionId`
<br/><br/>

<h4>Request Body</h4>

<br/>

```json
{
  "Value": 0,
  "ExpirationPeriod": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[RoleOverrideResponse](#schemaroleoverrideresponse)|None|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|
|404|[ErrorResponse](#schemaerrorresponse)|None|

<h4>Example response body</h4>

> 200 Response ([RoleOverrideResponse](#schemaroleoverrideresponse))

```json
{
  "Value": 0,
  "RoleOverrideExpirationTime": "2019-08-24T14:15:22Z"
}
```

---
## Definitions

### ClientSession

<a id="schemaclientsession"></a>
<a id="schema_ClientSession"></a>
<a id="tocSclientsession"></a>
<a id="tocsclientsession"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|None|
|Name|string|false|true|None|
|Heartbeat|[IFailoverHeartbeat](#schemaifailoverheartbeat)|false|true|None|
|Role|[ClientRole](#schemaclientrole)|false|false|None|
|HeartbeatPosted|boolean|false|false|None|
|RoleOverride|[RoleOverride](#schemaroleoverride)|false|false|None|
|RoleOverrideExpirationTime|date-time|false|true|None|
|AdditionalData|object|false|true|None|

```json
{
  "Id": "string",
  "Name": "string",
  "Heartbeat": {
    "FailoverStatus": 0,
    "LastDataProcessedTime": "2019-08-24T14:15:22Z",
    "HeartbeatTime": "2019-08-24T14:15:22Z"
  },
  "Role": 0,
  "HeartbeatPosted": true,
  "RoleOverride": 0,
  "RoleOverrideExpirationTime": "2019-08-24T14:15:22Z",
  "AdditionalData": {
    "property1": null,
    "property2": null
  }
}

```

---

### IFailoverHeartbeat

<a id="schemaifailoverheartbeat"></a>
<a id="schema_IFailoverHeartbeat"></a>
<a id="tocSifailoverheartbeat"></a>
<a id="tocsifailoverheartbeat"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|FailoverStatus|float|false|false|None|
|LastDataProcessedTime|date-time|false|true|None|
|HeartbeatTime|date-time|false|false|None|

```json
{
  "FailoverStatus": 0,
  "LastDataProcessedTime": "2019-08-24T14:15:22Z",
  "HeartbeatTime": "2019-08-24T14:15:22Z"
}

```

---

### ClientRole

<a id="schemaclientrole"></a>
<a id="schema_ClientRole"></a>
<a id="tocSclientrole"></a>
<a id="tocsclientrole"></a>

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Secondary|0||
|Primary|1||
|PendingPrimary|2||

---

### RoleOverride

<a id="schemaroleoverride"></a>
<a id="schema_RoleOverride"></a>
<a id="tocSroleoverride"></a>
<a id="tocsroleoverride"></a>

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Off|0||
|Primary|1||

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

### ClientSessionConfiguration

<a id="schemaclientsessionconfiguration"></a>
<a id="schema_ClientSessionConfiguration"></a>
<a id="tocSclientsessionconfiguration"></a>
<a id="tocsclientsessionconfiguration"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|None|
|Name|string|false|true|None|

```json
{
  "Id": "string",
  "Name": "string"
}

```

---

### FailoverResponse

<a id="schemafailoverresponse"></a>
<a id="schema_FailoverResponse"></a>
<a id="tocSfailoverresponse"></a>
<a id="tocsfailoverresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Role|[ClientRole](#schemaclientrole)|false|false|None|
|LastDataProcessedTime|date-time|false|true|None|

```json
{
  "Role": 0,
  "LastDataProcessedTime": "2019-08-24T14:15:22Z"
}

```

---

### FailoverHeartbeat

<a id="schemafailoverheartbeat"></a>
<a id="schema_FailoverHeartbeat"></a>
<a id="tocSfailoverheartbeat"></a>
<a id="tocsfailoverheartbeat"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|FailoverStatus|float|false|false|None|
|LastDataProcessedTime|date-time|false|true|None|
|HeartbeatTime|date-time|false|false|None|

```json
{
  "FailoverStatus": 0,
  "LastDataProcessedTime": "2019-08-24T14:15:22Z",
  "HeartbeatTime": "2019-08-24T14:15:22Z"
}

```

---

### RoleOverrideResponse

<a id="schemaroleoverrideresponse"></a>
<a id="schema_RoleOverrideResponse"></a>
<a id="tocSroleoverrideresponse"></a>
<a id="tocsroleoverrideresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|[RoleOverride](#schemaroleoverride)|false|false|None|
|RoleOverrideExpirationTime|date-time|false|true|None|

```json
{
  "Value": 0,
  "RoleOverrideExpirationTime": "2019-08-24T14:15:22Z"
}

```

---

### RoleOverrideConfiguration

<a id="schemaroleoverrideconfiguration"></a>
<a id="schema_RoleOverrideConfiguration"></a>
<a id="tocSroleoverrideconfiguration"></a>
<a id="tocsroleoverrideconfiguration"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Value|[RoleOverride](#schemaroleoverride)|false|false|None|
|ExpirationPeriod|time-span|false|true|None|

```json
{
  "Value": 0,
  "ExpirationPeriod": "string"
}

```

---

