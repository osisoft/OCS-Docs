---
uid: operations-metrics
---

# Metrics

APIs related to querying tenant metrics.

---

## `Get Stream Metrics`

Retrieves metrics related to streams ingress and egress rates for a given namespace.

### Request

```text

GET api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metrics/streams/{metricId}

```

### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/>`string metricId`
<br/>Either **EgressEvents** for events egressed over time, or **IngressEvents** for incoming events over time<br/><br/>`DateTime start`
<br/>Start date of the metric results to return<br/><br/>`DateTime end`
<br/>End date of the metric results to return

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|`List`|Returns a `list` of metric values   |
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|None|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|None|Metric Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|



#### Example response body
> 200 Response

```json
[
  {
    "Timestamp": "2020-05-15T14:38:55.989531-07:00",
    "Value": 0.0
  },
  {
    "Timestamp": "2020-05-15T14:38:55.9925501-07:00",
    "Value": 0.0
  }
]
```

---

## `Get OMF Connection Metrics`
<!--Get OMF Metrics-->
Retrieves metrics related to OMF ingress rates for a given namespace.
<!--Or, Retrieves metrics related to OMF data collection for a given namespace-->

### Request

```text

GET api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metrics/topics/{metricId}

```

### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/>`string metricId`
<br/>Either **MessagesReceived** for received messages over time, or **MessagesRejected** for rejected messages over time<br/><br/>`DateTime start`
<br/>Start date of the metric results to return<br/><br/>`DateTime end`
<br/>End date of the metric results to return

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|`List`|Returns a list containing metrics   |
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs|
|401|None|Unauthorized|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden|
|404|None|Metric Not Found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error|

#### Example response body
>200 Response

```json
[
  {
    "Timestamp": "2020-05-15T14:38:55.989531-07:00",
    "Value": 0.0
  },
  {
    "Timestamp": "2020-05-15T14:38:55.9925501-07:00",
    "Value": 0.0
  }
]
```

---

### Authorization

Allowed for these roles:

- `Tenant Member`
- `Tenant Administrator`

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
|Error|string|false|true| Error description|
|Reason|string|false|true|Reason for the error|
|Resolution|string|false|true|Resolution for the error|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string"
}

```

---
