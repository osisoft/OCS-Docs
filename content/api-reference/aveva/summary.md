---
uid: ""

---

# Summary

## `Get Namespace Summary`

<a id="opIdSummary_Get Namespace Summary"></a>

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/summary/piagents
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AgentResourceSummaryDTO](#schemaagentresourcesummarydto)|None|
|403|[ErrorResponse](#schemaerrorresponse)|None|
|500|[ErrorResponse](#schemaerrorresponse)|None|

<h4>Example response body</h4>

> 200 Response ([AgentResourceSummaryDTO](#schemaagentresourcesummarydto))

```json
{
  "AgentVersion": "string",
  "AgentCount": 0,
  "GoodAgentCount": 0,
  "WarningAgentCount": 0,
  "BadAgentCount": 0,
  "StoppedAgentCount": 0,
  "AgentWithActiveTransferCount": 0,
  "PIPointCount": 0,
  "AFElementCount": 0,
  "PIOnlyAgentCount": 0
}
```

---
## Definitions

### AgentResourceSummaryDTO

<a id="schemaagentresourcesummarydto"></a>
<a id="schema_AgentResourceSummaryDTO"></a>
<a id="tocSagentresourcesummarydto"></a>
<a id="tocsagentresourcesummarydto"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|AgentVersion|string|false|true|None|
|AgentCount|int32|false|false|None|
|GoodAgentCount|int32|false|false|None|
|WarningAgentCount|int32|false|false|None|
|BadAgentCount|int32|false|false|None|
|StoppedAgentCount|int32|false|false|None|
|AgentWithActiveTransferCount|int32|false|false|None|
|PIPointCount|int32|false|false|None|
|AFElementCount|int32|false|false|None|
|PIOnlyAgentCount|int32|false|false|None|

```json
{
  "AgentVersion": "string",
  "AgentCount": 0,
  "GoodAgentCount": 0,
  "WarningAgentCount": 0,
  "BadAgentCount": 0,
  "StoppedAgentCount": 0,
  "AgentWithActiveTransferCount": 0,
  "PIPointCount": 0,
  "AFElementCount": 0,
  "PIOnlyAgentCount": 0
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

