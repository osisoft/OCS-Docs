---
uid: operations-usage

---

# Usage
APIs related to querying usage data

## `List Namespace Usage`

<a id="opIdQuery_List Namespace Usage"></a>

Returns namespace usage data, based on active and completed billing cycles, and whether start and end parameters are provided or omitted. When start is provided and end is omitted, a single day of usage data is returned. When both start and end are provided, daily usage data is returned for the range provided.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/usage
?start={start}&end={end}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/>
`[optional] string start`
<br/>Start date of the range for daily usage data<br/><br/>`[optional] string end`
<br/>End date of the range for daily usage data<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[UsageDataRecord](#schemausagedatarecord)[]|Usage data for the requested namespace|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|None|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

```json
[
  {
    "Date": "2019-08-24T14:15:22Z",
    "TenantId": "string",
    "NamespaceId": "string",
    "ClusterRegion": "string",
    "IngressEvents": 0,
    "IngressStreamsAccessed": 0,
    "EgressEvents": 0,
    "EgressStreamsAccessed": 0
  }
]
```

---

## `Get Tenant Resource Usage`

<a id="opIdQuery_Get Tenant Resource Usage"></a>

Returns the current rather than the entitled resource usage.

### Request
```text 
GET /api/v1/tenants/{tenantId}/resources/usage
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[ResourceUsage](#schemaresourceusage)|Current rather than entitled resource usage.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|None|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

```json
{
  "StreamCount": 0,
  "EntitledStreamCount": 0,
  "NamespaceCount": 0,
  "EntitledNamespaceCount": 0,
  "EntitledStreamAccessCount": 0
}
```

---

## `List Tenant Billing Cycles`

<a id="opIdQuery_List Tenant Billing Cycles"></a>

Returns the billing cycles for an account inferred from the account subscription.

### Request
```text 
GET /api/v1/tenants/{tenantId}/subscriptionterm/billingcycles
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[BillingCycle](#schemabillingcycle)[]|List of elapsed billing cycles for an account subscription|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|None|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

```json
[
  {
    "StartDate": "2019-08-24T14:15:22Z",
    "EndDate": "2019-08-24T14:15:22Z"
  }
]
```

---

## `List Tenant Usage`

<a id="opIdQuery_List Tenant Usage"></a>

Returns tenant usage data, based on active/completed billing cycles, and whether start and end parameters are provided or omitted. When start is provided and end is omitted, a single day of usage data is returned. When both start and end are provided, daily usage data is returned for the range provided.

### Request
```text 
GET /api/v1/tenants/{tenantId}/usage
?start={start}&end={end}&groupByNamespace={groupByNamespace}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>
`[optional] string start`
<br/>Start date of the range for daily usage data<br/><br/>`[optional] string end`
<br/>End date of the range for daily usage data; if no end date is provided, only one summary is returned.<br/><br/>`[optional] boolean groupByNamespace`
<br/>Selection to order usage data by namespace<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[UsageDataRecord](#schemausagedatarecord)[]|Usage data for the requested tenant|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|None|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
> 200 Response

```json
[
  {
    "Date": "2019-08-24T14:15:22Z",
    "TenantId": "string",
    "NamespaceId": "string",
    "ClusterRegion": "string",
    "IngressEvents": 0,
    "IngressStreamsAccessed": 0,
    "EgressEvents": 0,
    "EgressStreamsAccessed": 0
  }
]
```

---
## Definitions

### UsageDataRecord

<a id="schemausagedatarecord"></a>
<a id="schema_UsageDataRecord"></a>
<a id="tocSusagedatarecord"></a>
<a id="tocsusagedatarecord"></a>

Usage within OCS

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Date|date-time|true|false|The date property of a usage record|
|TenantId|guid|true|false|The tenant identifier of a usage record|
|NamespaceId|string|false|true|The namespace identifier of a usage record|
|ClusterRegion|string|false|true|The cluster region for the record|
|IngressEvents|int64|true|false|The count of events ingressed for a usage record|
|IngressStreamsAccessed|int64|true|false|The count of ingress streams accessed for a usage record|
|EgressEvents|int64|true|false|The count of events egressed for a usage record|
|EgressStreamsAccessed|int64|true|false|The count of egress streams accessed for a usage record|

```json
{
  "Date": "2019-08-24T14:15:22Z",
  "TenantId": "string",
  "NamespaceId": "string",
  "ClusterRegion": "string",
  "IngressEvents": 0,
  "IngressStreamsAccessed": 0,
  "EgressEvents": 0,
  "EgressStreamsAccessed": 0
}

```

---

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

Object used to represent error information.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|OperationId of action that caused the error|
|Error|string|false|true|Error description|
|Reason|string|false|true|Reason for the error|
|Resolution|string|false|true|The resolution of the error|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string"
}

```

---

### ResourceUsage

<a id="schemaresourceusage"></a>
<a id="schema_ResourceUsage"></a>
<a id="tocSresourceusage"></a>
<a id="tocsresourceusage"></a>

Resources currently allocated by an account and their entitled amounts

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|StreamCount|int64|true|false|Streams allocated by the account across all namespaces|
|EntitledStreamCount|int64|true|false|Number of streams entitled to be allocated|
|NamespaceCount|int64|true|false|Number of namespaces allocated by the account|
|EntitledNamespaceCount|int64|true|false|Number of namespaces entitled to be allocated|
|EntitledStreamAccessCount|int64|true|false|Average number of streams entitled to be accessed per day|

```json
{
  "StreamCount": 0,
  "EntitledStreamCount": 0,
  "NamespaceCount": 0,
  "EntitledNamespaceCount": 0,
  "EntitledStreamAccessCount": 0
}

```

---

### BillingCycle

<a id="schemabillingcycle"></a>
<a id="schema_BillingCycle"></a>
<a id="tocSbillingcycle"></a>
<a id="tocsbillingcycle"></a>

Represents a completed billing cycle for an account.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|StartDate|date-time|true|false|Start of the billing cycle.|
|EndDate|date-time|true|false|End of the billing cycle|

```json
{
  "StartDate": "2019-08-24T14:15:22Z",
  "EndDate": "2019-08-24T14:15:22Z"
}

```

---

