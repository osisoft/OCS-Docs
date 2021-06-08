---
uid: community-summary
---


# Summary
API that returns the summary information of the community's stream consumption

## `Community Summary Information`

<a id="opIdCommunitySearch_Community Summary Information"></a>

Gets community summary information

### Request
```text 
GET /api/v1-preview/tenants/{tenantId}/communities/{communityId}/summary
```

#### Parameters

`string tenantId`
<br/>Calling tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[CommunitySummaryInformation](#schemacommunitysummaryinformation)|Returns community summary information of type `CommunitySummaryInformation`.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|None|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested tenant or community was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

#### Example response body
> 200 Response

```json
{
  "TotalStreams": 0,
  "StreamsContributed": 0
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Community Administrator</li>
<li>Community Member</li>
<li>Community Moderator</li>
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

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|TotalStreams|int32|false|false|The number of streams that have been contributed to the community by all member tenants, including the calling tenant|
|StreamsContributed|int32|false|false|The number of streams that have been contributed to the community by the calling tenant|

```json
{
  "TotalStreams": 0,
  "StreamsContributed": 0
}

```

---

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

#### Properties

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

