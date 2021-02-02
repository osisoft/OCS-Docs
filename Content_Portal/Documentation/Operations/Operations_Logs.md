---
uid: operationsLogs
---

# Logs

APIs related to querying logs. A log is a record of events that occur in operation of OCS.


***

## Authentication

All endpoints referenced in this documentation require authenticated access. Authorization header must be set to the access token you retrieved after a successful authentication request.

`Authorization: Bearer <token>`

Requests made without an access token or an invalid/expired token will fail with a 401 Unauthorized response.
Requests made with an access token which does not have the correct permissions (see security subsection on every endpoint) will fail with a 403 Forbidden.
Read [OCS Authentication documentation](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/AUTHENTICATION_README.md) on how to authenticate against OCS with the various clients and receive an access token in response.

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

## `Get Tenant Logs`

Get customer facing logs for a **tenant**.

### Request

`GET api/v1/tenants/{tenantId}/logs`

### Parameters

```csharp
[Required]
string tenantId
```

Id of the tenant.

```csharp
[FromQuery]
[Optional]
[Default = ""]
DateTime start
```

Start timestamp of logs.

```csharp
[FromQuery]
[Optional]
[Default = ""]
DateTime end
```

End timestamp of logs.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] source
```

Filter the logs by one or more sources. This parameter
                can be repeated multiple times. Valid sources are:
                *Account Management* and *Identity Management*.
                Omit this parameter to retrieve all sources.

```csharp
[FromQuery]
[Optional]
[Default = ""]
SeverityLevel[] severity
```

Filter the logs by one or more severities. This parameter
                can be repeated multiple times. Valid severities are:
                *Critical*, *Error*, *Warning*, *Information*, and *Verbose*.
                Omit this parameter to retrieve all severities.

```csharp
[FromQuery]
[Optional]
[Default = 0]
int32 skip
```

Number of logs to skip.

```csharp
[FromQuery]
[Optional]
[Default = 1000]
int32 count
```

Maximum number of logs to return.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `List`

```json
[
  {
    "Message": "Message",
    "Timestamp": "2020-03-25T12:03:15.041014-07:00",
    "Severity": 0,
    "Source": "Source",
    "OperationId": "OperationId",
    "EventId": 0
  },
  {
    "Message": "Message",
    "Timestamp": "2020-03-25T12:03:15.0436848-07:00",
    "Severity": 0,
    "Source": "Source",
    "OperationId": "OperationId",
    "EventId": 0
  }
]
```

#### 400

Missing or invalid inputs.

#### 401

Unauthorized

#### 403

Forbidden.

#### 500

Internal server error.
***

## `Get Namespace Logs`

Get logs for a **Namespace**.

### Request

`GET api/v1/tenants/{tenantId}/namespaces/{namespaceId}/logs`

### Parameters

```csharp
[Required]
string tenantId
```

Id of the tenant.

```csharp
[Required]
string namespaceId
```

Id of the namespace.

```csharp
[FromQuery]
[Optional]
[Default = ""]
DateTime start
```

Start timestamp of logs.

```csharp
[FromQuery]
[Optional]
[Default = ""]
DateTime end
```

End timestamp of logs.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] source
```

Filter the logs by one or more sources. This parameter
                can be repeated multiple times. Valid sources are:
                *Data Ingress*, *Data Storage*, *Data Views*, *Metadata*, *PI to OCS*.
                Omit this parameter to retrieve all sources.

```csharp
[FromQuery]
[Optional]
[Default = ""]
SeverityLevel[] severity
```

Filter the logs by one or more severities. This parameter
                can be repeated multiple times. Valid severities are:
                *Critical*, *Error*, *Warning*, *Information*, and *Verbose*.
                Omit this parameter to retrieve all severities.

```csharp
[FromQuery]
[Optional]
[Default = 0]
int32 skip
```

Number of logs to skip.

```csharp
[FromQuery]
[Optional]
[Default = 1000]
int32 count
```

Maximum number of logs to return.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `List`

```json
[
  {
    "Message": "Message",
    "Timestamp": "2020-03-25T12:03:15.5643366-07:00",
    "Severity": 0,
    "Source": "Source",
    "OperationId": "OperationId",
    "EventId": 0
  },
  {
    "Message": "Message",
    "Timestamp": "2020-03-25T12:03:15.564347-07:00",
    "Severity": 0,
    "Source": "Source",
    "OperationId": "OperationId",
    "EventId": 0
  }
]
```

#### 400

Missing or invalid inputs.

#### 401

Unauthorized

#### 403

Forbidden.

#### 500

Internal server error.
***

