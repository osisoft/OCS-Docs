---
uid: event-graphql-api-graph-ql

---

# Graph QL
The GraphQL Asp.net Core controller.

## `Graph QL Get`

<a id="opIdGraphQL_Graph QL Get"></a>

Executes a GraphQL Query or Mutation based on the query arguments of a GET request.<br>            It returns a **GraphQLResponse** in JSON format. The format of the response varies depending on the request.<br>            For more details specific to GraphQL, see the GraphQL POST method (it is the recommended approach for working with GraphQL).

<h3>Request</h3>

```text 
GET /api/v1.0-preview/tenants/{tenantId}/namespaces/{namespaceId}/graphql
?graphql={graphql}&variables={variables}&operationName={operationName}&continuation={continuation}&metrics={metrics}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string graphql`
<br/>The GraphQL query or mutation.<br/><br/>
`[optional] string variables`
<br/>One or more named variables and their values that support the query. This is a serialized Dictionary<string, object?>. The **object** is the variable value and can be a scalar or any supported schema type or type collection (serialized JSON).<br/><br/>`[optional] string operationName`
<br/>The name of the operation.<br/><br/>`[optional] string continuation`
<br/>Additional data for querying the next page of data. Use this when the GraphQL response has a continuation token in its extension data.<br/><br/>`[optional] boolean metrics`
<br/>Enables collection of metrics. These are added to the GraphQL response in its extension data.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[IGraphQLResponse](#schemaigraphqlresponse)|Received and processed. GraphQL always returns a 200 response unless the request is unprocessable.  <br>            Errors are returned in the **GraphQLResponse** errors collection.  <br>            If the error collection is not empty, then all or part of the operation failed. See the POST method for possible error codes.|
|400|[ErrorResponse](#schemaerrorresponse)|None|

<h4>Example response body</h4>

> 200 Response

```json
{
  "data": {
    "events": {
      "upsertAlarm": [
        {
          "id": "alarm_0001"
        }
      ]
    }
  },
  "errors": [
    {
      "message": "Optimistic concurrency error",
      "path": [
        "Alarm[id: alarm_0002]"
      ],
      "extensions": {
        "code": "OPTIMISTIC_CONCURRENCY_ERROR"
      },
      "data": {
        "id": "alarm_0002"
      }
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

## `Graph QL Post`

<a id="opIdGraphQL_Graph QL Post"></a>

Executes a GraphQL Query or Mutation based on the **GraphQLRequest** body content in a POST request.<br>            The query or mutation will run against a loaded GraphQL schema that defines all the Types and API's available for an ADH namespace.<br>            The request **query** property contains the GraphQL query or mutation.<br>            The request **variables** property can be used to pass named values into a query or mutation. The value can be a scalar or any schema defined type or type collection (serialized JSON).<br>            It returns a **GraphQLResponse** in JSON format. The format of the response varies depending on the request.

<h3>Request</h3>

```text 
POST /api/v1.0-preview/tenants/{tenantId}/namespaces/{namespaceId}/graphql
?continuation={continuation}&metrics={metrics}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string continuation`
<br/>Additional data for querying the next page of data. Use this when the GraphQL query response has a continuation token in its extension data.<br/><br/>`[optional] boolean metrics`
<br/>Enables collection of metrics. These are added to the GraphQL response in its extension data.<br/><br/>

<h4>Request Body</h4>

A **GraphQLRequest** that represents a query or mutation.<br/>

```json
{
  "query": "query ($varinput1: Int!) { referenceData { queryAlarmSeverityCat ( where: { severity: { gt: $varinput1 } } options: { sort: { severity: DESC }, count: 2 } ) { id color severity } } }",
  "variables": {
    "varinput1": 1
  }
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[IGraphQLResponse](#schemaigraphqlresponse)|Received and processed. GraphQL always returns a 200 response unless the request is unprocessable.  <br>            Errors are returned in the **GraphQLResponse** errors collection.  <br>            If the error collection is not empty, then all or part of the operation failed.<br>             <br>            The following lists possible error codes for **ANY** operations...<br>              - SYSTEM_ERROR (same as Http 500)<br>              - GRAPHSTORE_SYSTEM_ERROR (same as Http 500)<br>              - OPERATION_CANCELED (same as Http 502)<br>              - SERVICE_UNAVAILABLE_ERROR (same as Http 503)<br>              - VALIDATION_ERROR (same as Http 400) - see the error message for more details<br>              - COMPLEXITY (same as Http 400) - see the error message for more details<br>            <br>            The following lists possible error codes for **QUERY** operations...<br>              - SYNTAX_ERROR (same as Http 400) - there may be other GraphQL specific codes for these, but all are syntax errors<br>              - VALIDATION_WARNING (same as Http 200, but all data may not have been returned) - see the error message for more details<br>            <br>            The following lists possible error codes for **UPSERT** operations...        <br>              - OPTIMISTIC_CONCURRENCY_ERROR  (same as Http 412)<br>              - FORBIDDEN_ERROR  (same as Http 403)<br>              - TOPLEVEL_NODE_LIMIT_EXCEEDED (same as Http 400)<br>              - TOTAL_NODE_LIMIT_EXCEEDED (same as Http 429) - this can often be retried if you reduce the total nodes<br>              - REQUEST_TIME_EXCEEDED (same as Http 429) - this can often be retried if you reduce the total nodes<br>            <br>            The following lists possible error codes for **DELETE** operations...<br>              - NOT_FOUND_ERROR (same as Http 404)<br>              - CONFLICT_ERROR (same as Http 409)<br>              - TOPLEVEL_NODE_LIMIT_EXCEEDED (same as Http 400)|
|400|[ErrorResponse](#schemaerrorresponse)|None|
|413|Inline|Payload Too Large. The max request body size is 3276800 bytes.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "data": {
    "referenceData": {
      "queryAlarmSeverityCat": [
        {
          "id": "critical",
          "color": "red",
          "severity": 2
        },
        {
          "id": "notice",
          "color": "blue",
          "severity": 8
        }
      ]
    }
  },
  "errors": null,
  "extensions": {
    "continuation": "eyJJZCI6IjdhZGNkMzEwYzIxYjQ4MmM4MGRiZjQ4OTE3ZWZiM2FlIiwiVHlwZUlkIjoiQWxhcm1FdmVudFR5cGUifQ%3d%3d"
  }
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
## Definitions

### IGraphQLResponse

<a id="schemaigraphqlresponse"></a>
<a id="schema_IGraphQLResponse"></a>
<a id="tocSigraphqlresponse"></a>
<a id="tocsigraphqlresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Data|any|false|false|None|
|Errors|[[GraphQLError](#schemagraphqlerror)]|false|true|None|
|Extensions|[Map](#schemamap)|false|true|None|

```json
{
  "Data": null,
  "Errors": [
    {
      "Locations": [
        {
          "Column": 0,
          "Line": 0
        }
      ],
      "Message": "string",
      "Path": {
        "_items": [
          null
        ],
        "_size": 0,
        "Capacity": 0,
        "Count": 0,
        "Item": null
      },
      "Extensions": {}
    }
  ],
  "Extensions": {}
}

```

---

### GraphQLError

<a id="schemagraphqlerror"></a>
<a id="schema_GraphQLError"></a>
<a id="tocSgraphqlerror"></a>
<a id="tocsgraphqlerror"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Locations|[[GraphQLLocation](#schemagraphqllocation)]|false|true|None|
|Message|string|false|false|None|
|Path|[ErrorPath](#schemaerrorpath)|false|true|None|
|Extensions|[Map](#schemamap)|false|true|None|

```json
{
  "Locations": [
    {
      "Column": 0,
      "Line": 0
    }
  ],
  "Message": "string",
  "Path": {
    "_items": [
      null
    ],
    "_size": 0,
    "Capacity": 0,
    "Count": 0,
    "Item": null
  },
  "Extensions": {}
}

```

---

### GraphQLLocation

<a id="schemagraphqllocation"></a>
<a id="schema_GraphQLLocation"></a>
<a id="tocSgraphqllocation"></a>
<a id="tocsgraphqllocation"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Column|integer|false|false|None|
|Line|integer|false|false|None|

```json
{
  "Column": 0,
  "Line": 0
}

```

---

### ErrorPath

<a id="schemaerrorpath"></a>
<a id="schema_ErrorPath"></a>
<a id="tocSerrorpath"></a>
<a id="tocserrorpath"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|_items|[any]|false|false|None|
|_size|int32|false|false|None|
|Capacity|int32|false|false|None|
|Count|int32|false|false|None|
|Item|any|false|false|None|

```json
{
  "_items": [
    null
  ],
  "_size": 0,
  "Capacity": 0,
  "Count": 0,
  "Item": null
}

```

---

### Map

<a id="schemamap"></a>
<a id="schema_Map"></a>
<a id="tocSmap"></a>
<a id="tocsmap"></a>

```json
{}

```

---

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

### GraphQLRequest

<a id="schemagraphqlrequest"></a>
<a id="schema_GraphQLRequest"></a>
<a id="tocSgraphqlrequest"></a>
<a id="tocsgraphqlrequest"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationName|string|false|true|None|
|Query|string|false|true|None|
|Variables|[Inputs](#schemainputs)|false|true|None|
|Extensions|[Inputs](#schemainputs)|false|true|None|

```json
{
  "OperationName": "string",
  "Query": "string",
  "Variables": {},
  "Extensions": {}
}

```

---

### Inputs

<a id="schemainputs"></a>
<a id="schema_Inputs"></a>
<a id="tocSinputs"></a>
<a id="tocsinputs"></a>

```json
{}

```

---

