---
uid: identityHybridClient
---

# HybridClient

APIs for creating, getting, updating, and deleting Hybrid Clients

## Properties

For HTTP requests and responses, the HybridClientDto object has the following properties and JSON-serialized body: 

Property | Type | Descriptions
 --- | --- | ---
AllowOfflineAccess | optional: bool | Specifies whether this client can request refresh tokens, by providing the *offline_access* scopes.
AllowAccessTokensViaBrowser | optional: bool | Specifies whether this HybridClientDto is allowed to receive access tokens via the browser. This is useful to harden flows that allow multiple response types (e.g. by disallowing a hybrid flow client that is supposed to use code *id_token* to add the *token* response type, thus leaking the token to the browser).
RedirectUris | string[] | Specifies the allowed URIs to return tokens or authorization codes to.
PostLogoutRedirectUris | string[] | Specifies allowed URIs to redirect to after logout.
ClientUri | string | URI to a page with information about client (used on consent screen).
LogoUri | string | URI to client logo (used on consent screen).
ClientId | string | Client ID for this Client
Name | string | Name of ClientDto.
Enabled | optional: bool | Is ClientDto Enabled
Tags | string[] | For OSIsoft internal use only

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
  "ClientId": "ClientId",
  "Name": "Name",
  "Enabled": false,
  "Tags": [
    "String",
    "String"
  ]
}
```

***

## `Create Hybrid Client`

Create a Hybrid flow Client

### Request

`POST api/v1-preview/Tenants/{tenantId}/HybridClients`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant

```csharp
[FromBody]
[Required]
HybridClientCreateDto hybridClientCreateDto
```

New HybridClientCreateDto object

```json
{
  "SecretDescription": "description",
  "SecretExpirationDate": "2019-04-30T11:35:12.2957095-07:00",
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
  "ClientId": "ClientId",
  "Name": "Name",
  "Enabled": false,
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

Created

##### Type:

 `HybridClientResponseDto`

```json
{
  "ClientSecret": "ClientSecret",
  "SecretId": "SecretId",
  "SecretDescription": "description",
  "SecretExpirationDate": "2019-04-30T11:35:12.2989504-07:00",
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
  "ClientId": "ClientId",
  "Name": "Name",
  "Enabled": false,
  "Tags": [
    "String",
    "String"
  ]
}
```

#### 400

Client Limit exceeded

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Tenant not found

#### 409

Client Id already exists

#### 500

Internal server error
***

## `Update Hybrid Client`

Update a Hybrid Client

### Request

`PUT api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

```csharp
[FromBody]
[Required]
HybridClientDto updatedHybridClientDto
```

Updated Hybrid Client values

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
  "ClientId": "ClientId",
  "Name": "Name",
  "Enabled": false,
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

Success

##### Type:

 `HybridClientDto`

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
  "ClientId": "ClientId",
  "Name": "Name",
  "Enabled": false,
  "Tags": [
    "String",
    "String"
  ]
}
```

#### 401

Unauthorized

#### 403

Forbidden

#### 400

Missing or invalid inputs

#### 404

Client or Tenant not found

#### 500

Internal server error
***

## `Get Hybrid Client`

Get a Hybrid Client

### Request

`GET api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `HybridClientDto`

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
  "ClientId": "ClientId",
  "Name": "Name",
  "Enabled": false,
  "Tags": [
    "String",
    "String"
  ]
}
```

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Client or Tenant not found

#### 500

Internal server error
***

## `Get All Hybrid Clients`

Get all Hybrid Clients

### Request

`GET api/v1-preview/Tenants/{tenantId}/HybridClients`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] tags
```

Only return Clients that have these tags.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string query
```

Query to execute. Currently not supported

```csharp
[FromQuery]
[Optional]
[Default = 0]
int32 skip
```

Number of clients to skip. From query.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Max number of clients to return

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `List[HybridClientDto]`

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
    "ClientId": "ClientId",
    "Name": "Name",
    "Enabled": false,
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
    "ClientId": "ClientId",
    "Name": "Name",
    "Enabled": false,
    "Tags": [
      "String",
      "String"
    ]
  }
]
```

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Tenant not found

#### 500

Internal server error
***

## `Delete Hybrid Client`

Delete an Hybrid Client

### Request

`DELETE api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 204

Deleted

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Client or Tenant not found

#### 500

Internal server error
***

