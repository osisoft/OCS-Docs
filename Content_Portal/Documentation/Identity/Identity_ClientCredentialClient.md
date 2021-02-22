---
uid: identityClientCredentialClient
---

# Client Credential Client

Client credential clients are used for machine-to-machine communication without
            the presence of a User. 
            These clients are issued an Id and secret upon creation,
            which are later used for authentication against OSIsoft Cloud Services. More than one secret can be
            created for a client. You can read more about these clients
            [here](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/AUTHENTICATION_README.md#client-credential-flow).
            Because they access resources on OSIsoft Cloud Services, and are not associated to users, these
            clients can be assigned any of the roles in the tenant. We suggest following a
            least privilege strategy when assigning roles to these clients, as they are more
            likely to operate in remote machines with a wider attack surface.

## Properties

For HTTP requests and responses, the ClientCredentialClient object has the following properties and JSON-serialized body: 

Property Name | Data Type | Description
 --- | --- | ---
RoleIds | Guid[] | List of Roles to be assigned to this client. Member role is always required. For security reasons we advise against assigning Admin roles to a client.
Id | string | Secret Id.
Name | string | Name of client.
Enabled | bool | Whether client is enabled. Client can be used for authentication if set to true. Client cannot be used for authentication if set to false.
AccessTokenLifetime | int32 | Lifetime of access token issued for this client after authentication. Minimum 60 seconds. Maximum 3600 seconds. Defaults to 3600 seconds.
Tags | string[] | For or OSIsoft internal use only.

### Serialized model

```json
{
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "Id": "Id",
  "Name": "Name",
  "Enabled": false,
  "AccessTokenLifetime": 0,
  "Tags": [
    "String",
    "String"
  ]
}
```

***

## Authentication

All endpoints referenced in this documentation require authenticated access. Authorization header must be set to the access token you retrieve after a successful authentication request.

`Authorization: Bearer <token>`

Requests made without an access token or an invalid/expired token will fail with a 401 Unauthorized response.
Requests made with an access token which does not have the correct permissions (see security subsection on every endpoint) will fail with a 403 Forbidden.
Read [here](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/AUTHENTICATION_README.md) on how to authenticate against OCS with the various clients and receive an access token in response.

## Error handling

All responses will have an error message in the body. The exceptions are 200 responses and the 401 Unauthorized response. The error message will look as follows:

```json
{
    "OperationId": "1b2af18e-8b27-4f86-93e0-6caa3e59b90c", 
    "Error": "Error message.", 
    "Reason": "Reason that caused error.", 
    "Resolution": "Possible solution for the error." 
}
```

If and when contacting OSIsoft support about this error, please provide the OperationId.

## `Create Client Credential Client`

Create a Client credential client. A Client Id and Client Secret will be generated to perform
            authentication. Make sure to store the secret somewhere safe as we do not store the
            actual value after the creation step. If you do not have access to the secret value, we suggest
            deleting the secret and adding a new one for this client. Clients have unique Ids in a tenant.
            Currently there is a limit of 50000 clients (of all types) per tenant.

### Request

`POST api/v1/Tenants/{tenantId}/ClientCredentialClients`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[FromBody]
[Required]
ClientCredentialClientCreate clientCredentialClientCreate
```

ClientCredentialClientCreate object.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
SecretDescription | string | No | Description for the initial secret for the client. Ensure that this is descriptive enough,            as it will be the only way to distinguish between multiple secrets and their usage for a            client.
SecretExpirationDate | DateTime | No | Expiration date for the initial secret for the client. If set to null the secret will            never expire. We advise against such practice.
RoleIds | Guid[] | Yes | List of Roles to be assigned to this client. Member role is always required.            For security reasons we advise against assigning Admin roles to a client.
Id | string | No | Client ID for this client. This ID should be a GUID.
Name | string | Yes | Name of client.
Enabled | bool | No | Whether client is enabled. Client can be used for authentication            if set to true. Client cannot be used for authentication if set to false.
AccessTokenLifetime | int32 | No | Lifetime of access token issued for this client after authentication.            Minimum 60 seconds. Maximum 3600 seconds. Defaults to 3600 seconds.
Tags | string[] | No | For OSIsoft internal use only.



```json
{
  "SecretDescription": "description",
  "SecretExpirationDate": "2020-03-30T15:34:23.2980074-07:00",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "Id": "Id",
  "Name": "Name",
  "Enabled": false,
  "AccessTokenLifetime": 0,
  "Tags": [
    "String",
    "String"
  ]
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 201

Created.

##### Type:

 `ClientCredentialClientCreateResponse`

```json
{
  "Secret": "Secret",
  "Id": 0,
  "Description": "description",
  "ExpirationDate": "2020-03-30T15:34:23.3017388-07:00",
  "Client": {
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ],
    "Id": "Id",
    "Name": "Name",
    "Enabled": false,
    "AccessTokenLifetime": 0,
    "Tags": [
      "String",
      "String"
    ]
  }
}
```

#### 400

Missing or invalid inputs, or client limit exceeded.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 409

Client Id already exists.

#### 500

Internal server error.
***

## `Update Client Credential Client`

Update a client credential client. It can take up to one hour
            for these values to manifest in the authentication process.

### Request

`PUT api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
string clientId
```

Id of client.

```csharp
[FromBody]
[Required]
ClientCredentialClient updatedClientCredentialClient
```

ClientCredentialClient object. Properties that are not set or are null will not be changed.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
RoleIds | Guid[] | No | List of Roles to be assigned to this client. Member role is always required.            For security reasons we advise against assigning Admin roles to a client.
Id | string | No | Client ID for this client. This ID should be a GUID.
Name | string | Yes | Name of client.
Enabled | bool | No | Whether client is enabled. Client can be used for authentication            if set to true. Client cannot be used for authentication if set to false.
AccessTokenLifetime | int32 | No | Lifetime of access token issued for this client after authentication.            Minimum 60 seconds. Maximum 3600 seconds. Defaults to 3600 seconds.
Tags | string[] | No | For OSIsoft internal use only.



```json
{
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "Id": "Id",
  "Name": "Name",
  "Enabled": false,
  "AccessTokenLifetime": 0,
  "Tags": [
    "String",
    "String"
  ]
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `ClientCredentialClient`

```json
{
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "Id": "Id",
  "Name": "Name",
  "Enabled": false,
  "AccessTokenLifetime": 0,
  "Tags": [
    "String",
    "String"
  ]
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 400

Missing or invalid inputs.

#### 404

Client or tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

## `Get Client Credential Client`

Get a client credential client.

### Request

`GET api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
string clientId
```

Id of client.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `ClientCredentialClient`

```json
{
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "Id": "Id",
  "Name": "Name",
  "Enabled": false,
  "AccessTokenLifetime": 0,
  "Tags": [
    "String",
    "String"
  ]
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Client or tenant not found.

#### 500

Internal server error.
***

## `Get all Client Credential Clients`

Get a list of client credential clients from a tenant.
            Optionally, get a list of requested clients. Total number
            of clients in the tenant set in the Total-Count header.

### Request

`GET api/v1/Tenants/{tenantId}/ClientCredentialClients`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] id
```

Unordered list of client credential client Ids. Empty, whitespace or null Ids will be ignored.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] tag
```

Only return clients that have these tags.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string query
```

Query to execute. Currently not supported.

```csharp
[FromQuery]
[Optional]
[Default = 0]
int32 skip
```

Number of clients to skip. Will be ignored if a list of Ids is passed.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of clients to return. Will be ignored if a list of Ids is passed.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `List`

```json
[
  {
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ],
    "Id": "Id",
    "Name": "Name",
    "Enabled": false,
    "AccessTokenLifetime": 0,
    "Tags": [
      "String",
      "String"
    ]
  },
  {
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ],
    "Id": "Id",
    "Name": "Name",
    "Enabled": false,
    "AccessTokenLifetime": 0,
    "Tags": [
      "String",
      "String"
    ]
  }
]
```

#### 207

Partial success.

##### Type:

 `ClientCredentialClientMultiStatusResponse`

```json
{
  "OperationId": "OperationId",
  "Error": "Error",
  "Reason": "Reason",
  "ChildErrors": [
    {
      "StatusCode": 0,
      "ModelId": "ModelId",
      "OperationId": "OperationId",
      "Error": "Error",
      "Reason": "Reason",
      "Resolution": "Resolution"
    },
    {
      "StatusCode": 0,
      "ModelId": "ModelId",
      "OperationId": "OperationId",
      "Error": "Error",
      "Reason": "Reason",
      "Resolution": "Resolution"
    }
  ],
  "Data": [
    {
      "RoleIds": [
        "00000000-0000-0000-0000-000000000000",
        "00000000-0000-0000-0000-000000000000"
      ],
      "Id": "Id",
      "Name": "Name",
      "Enabled": false,
      "AccessTokenLifetime": 0,
      "Tags": [
        "String",
        "String"
      ]
    },
    {
      "RoleIds": [
        "00000000-0000-0000-0000-000000000000",
        "00000000-0000-0000-0000-000000000000"
      ],
      "Id": "Id",
      "Name": "Name",
      "Enabled": false,
      "AccessTokenLifetime": 0,
      "Tags": [
        "String",
        "String"
      ]
    }
  ]
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant not found.

#### 500

Internal server error.
***

## `Delete Client Credential Client`

Delete a client credential client. It can take up to one hour
            for deletion to manifest in the authentication process. Access
            tokens issued to this client will be valid until their expiration.

### Request

`DELETE api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
string clientId
```

Id of client.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 204

Deleted.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Client or tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

## `Get Header for Client Credential Client`

Validate that a client credential client exists.
            This endpoint is identical to the GET one but
            it does not return any objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/ClientCredentialClients/{clientId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
string clientId
```

Id of client.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `Void`

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Client or tenant not found.

#### 500

Internal server error.
***

## `Get Total Count of Clients`

Return total number of client credential clients in a tenant. Optionally, check based on a list of requested clients. The value will be set in the Total-Count header. This endpoint is identical to the GET one but it does not return any objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/ClientCredentialClients`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] id
```

Unordered list of client credential client Ids. Empty, whitespace or null Ids will be ignored.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] tag
```

Only count clients that have these tags.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `Void`

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Client or tenant not found.

#### 500

Internal server error.
***

