---
uid: operationsMetrics
---

# Metrics

APIs related to querying tenant metrics.


***

## Authentication

All endpoints referenced in this documentation require authenticated access. You must set the Authorization header to the access token you retrieved from a successful authentication request.

`Authorization: Bearer <token>`

Requests made without an access token or an invalid/expired token will fail with a 401 Unauthorized response.
Requests made with an access token which does not have the correct permissions (see security subsection on every endpoint) will fail with a 403 Forbidden.
Read [OCS Authentication documentation](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/AUTHENTICATION_README.md) to learn how to authenticate against OCS with the various clients and receive an access token in response.

## Error handling

All responses will have an error message in the body. The exceptions are 200 responses and the 401 Unauthorized response. The error message will appear as follows:

```json
{
    "OperationId": "1b2af18e-8b27-4f86-93e0-6caa3e59b90c", 
    "Error": "Error message.", 
    "Reason": "Reason that caused error.", 
    "Resolution": "Possible solution for the error." 
}
```

If and when contacting OSIsoft support about this error, please provide the OperationId.

## `Get Stream Metrics`

Retrieves metrics related to streams ingress and egress rates for a given namespace.

### Request

`GET api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metrics/streams/{metricId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of the tenant for this metric.

```csharp
[Required]
string namespaceId
```

Id of the namespace for this metric.

```csharp
[Required]
string metricId
```

**EgressEvents** for events egressed over time, or **IngressEvents** for incoming events over time.

```csharp
[FromQuery]
[Required]
DateTime start
```

Start date of the metric results to return.

```csharp
[FromQuery]
[Required]
DateTime end
```

End date of the metric results to return.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `List`

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

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 404

Metric Not Found

#### 403

Forbidden

#### 500

Internal server error
***

## `Get OMF Connection Metrics`
<!--Get OMF Metrics-->
Retrieves metrics related to OMF ingress rates for a given namespace.
<!--Or, Retrieves metrics related to OMF data collection for a given namespace-->

### Request

`GET api/v1/tenants/{tenantId}/namespaces/{namespaceId}/metrics/topics/{metricId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of the tenant for this metric.

```csharp
[Required]
string namespaceId
```

Id of the namespace for this metric.

```csharp
[Required]
string metricId
```

**MessagesReceived** for received messages over time, or **MessagesRejected** for rejected messages over time.

```csharp
[FromQuery]
[Required]
DateTime start
```

Start date of the metric results to return.

```csharp
[FromQuery]
[Required]
DateTime end
```

End date of the metric results to return.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `List`

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

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 404

Metric Not Found

#### 403

Forbidden

#### 500

Internal server error

***
