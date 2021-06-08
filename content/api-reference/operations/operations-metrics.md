---
uid: operationsMetrics
---

# Metrics

APIs related to querying tenant metrics.

***

## `Get Stream Metrics`

Retrieves metrics related to streams ingress and egress rates for a given namespace.

### Request

```text

GET api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metrics/streams/{metricId}`

```

### Parameters

`string tenantId`
Tenant identifier

`string namespaceId`
Namespace identifier

`string metricId`
Metric identifier

**EgressEvents** for events egressed over time, or **IngressEvents** for incoming events over time.


`DateTime start`
Start date of the metric results to return

`DateTime end`
End date of the metric results to return

### Response

| Status Code               | Response Type | Description                                     |
|---------------------------|---------------|-------------------------------------------------|
| 200 OK                    | `List`        | Returns a `list` of metric values               |
| 400 Bad Request           | error         | Request has an error or is invalid              |
| 401 Unauthorized client   | error         | Authentication has failed                       |
| 403 Forbidden             | error         | You are not authorized for this operation       |
| 404 Not Found             | error         | The data view or query does not exist           |
| 500 Internal Server Error | error         | An error occurred while processing the request. |

#### Example response body

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

### Authorization

Allowed for these roles:

- `Tenant Member`
- `Tenant Administrator`

***

## `Get OMF Connection Metrics`
<!--Get OMF Metrics-->
Retrieves metrics related to OMF ingress rates for a given namespace.
<!--Or, Retrieves metrics related to OMF data collection for a given namespace-->

### Request

```text

GET api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metrics/topics/{metricId}`

```

### Parameters

`string tenantId`
Tenant identifier

`string namespaceId`
Namespace identifier

`string metricId`
Metric identifier

**MessagesReceived** for received messages over time, or **MessagesRejected** for rejected messages over time.

`DateTime start`
Start date of the metric results to return

`DateTime end`
End date of the metric results to return

### Response

| Status Code | Response Type | Description |
|--|--|--|
| 200 OK | `List` | Returns a list containing metrics |
| 400 Bad Request | error | Request has an error or is invalid |
| 401 Unauthorized client  | error | Authentication has failed |
| 403 Forbidden | error | You are not authorized for this operation |
| 404 Not Found | error | The data view or query does not exist |
| 500 Internal Server Error | error | An error occurred while processing the request. |

#### Example response body

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

### Authorization

Allowed for these roles:

- `Tenant Member`
- `Tenant Administrator`
