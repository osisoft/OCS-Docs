---
uid: operationsHealth
---

# Health

APIs related to querying OCS Service health states.


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

## `Get Tenant Health`

Get **tenant** health data containing an aggregated health state and a list of services related to the tenant.

### Request

`GET api/v1/tenants/{tenantId}/health`

### Parameters

```csharp
[Required]
string tenantId
```

Id of the Tenant

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `Health`

```json
{
  "HealthState": "Ok",
  "Namespaces": [
    {
      "NamespaceId": "MyNamespace",
      "Region": "WestUS",
      "HealthState": "Ok",
      "Services": [
        {
            "Name": "OMF Ingress",
            "HealthState": "Ok"
        },
        {
            "Name": "PI to OCS",
            "HealthState": "Ok"
        },
        {
            "Name": "Sequential Data Store",
            "HealthState": "Ok"
        }
      ]
    }
  ]
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

