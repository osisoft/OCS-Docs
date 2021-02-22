---
uid: operationsResource_Usage_Data
---

# Resource Usage Data

APIs related to querying Resource Usage Data


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

## `Get Tenant Resource Usage`

Gets the current resource usage vs the entitled resource usage.

### Request

`GET api/v1/tenants/{tenantId}/resources/usage`

### Parameters

```csharp
[Required]
string tenantId
```

Id of the Tenant

### Security

Allowed for these roles:

- `Account Member`

### Returns

#### 200

Success

##### Type:

 `ResourceUsage`

```json
{
  "StreamCount": 0,
  "EntitledStreamCount": 0,
  "NamespaceCount": 0,
  "EntitledNamespaceCount": 0,
  "EntitledStreamAccessCount": 0
}
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 500

Internal server error
***

