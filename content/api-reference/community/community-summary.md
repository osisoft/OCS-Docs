---
uid: community-summary

---

# Summary
API that returns the summary information of the community's stream consumption

## `Community Summary Information`

<a id="opIdCommunitySearch_Community Summary Information"></a>

Gets community summary information. This includes counts regarding the number of streams that have been shared with the community by the caller of this API as well the total number of streams that have been shared with the community by all members.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/communities/{communityId}/summary
?excludeCrossRegions={excludeCrossRegions}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Calling tenant identifier.<br/><br/>`string communityId`
<br/>Community identifier.<br/><br/>
`[optional] boolean excludeCrossRegions`
<br/>A value indicating this request should exclude results from regions that are different from the calling region.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[CommunitySummaryInformation](#schemacommunitysummaryinformation)|Returns community summary information of type `CommunitySummaryInformation`.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|None|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested tenant or community was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

<h4>Example response body</h4>

> 200 Response ([CommunitySummaryInformation](#schemacommunitysummaryinformation))

```json
{
  "TotalStreams": 0,
  "CommunitySummaryInformationForTenants": [
    {
      "TenantId": "string",
      "StreamsContributed": 0
    }
  ]
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Member</li>
<li>Tenant Member</li>
</ul>

---
## Definitions

### CommunitySummaryInformation

<a id="schemacommunitysummaryinformation"></a>
<a id="schema_CommunitySummaryInformation"></a>
<a id="tocScommunitysummaryinformation"></a>
<a id="tocscommunitysummaryinformation"></a>

The CommunitySummaryInformation object. This is the model representation exposed to callers of controller endpoints.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TotalStreams|int32|false|false|The number of streams that have been contributed to the community by all member tenants, including the calling tenant|
|CommunitySummaryInformationForTenants|[[CommunitySummaryInformationForTenant](#schemacommunitysummaryinformationfortenant)]|false|true|A list of per-tenant community summary information objects.|

```json
{
  "TotalStreams": 0,
  "CommunitySummaryInformationForTenants": [
    {
      "TenantId": "string",
      "StreamsContributed": 0
    }
  ]
}

```

---

### CommunitySummaryInformationForTenant

<a id="schemacommunitysummaryinformationfortenant"></a>
<a id="schema_CommunitySummaryInformationForTenant"></a>
<a id="tocScommunitysummaryinformationfortenant"></a>
<a id="tocscommunitysummaryinformationfortenant"></a>

The CommunitySummaryInformationForTenant object. Contains information about the streams contributed to a community by a particular tenant. A list of these objects are part of the CommunitySummaryInformation class.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TenantId|string|false|true|The tenant id of a community member. This is extracted from a stream that is shared with the community.|
|StreamsContributed|int32|false|false|The number of streams that have been contributed to the community by the tenant.|

```json
{
  "TenantId": "string",
  "StreamsContributed": 0
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
|OperationId|string|false|true|OperationId of the action that caused the error|
|Error|string|false|true|Error description|
|Reason|string|false|true|Reason for the error|
|Resolution|string|false|true|Resolution for the Error|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string"
}

```

---

