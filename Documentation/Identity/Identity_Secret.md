---
uid: identitySecret
---

# Secret

APIs for creating, getting, updating, and deleting Hybrid Clients


***

## `Get Client Secrets`

This method is obsolete, please use the following instead:
            {tenantId}/ClientCredentialClients/{clientId}/Secrets

### Request

`GET api/v1-preview/Tenants/{tenantId}/Clients/{clientId}/Secret/`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

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

 `List[ClientSecretDto]`

```json
[
  {
    "SecretId": "SecretId",
    "Expiration": "2019-03-06T11:39:54.458818-08:00",
    "Description": "description"
  },
  {
    "SecretId": "SecretId",
    "Expiration": "2019-03-06T11:39:54.4613886-08:00",
    "Description": "description"
  }
]
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

## `Update Client Secret`

This method is obsolete, please use the following instead:
            {tenantId}/ClientCredentialClients/{clientId}/Secrets/{secretId}

### Request

`PUT api/v1-preview/Tenants/{tenantId}/Clients/{clientId}/Secret/{secretId}`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

```csharp
[Required]
string secretId
```

secretId

```csharp
[FromBody]
[Required]
ClientSecretDto secretUpdate
```

secretId

```json
{
  "SecretId": "SecretId",
  "Expiration": "2019-03-06T11:39:54.4707641-08:00",
  "Description": "description"
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `ClientSecretDto`

```json
{
  "SecretId": "SecretId",
  "Expiration": "2019-03-06T11:39:54.4708819-08:00",
  "Description": "description"
}
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Secret, Client, or Tenant not found

#### 500

Internal server error
***

## `Get Hybrid Client Secrets`

Get all secrets for a Hybrid Client

### Request

`GET api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}/Secret/`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

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

 `List[ClientSecretDto]`

```json
[
  {
    "SecretId": "SecretId",
    "Expiration": "2019-03-06T11:39:54.7607538-08:00",
    "Description": "description"
  },
  {
    "SecretId": "SecretId",
    "Expiration": "2019-03-06T11:39:54.7607651-08:00",
    "Description": "description"
  }
]
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

## `Get Hybrid Client Secret`

Get a specific Hybrid Client Secret

### Request

`GET api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}/Secret/{secretId}`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

```csharp
[Required]
string secretId
```

Id of secret

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `ClientSecretDto`

```json
{
  "SecretId": "SecretId",
  "Expiration": "2019-03-06T11:39:54.7611276-08:00",
  "Description": "description"
}
```

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Secret, Client, or Tenant not found

#### 500

Internal server error
***

## `Add Hybrid Client Secret`

Add a new secret for a Hybrid Client

### Request

`POST api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}/Secret/`

### Parameters

```csharp
[Required]
Guid tenantId
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
ClientSecretCreateOrUpdateDto clientSecretCreateOrUpdateDto
```



```json
{
  "Expiration": "2019-03-06T11:39:54.7613924-08:00",
  "Description": "description"
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 201

Created

##### Type:

 `ClientSecretResponseDto`

```json
{
  "ClientSecret": "ClientSecret",
  "SecretId": "SecretId",
  "Expiration": "2019-03-06T11:39:54.7628819-08:00",
  "Description": "description"
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

## `Update Hybrid Client Secret`

Update a Hybrid Client Secret
            Only Secret Description and Secret Expiration Date can be updated

### Request

`PUT api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}/Secret/{secretId}`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

```csharp
[Required]
string secretId
```

secretId

```csharp
[FromBody]
[Required]
ClientSecretCreateOrUpdateDto clientSecretCreateOrUpdateDto
```

secretId

```json
{
  "Expiration": "2019-03-06T11:39:54.7646348-08:00",
  "Description": "description"
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `ClientSecretDto`

```json
{
  "SecretId": "SecretId",
  "Expiration": "2019-03-06T11:39:54.764713-08:00",
  "Description": "description"
}
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Secret, Client, or Tenant not found

#### 500

Internal server error
***

## `Delete Hybrid Client Secret`

Delete a secret from a Hybrid Client

### Request

`DELETE api/v1-preview/Tenants/{tenantId}/HybridClients/{clientId}/Secret/{secretId}`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

```csharp
[Required]
string secretId
```

Id of secret

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 204

Success

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Secret, Client, or Tenant not found

#### 500

Internal server error
***

## `Get Client Credential Client Secrets`

Get all secrets for a Client Credential Client

### Request

`GET api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secret/`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

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

 `List[ClientSecretDto]`

```json
[
  {
    "SecretId": "SecretId",
    "Expiration": "2019-03-06T11:39:54.8710892-08:00",
    "Description": "description"
  },
  {
    "SecretId": "SecretId",
    "Expiration": "2019-03-06T11:39:54.8711103-08:00",
    "Description": "description"
  }
]
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

## `Get Client Credential Client Secret`

Get a specific Client Credential Client Secret

### Request

`GET api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secret/{secretId}`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

```csharp
[Required]
string secretId
```

Id of secret

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `ClientSecretDto`

```json
{
  "SecretId": "SecretId",
  "Expiration": "2019-03-06T11:39:54.8716206-08:00",
  "Description": "description"
}
```

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Secret, Client, or Tenant not found

#### 500

Internal server error
***

## `Add Client Credential Client Secret`

Add a new secret for a Client Credential Client

### Request

`POST api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secret/`

### Parameters

```csharp
[Required]
Guid tenantId
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
ClientSecretCreateOrUpdateDto clientSecretCreateOrUpdateDto
```



```json
{
  "Expiration": "2019-03-06T11:39:54.8719443-08:00",
  "Description": "description"
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 201

Created

##### Type:

 `ClientSecretResponseDto`

```json
{
  "ClientSecret": "ClientSecret",
  "SecretId": "SecretId",
  "Expiration": "2019-03-06T11:39:54.872019-08:00",
  "Description": "description"
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

## `Update Client Credential Client Secret`

Update a Client Credential Client Secret
            Only Secret Description and Secret Expiration Date can be updated

### Request

`PUT api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secret/{secretId}`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

```csharp
[Required]
string secretId
```

secretId

```csharp
[FromBody]
[Required]
ClientSecretCreateOrUpdateDto clientSecretCreateOrUpdateDto
```

secretId

```json
{
  "Expiration": "2019-03-06T11:39:54.8725398-08:00",
  "Description": "description"
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `ClientSecretDto`

```json
{
  "SecretId": "SecretId",
  "Expiration": "2019-03-06T11:39:54.872665-08:00",
  "Description": "description"
}
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Secret, Client, or Tenant not found

#### 500

Internal server error
***

## `Delete Client Credential Client Secret`

Delete a secret from a Client Credential Client

### Request

`DELETE api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}/Secret/{secretId}`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

```csharp
[Required]
string clientId
```

Id of client

```csharp
[Required]
string secretId
```

Id of secret

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 204

Success

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Secret, Client, or Tenant not found

#### 500

Internal server error
***

