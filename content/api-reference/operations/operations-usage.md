---
uid: operations-usage

---

# Usage
APIs related to querying usage data.

## `List Tenant Usage 1`

<a id="opIdQuery_List Tenant Usage 1"></a>

Returns tenant usage data, based on `groupBy` value, start and end dates. It computes the active/completed billing cycles based on whether start and end parameters are provided or omitted. When start is provided and end is omitted, a single day of usage data is returned. When both start and end are provided, daily usage data is returned for the range provided. Default results are grouped with `groupBy` value as "None".

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/usage
?start={start}&end={end}&groupBy={groupBy}&groupByNamespace={groupByNamespace}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>
`[optional] string start`
<br/>Start date of the range for daily usage data.<br/><br/>`[optional] string end`
<br/>End date of the range for daily usage data; if no end date is provided, only one summary is returned.<br/><br/>`[optional] any groupBy`
<br/>Selector `UsageGroupBy` to group usage records on namespace, community, all(both namespace and community), or none.<br/><br/>`[optional] boolean groupByNamespace`
<br/>Selection to order usage data by namespace. This parameter is deprecated, use `groupBy` to group the records.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[UsageDataRecord](#schemausagedatarecord)[]|Usage data for the requested tenant.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|None|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([UsageDataRecord](#schemausagedatarecord)[])

```json
[
  {
    "Date": "2019-08-24T14:15:22Z",
    "TenantId": "string",
    "CalleeTenantId": "string",
    "CallerTenantId": "string",
    "CommunityId": "string",
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

## `List Tenant Usage (communities path)`

<a id="opIdQuery_List Tenant Usage (communities path)"></a>

Returns community usage data for a specified tenant. It computes the active/completed billing cycles based on whether start and end parameters are provided or omitted. When start is provided and end is omitted, a single day of usage data is returned. When both start and end are provided, daily usage data is returned for the range provided. Default results are grouped with `groupBy` value as "None".

<h3>Request</h3>

```text 
GET /api/v1/communities/{communityId}/tenants/{tenantId}/usage
?start={start}&end={end}&groupBy={groupBy}&source={source}
```

<h4>Parameters</h4>

`string communityId`
<br/>Community identifier.<br/><br/>`string tenantId`
<br/>Tenant identifier.<br/><br/>
`[optional] string start`
<br/>Start date of the range for daily usage data.<br/><br/>`[optional] string end`
<br/>End date of the range for daily usage data; if no end date is provided, only one summary is returned.<br/><br/>`[optional] any groupBy`
<br/>Selector `UsageGroupBy` to group usage records on namespace, community, all(both namespace and community), or none.<br/><br/>`[optional] any source`
<br/>Source of usage records.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[UsageDataRecord](#schemausagedatarecord)[]|Usage data for the requested tenant.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|None|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([UsageDataRecord](#schemausagedatarecord)[])

```json
[
  {
    "Date": "2019-08-24T14:15:22Z",
    "TenantId": "string",
    "CalleeTenantId": "string",
    "CallerTenantId": "string",
    "CommunityId": "string",
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

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/resources/usage
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ResourceUsage](#schemaresourceusage)|Current rather than entitled resource usage.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|None|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([ResourceUsage](#schemaresourceusage))

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

Returns the billing cycles for an account. The billing cycles returned is from Tenant's creation date until now, or last 12 months, whichever is less.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/subscriptionterm/billingcycles
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[BillingCycle](#schemabillingcycle)[]|List of elapsed billing cycles for an account subscription.|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|None|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([BillingCycle](#schemabillingcycle)[])

```json
[
  {
    "StartDate": "2019-08-24T14:15:22Z",
    "EndDate": "2019-08-24T14:15:22Z"
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

Represents resource usage for a given namespace

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Date|date-time|true|false|The date property of a usage record|
|TenantId|guid|false|true|Tenant identifier.|
|CalleeTenantId|guid|true|false|The callee tenant identifier of a usage record|
|CallerTenantId|guid|true|false|The caller tenant identifier of a usage record|
|CommunityId|guid|false|true|The community identifier of a usage record|
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
  "CalleeTenantId": "string",
  "CallerTenantId": "string",
  "CommunityId": "string",
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

<h4>Properties</h4>

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

### UsageGroupBy

<a id="schemausagegroupby"></a>
<a id="schema_UsageGroupBy"></a>
<a id="tocSusagegroupby"></a>
<a id="tocsusagegroupby"></a>

Specifies the grouping mechanism for tenant usage records.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Namespace|0|Group by namespace identifier.|
|Community|1|Group by community identifier.|
|All|2|The union of records grouped by namespace and grouped by community.|
|None|3|No grouping.|

---

### CommunityUsageGroupBy

<a id="schemacommunityusagegroupby"></a>
<a id="schema_CommunityUsageGroupBy"></a>
<a id="tocScommunityusagegroupby"></a>
<a id="tocscommunityusagegroupby"></a>

Specifies the property to group Community-related Usage data on.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|None|0|No grouping.|
|Tenant|1|Group usage data by caller or callee Tenant, depending on whether the usage source is External or Internal, respectively.|

---

### CommunityUsageSource

<a id="schemacommunityusagesource"></a>
<a id="schema_CommunityUsageSource"></a>
<a id="tocScommunityusagesource"></a>
<a id="tocscommunityusagesource"></a>

Specifies the source of Community usage data.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Invalid|0|Default enumeration value. Not supported.|
|Internal|1|The caller's own tenant.|
|External|2|Other tenants accessing the caller's own data.|

---

### ResourceUsage

<a id="schemaresourceusage"></a>
<a id="schema_ResourceUsage"></a>
<a id="tocSresourceusage"></a>
<a id="tocsresourceusage"></a>

Resources currently allocated by an account and their entitled amounts

<h4>Properties</h4>

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

<h4>Properties</h4>

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

