---
uid: operations-logs

---

# Logs
APIs related to querying log data

## `Get Tenant Logs`

<a id="opIdLog_Get Tenant Logs"></a>

Returns logs for a tenant. The source parameter can be repeated multiple times. Valid sources are Account Management and Identity Management. Omit the source parameter to retrieve all sources. The severity parameter can be repeated multiple times. Valid severities are: - Critical - Error - Warning - Information - Verbose Omit the severity parameter to retrieve all severities.

### Request
```text 
GET /api/v1/tenants/{tenantId}/logs
?start={start}&end={end}&source={source}&severity={severity}&skip={skip}&count={count}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>
`[optional] string start`
<br/>Start timestamp of tenant logs<br/><br/>`[optional] string end`
<br/>End timestamp of tenant logs<br/><br/>`[optional] array source`
<br/>One or more valid sources to filter tenant logs<br/><br/>`[optional] array severity`
<br/>One or more severities to filter tenant logs<br/><br/>`[optional] integer skip`
<br/>Number of logs to skip<br/><br/>`[optional] integer count`
<br/>Maximum number of logs to return<br/><br/>

#### Enumerated Values

|Parameter|Value|
|---|---|
|severity|0|
|severity|1|
|severity|2|
|severity|3|
|severity|4|

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Customer facing logs for provided tenant Id|
|400|None|Missing or invalid inputs|
|401|None|Unauthorized|
|403|None|Forbidden|
|500|None|Internal server error|

---

## `Get Namespace Logs`

<a id="opIdLog_Get Namespace Logs"></a>

Returns logs for a namespace. The source parameter can be repeated multiple times. Valid sources are: - Data ingress - Data storage - Data views - Metadata - PI to OCS Omit the source parameter to retrieve all sources. The severity parameter can be repeated multiple times. Valid severities are: - Critical - Error - Warning - Information - Verbose Omit the severity parameter to retrieve all severities.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/logs
?start={start}&end={end}&source={source}&severity={severity}&skip={skip}&count={count}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/>
`[optional] string start`
<br/>Start timestamp of namespace logs<br/><br/>`[optional] string end`
<br/>End timestamp of namespace logs<br/><br/>`[optional] array source`
<br/>One or more sources to filter namespace logs<br/><br/>`[optional] array severity`
<br/>One or more severities to filter namespace logs<br/><br/>`[optional] integer skip`
<br/>Number of logs to skip<br/><br/>`[optional] integer count`
<br/>Maximum number of logs to return<br/><br/>

#### Enumerated Values

|Parameter|Value|
|---|---|
|severity|0|
|severity|1|
|severity|2|
|severity|3|
|severity|4|

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Customer facing logs for provided namespace Id.|
|400|None|Missing or invalid inputs|
|401|None|Unauthorized|
|403|None|Forbidden|
|500|None|Internal server error|

---
## Definitions

### SeverityLevel

<a id="schemaseveritylevel"></a>
<a id="schema_SeverityLevel"></a>
<a id="tocSseveritylevel"></a>
<a id="tocsseveritylevel"></a>

Object describing the Severity Level of customer logs.

#### Enumerated Values

|Property|Value|
|---|---|
|Verbose|0|
|Information|1|
|Warning|2|
|Error|3|
|Critical|4|

---

