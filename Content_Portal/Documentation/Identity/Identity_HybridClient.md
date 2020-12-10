---
uid: identityHybridClient
---

# HybridClient

Hybrid clients are used in typical, thick MVC clients with the presence of a User.
            These clients are issued an Id and Secret upon creation, which are later used for authentication
            against OSIsoft Cloud Services. More than one Secret can be created for a Client. You can read more about these clients
            [here](https://github.com/osisoft/OSI-Samples-OCS/tree/master/basic_samples/Authentication#hybrid-flow).
            Hybrid clients can be issued refresh tokens, if requested, alongside access tokens. Refresh tokens typically
            have an longer lifetime than access tokens, and are used to request a new access token on behalf of the user
            without them having to sign-in.
            It is highly suggested that both the Client Secret and the refresh token be stored
            in a secure location.

## Properties

For HTTP requests and responses, the HybridClient object has the following properties and JSON-serialized body: 

Property Name | Data Type | Description
 --- | --- | ---
AllowOfflineAccess | bool | Whether this client can request refresh tokens, by providing the *offline_access* scope.
AllowAccessTokensViaBrowser | bool | Whether this HybridClient is allowed to receive access tokens via the browser. This is useful to harden flows that allow multiple response types (for example, by disallowing a hybrid flow client that is supposed to use code *id_token* to add the *token* response type, thus leaking the token to the browser).
RedirectUris | string[] | The allowed URIs to which return tokens or authorization codes can be returned. Wildcards are ignored. URIs must match exactly what you are redirecting to after login. If URIs do not match, the authentication process will fail with a bad_client error. Maximum 10 per client.
PostLogoutRedirectUris | string[] | Allowed URIs to redirect to after logout. Wildcards are ignored. URIs must match exactly what you are redirecting to after logout. Maximum 10 for client.
ClientUri | string | URI to a page with information about client (used on consent screen).
LogoUri | string | URI to client logo (used on consent screen).
Id | string | Secret Id.
Name | string | Name of Client.
Enabled | bool | Whether client is enabled. Client can be used for authentication if set to true. Client cannot be used for authentication if set to false.
AccessTokenLifetime | int32 | Lifetime of access token issued for this client after authentication. Minimum 60 seconds. Maximum 3600 seconds. Defaults to 3600 seconds.
Tags | string[] | For OSIsoft internal use only.

### Serialized Model

```json
{
  "AllowOfflineAccess": false,
  "AllowAccessTokensViaBrowser": false,
  "RedirectUris": [
    "String",
    "String"
  ],
  "PostLogoutRedirectUris": [
    "String",
    "String"
  ],
  "ClientUri": "ClientUri",
  "LogoUri": "LogoUri",
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
Read [here](https://github.com/osisoft/OSI-Samples-OCS/tree/master/basic_samples/Authentication) on how to authenticate against OCS with the various clients and receive an access token in response.

## Error Handling

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

## `Create Hybrid Client`

Create a Hybrid Client. A Client Id and Client Secret will be generated to perform
            authentication. Make sure to store the Secret somewhere safe as we do not store the
            actual value after the creation step. If you do not have access to the Secret value, we suggest
            deleting the Secret and adding a new one for this Client. Clients have unique ids in a Tenant.
            Currently there is a limit of 50000 clients (of all types) per Tenant.

### Request

`POST api/v1/Tenants/{tenantId}/HybridClients`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[FromBody]
[Required]
HybridClientCreate hybridClientCreate
```

HybridClientCreate object.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
SecretDescription | string | No | Description for the initial secret for the client.
SecretExpirationDate | DateTime | No | Expiration date for the initial secret for the client. If set to null the secret will            never expire. We advise against such practice.
AllowOfflineAccess | bool | No | Whether this client can request refresh tokens, by providing the *offline_access* scope.
AllowAccessTokensViaBrowser | bool | No | Whether this HybridClient is allowed to receive access tokens via the browser.            This is useful to harden flows that allow multiple response types (for example, by disallowing a hybrid flow            client that is supposed to use code *id_token* to add the *token* response type, thus            leaking the token to the browser).
RedirectUris | string[] | No | The allowed URIs to which return tokens or authorization codes can be returned.            Wildcards are ignored. URIs must match exactly what you are redirecting to            after login. If URIs do not match, the authentication process will fail            with a bad_client error.            Maximum 10 per client.
PostLogoutRedirectUris | string[] | No | Allowed URIs to redirect to after logout. Wildcards are ignored.            URIs must match exactly what you are redirecting to after logout.            Maximum 10 for client.
ClientUri | string | No | URI to a page with information about client (used on consent screen).
LogoUri | string | No | URI to client logo (used on consent screen).
Id | string | No | Client ID for this client. This ID should be a GUID.
Name | string | Yes | Name of Client.
Enabled | bool | No | Whether client is enabled. Client can be used for authentication            if set to true. Client cannot be used for authentication if set to false.
AccessTokenLifetime | int32 | No | Lifetime of access token issued for this client after authentication.            Minimum 60 seconds. Maximum 3600 seconds. Defaults to 3600 seconds.
Tags | string[] | No | For OSIsoft internal use only.



```json
{
  "SecretDescription": "description",
  "SecretExpirationDate": "2020-03-30T15:34:23.0602036-07:00",
  "AllowOfflineAccess": false,
  "AllowAccessTokensViaBrowser": false,
  "RedirectUris": [
    "String",
    "String"
  ],
  "PostLogoutRedirectUris": [
    "String",
    "String"
  ],
  "ClientUri": "ClientUri",
  "LogoUri": "LogoUri",
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

 `HybridClientCreateResponse`

```json
{
  "Secret": "Secret",
  "Id": 0,
  "Description": "description",
  "ExpirationDate": "2020-03-30T15:34:23.0724603-07:00",
  "Client": {
    "AllowOfflineAccess": false,
    "AllowAccessTokensViaBrowser": false,
    "RedirectUris": [
      "String",
      "String"
    ],
    "PostLogoutRedirectUris": [
      "String",
      "String"
    ],
    "ClientUri": "ClientUri",
    "LogoUri": "LogoUri",
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

Missing or invalid inputs, or Client limit exceeded.

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

## `Update Hybrid Client`

Update a Hybrid Client. It can take up to one hour
            for these values to manifest in the authentication process.

### Request

`PUT api/v1/Tenants/{tenantId}/HybridClients/{clientId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
string clientId
```

Id of Client.

```csharp
[FromBody]
[Required]
HybridClient hybridClient
```

HybridClient object. Properties that are not set or are null will not be changed.

Property Name | Data type | Required | Description 
 --- | --- | --- | ---
AllowOfflineAccess | bool | No | Whether this client can request refresh tokens, by providing the *offline_access* scope.
AllowAccessTokensViaBrowser | bool | No | Whether this HybridClient is allowed to receive access tokens via the browser.            This is useful to harden flows that allow multiple response types (for example, by disallowing a hybrid flow            client that is supposed to use code *id_token* to add the *token* response type, thus            leaking the token to the browser).
RedirectUris | string[] | No | The allowed URIs to which return tokens or authorization codes can be returned.            Wildcards are ignored. URIs must match exactly what you are redirecting to            after login. If URIs do not match, the authentication process will fail            with a bad_client error.            Maximum 10 per client.
PostLogoutRedirectUris | string[] | No | Allowed URIs to redirect to after logout. Wildcards are ignored.            URIs must match exactly what you are redirecting to after logout.            Maximum 10 for client.
ClientUri | string | No | URI to a page with information about client (used on consent screen).
LogoUri | string | No | URI to client logo (used on consent screen).
Id | string | No | Client ID for this client. This ID should be a GUID.
Name | string | Yes | Name of Client.
Enabled | bool | No | Whether client is enabled. Client can be used for authentication            if set to true. Client cannot be used for authentication if set to false.
AccessTokenLifetime | int32 | No | Lifetime of access token issued for this client after authentication.            Minimum 60 seconds. Maximum 3600 seconds. Defaults to 3600 seconds.
Tags | string[] | No | For OSIsoft internal use only.



```json
{
  "AllowOfflineAccess": false,
  "AllowAccessTokensViaBrowser": false,
  "RedirectUris": [
    "String",
    "String"
  ],
  "PostLogoutRedirectUris": [
    "String",
    "String"
  ],
  "ClientUri": "ClientUri",
  "LogoUri": "LogoUri",
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

 `HybridClient`

```json
{
  "AllowOfflineAccess": false,
  "AllowAccessTokensViaBrowser": false,
  "RedirectUris": [
    "String",
    "String"
  ],
  "PostLogoutRedirectUris": [
    "String",
    "String"
  ],
  "ClientUri": "ClientUri",
  "LogoUri": "LogoUri",
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

Client or Tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

## `Get Hybrid Client`

Get a Hybrid Client from a Tenant.

### Request

`GET api/v1/Tenants/{tenantId}/HybridClients/{clientId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
string clientId
```

Id of Client.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `HybridClient`

```json
{
  "AllowOfflineAccess": false,
  "AllowAccessTokensViaBrowser": false,
  "RedirectUris": [
    "String",
    "String"
  ],
  "PostLogoutRedirectUris": [
    "String",
    "String"
  ],
  "ClientUri": "ClientUri",
  "LogoUri": "LogoUri",
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

Client or Tenant not found.

#### 500

Internal server error.
***

## `Get All Hybrid Clients`

Get a list of Hybrid clients from a Tenant.
            Optionally, get a list of requested clients. Total number
            of clients in the Tenant set in the Total-Count header.

### Request

`GET api/v1/Tenants/{tenantId}/HybridClients`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] id
```

Unordered list of Hybrid Client Ids. Empty, whitespace or null Ids will be ignored.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] tag
```

Only return Clients that have these tags.

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

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `List`

```json
[
  {
    "AllowOfflineAccess": false,
    "AllowAccessTokensViaBrowser": false,
    "RedirectUris": [
      "String",
      "String"
    ],
    "PostLogoutRedirectUris": [
      "String",
      "String"
    ],
    "ClientUri": "ClientUri",
    "LogoUri": "LogoUri",
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
    "AllowOfflineAccess": false,
    "AllowAccessTokensViaBrowser": false,
    "RedirectUris": [
      "String",
      "String"
    ],
    "PostLogoutRedirectUris": [
      "String",
      "String"
    ],
    "ClientUri": "ClientUri",
    "LogoUri": "LogoUri",
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

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant not found.

#### 500

Internal server error.
***

## `Delete Hybrid Client`

Delete a Hybrid Client. It can take up to one hour
            for deletion to manifest in the authentication process. Access
            tokens issued to this Client will be valid until their expiration.
            Refresh tokens issued to this will be valid up to one hour after deletion.

### Request

`DELETE api/v1/Tenants/{tenantId}/HybridClients/{clientId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
string clientId
```

Id of Client.

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

Client or Tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

## `Get Header for Hybrid Client`

Validate that a Hybrid Client exists.
            This endpoint is identical to the GET one but
            it does not return any objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/HybridClients/{clientId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
string clientId
```

Id of Client.

### Security

Allowed for these roles:

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

Client or Tenant not found.

#### 500

Internal server error.
***

## `Get Total Count of Hybrid Clients`

Return total number of Hybrid clients in a Tenant.
            Optionally, check based on a list of requested clients. The
            value will be set in the Total-Count header. This endpoint
            is identical to the GET one but it does not return any objects
            in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/HybridClients`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] id
```

Unordered list of Hybrid Client Ids. Empty, whitespace or null Ids will be ignored.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] tag
```

Only count clients that have these tags.

### Security

Allowed for these roles:

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

Client or Tenant not found.

#### 500

Internal server error.
***

