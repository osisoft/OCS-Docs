---
uid: event-graphql-api-events

---

# Events
Rest Asp.net Core controller

## `Query Events`

<a id="opIdEvents_Query Events"></a>

Queries one or many events of a specified TypeId from the Graph Storage.<br>            The response will vary based on the TypeId and if you query for a single event (by id), or for many events, or for many events with paging.

<h3>Request</h3>

```text 
GET /api/v1.0-preview/tenants/{tenantId}/namespaces/{namespaceId}/events
?typeId={typeId}&id={id}&fields={fields}&filter={filter}&orderBy={orderBy}&count={count}&continuationToken={continuationToken}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string typeId`
<br/>The event TypeId to query.<br/><br/>
`[optional] string id`
<br/>The id of the event to get. If id is specified, then only the fields optional argument will be processed. Also the response JSON will be a single object and not an array.<br/><br/>`[optional] string fields`
<br/>The names of the fields to be returned separated by spaces. You can specify simple GraphQL syntax for relationships (ex: asset{id}}. If not specified, it defaults to all non-collection properties.<br/><br/>`[optional] string filter`
<br/>The filter to apply to the query.<br/><br/>`[optional] string orderBy`
<br/>The order by directive specifies the field name and either ascending (asc) or descending (desc). The default is asc.<br/><br/>`[optional] integer count`
<br/>The number of events to return. The default is 100 and the max is 2000.<br/><br/>`[optional] string continuationToken`
<br/>Specifies you want a page of data with count events. You must pass an empty token to get the 1st page. The response is different when using paging.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Success.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. See the response body for more details.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. This only applies if an id is specified.|
|503|[ErrorResponse](#schemaerrorresponse)|Service Unavailable. The service may be loading a new schema. Wait a few seconds and retry.|

<h4>Example response body</h4>

> 200 Response

```json
[
  {
    "id": "alarm_0001",
    "startTime": "2023-04-21T05:00:00Z",
    "asset": {
      "id": "AssetId1"
    }
  },
  {
    "id": "alarm_0002",
    "startTime": "2023-04-21T05:04:00Z",
    "asset": {
      "id": "AssetId1"
    }
  }
]
```

> 400 Response ([ErrorResponse](#schemaerrorresponse))

```json
{
  "reason": "string",
  "error": "string",
  "resolution": "string",
  "data": [
    null
  ],
  "childErrors": [
    {
      "StatusCode": 100,
      "Reason": "string",
      "Error": "string",
      "Resolution": "string",
      "Id": "string"
    }
  ]
}
```

---

## `Upsert Events`

<a id="opIdEvents_Upsert Events"></a>

Upserts one or many events of a specified TypeId to the Graph Storage.<br>            If the body contains a JSON array, it upserts many events. If the body contains a single JSON object it upserts one event.<br>            The response will reflect the written JSON.

<h3>Request</h3>

```text 
POST /api/v1.0-preview/tenants/{tenantId}/namespaces/{namespaceId}/events
?typeId={typeId}&fields={fields}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string typeId`
<br/>The event TypeId being added or updated<br/><br/>
`[optional] string fields`
<br/>The names of the fields to be returned separated by spaces. You can specify simple GraphQL syntax for relationships (ex: asset{id}}. If not specified, it defaults to all non-collection properties.<br/><br/>

<h4>Request Body</h4>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Success. All events were upserted. Data is returned. The format of the data will be dependent on the TypeId.|
|207|[ErrorResponse](#schemaerrorresponse)|MultiStatus Result. Data is returned along with errors. The child errors should have the failed top-level Id's and an HttpStatus code.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. All events failed to upsert. The child error(s) should have more information about the reason.|
|413|Inline|Payload Too Large. The max request body size is 3276800 bytes.|
|429|[ErrorResponse](#schemaerrorresponse)|Too many requests. The request count or request time exceeded a limit. This type of error can often be retried if you reduce the number of nodes.|
|503|[ErrorResponse](#schemaerrorresponse)|Service Unavailable. The service may be loading a new schema. Wait a few seconds and retry.|

<h4>Example response body</h4>

> 200 Response

```json
[
  {
    "id": "alarm_0001",
    "startTime": "2023-04-21T05:00:00Z",
    "severityCat": {
      "id": "critical"
    },
    "asset": {
      "id": "AssetId1"
    }
  },
  {
    "id": "alarm_0002",
    "startTime": "2023-04-21T05:04:00Z",
    "severityCat": {
      "id": "notice"
    },
    "asset": {
      "id": "AssetId1"
    }
  }
]
```

> 207 Response

```json
{
  "Reason": "See child errors",
  "Error": "Some of the elements in the request failed.",
  "Data": [
    {
      "id": "alarm_0001",
      "startTime": "2023-04-21T05:00:00Z",
      "severityCat": {
        "id": "critical"
      },
      "asset": {
        "id": "AssetId1"
      }
    }
  ],
  "ChildErrors": [
    {
      "StatusCode": 412,
      "Reason": "OPTIMISTIC_CONCURRENCY_ERROR",
      "Error": "Optimistic concurrency error",
      "Id": "alarm_0002"
    }
  ]
}
```

> 400 Response ([ErrorResponse](#schemaerrorresponse))

```json
{
  "reason": "string",
  "error": "string",
  "resolution": "string",
  "data": [
    null
  ],
  "childErrors": [
    {
      "StatusCode": 100,
      "Reason": "string",
      "Error": "string",
      "Resolution": "string",
      "Id": "string"
    }
  ]
}
```

---

## `Delete Event`

<a id="opIdEvents_Delete Event"></a>

Deletes one event of a specified TypeId from the Graph Storage.

<h3>Request</h3>

```text 
DELETE /api/v1.0-preview/tenants/{tenantId}/namespaces/{namespaceId}/events
?typeId={typeId}&id={id}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string typeId`
<br/>The event TypeId being deleted.<br/><br/>`string id`
<br/>The event id to delete.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|Inline|No Content. The event was deleted.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. Failed to delete. See the response body for more details.|
|404|[ErrorResponse](#schemaerrorresponse)|Client or tenant not found.|
|409|[ErrorResponse](#schemaerrorresponse)|Conflict. Failed to delete because the event is being referenced by a required relationship.|
|503|[ErrorResponse](#schemaerrorresponse)|Service Unavailable. The service may be loading a new schema. Wait a few seconds and retry.|

---
## Definitions

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

event response

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|reason|string|false|true|reason|
|error|string|false|true|error|
|resolution|string|false|true|resolution|
|data|[any]|false|true|data|
|childErrors|[[EventError](#schemaeventerror)]|false|true|Child Errors|

```json
{
  "reason": "string",
  "error": "string",
  "resolution": "string",
  "data": [
    null
  ],
  "childErrors": [
    {
      "StatusCode": 100,
      "Reason": "string",
      "Error": "string",
      "Resolution": "string",
      "Id": "string"
    }
  ]
}

```

---

### EventError

<a id="schemaeventerror"></a>
<a id="schema_EventError"></a>
<a id="tocSeventerror"></a>
<a id="tocseventerror"></a>

Event child error

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|StatusCode|[HttpStatusCode](#schemahttpstatuscode)|false|false|status code|
|Reason|string|false|true|reason|
|Error|string|false|true|error|
|Resolution|string|false|true|resolution|
|Id|string|false|true|top level id|

```json
{
  "StatusCode": 100,
  "Reason": "string",
  "Error": "string",
  "Resolution": "string",
  "Id": "string"
}

```

---

### HttpStatusCode

<a id="schemahttpstatuscode"></a>
<a id="schema_HttpStatusCode"></a>
<a id="tocShttpstatuscode"></a>
<a id="tocshttpstatuscode"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Continue|100|
|SwitchingProtocols|101|
|Processing|102|
|EarlyHints|103|
|OK|200|
|Created|201|
|Accepted|202|
|NonAuthoritativeInformation|203|
|NoContent|204|
|ResetContent|205|
|PartialContent|206|
|MultiStatus|207|
|AlreadyReported|208|
|IMUsed|226|
|MultipleChoices|300|
|Ambiguous|300|
|MovedPermanently|301|
|Moved|301|
|Found|302|
|Redirect|302|
|SeeOther|303|
|RedirectMethod|303|
|NotModified|304|
|UseProxy|305|
|Unused|306|
|TemporaryRedirect|307|
|RedirectKeepVerb|307|
|PermanentRedirect|308|
|BadRequest|400|
|Unauthorized|401|
|PaymentRequired|402|
|Forbidden|403|
|NotFound|404|
|MethodNotAllowed|405|
|NotAcceptable|406|
|ProxyAuthenticationRequired|407|
|RequestTimeout|408|
|Conflict|409|
|Gone|410|
|LengthRequired|411|
|PreconditionFailed|412|
|RequestEntityTooLarge|413|
|RequestUriTooLong|414|
|UnsupportedMediaType|415|
|RequestedRangeNotSatisfiable|416|
|ExpectationFailed|417|
|MisdirectedRequest|421|
|UnprocessableEntity|422|
|Locked|423|
|FailedDependency|424|
|UpgradeRequired|426|
|PreconditionRequired|428|
|TooManyRequests|429|
|RequestHeaderFieldsTooLarge|431|
|UnavailableForLegalReasons|451|
|InternalServerError|500|
|NotImplemented|501|
|BadGateway|502|
|ServiceUnavailable|503|
|GatewayTimeout|504|
|HttpVersionNotSupported|505|
|VariantAlsoNegotiates|506|
|InsufficientStorage|507|
|LoopDetected|508|
|NotExtended|510|
|NetworkAuthenticationRequired|511|

---

