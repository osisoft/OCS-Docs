---
uid: identityClientCredentialClient
---

# ClientCredentialClient

APIs for creating, getting, updating, and deleting Client Credential Clients

## Properties

For HTTP requests and responses, the ClientCredentialClientDto object has the following properties and JSON-serialized body: 

Property | Type | Descriptions
 --- | --- | ---
RoleIds | Guid[] | List of Roles to be assigned to this client.
ClientId | string | Client ID for this Client
Name | string | Name of ClientDto.
Enabled | optional: bool | Is ClientDto Enabled
Tags | string[] | For OSIsoft internal use only

### Serialized Model

```json
{
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
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

## `Create Client Credential Client`

Create a Client Credential flow Client

### Request

`POST api/v1-preview/Tenants/{tenantId}/ClientCredentialClients`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant

```csharp
[FromBody]
[Required]
ClientCredentialClientCreateDto clientCredentialClientCreateDto
```

New ClientCredentialClientCreateDto object

```json
{
  "SecretDescription": "description",
  "SecretExpirationDate": "2019-04-30T11:35:12.3647771-07:00",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
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

 `ClientCredentialClientResponseDto`

```json
{
  "ClientSecret": "ClientSecret",
  "SecretId": "SecretId",
  "SecretDescription": "description",
  "SecretExpirationDate": "2019-04-30T11:35:12.3673783-07:00",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
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

Missing or invalid inputs, or Client limit exceeded.

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

## `Update Client Credential Client`

Update a Client Credential Client

### Request

`PUT api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}`

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
ClientCredentialClientDto updatedClientCredentialClientDto
```

Updated Client Credential Client values

```json
{
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
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

 `ClientCredentialClientDto`

```json
{
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
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

## `Get Client Credential Client`

Get a Client Credential Client

### Request

`GET api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}`

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
- `Account Member`

### Returns

#### 200

Success

##### Type:

 `ClientCredentialClientDto`

```json
{
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
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

## `Get All Client Credential Clients`

Get all Client Credential Clients

### Request

`GET api/v1-preview/Tenants/{tenantId}/ClientCredentialClients`

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
- `Account Member`

### Returns

#### 200

Success

##### Type:

 `List[ClientCredentialClientDto]`

```json
[
  {
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ],
    "ClientId": "ClientId",
    "Name": "Name",
    "Enabled": false,
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

#### 207

Partial success.

##### Type:

 `MultiStatusResponseDto[List[ClientCredentialClientDto]]`

```json
{
  "OperationId": "OperationId",
  "Error": "Error",
  "Reason": "Reason",
  "ChildErrors": [
    {
      "OperationId": "OperationId",
      "Error": "Error",
      "Reason": "Reason",
      "Resolution": "Resolution",
      "StatusCode": 0,
      "ModelId": {
        "String": "String"
      },
      "TenantId": "00000000-0000-0000-0000-000000000000"
    },
    {
      "OperationId": "OperationId",
      "Error": "Error",
      "Reason": "Reason",
      "Resolution": "Resolution",
      "StatusCode": 0,
      "ModelId": {
        "String": "String"
      },
      "TenantId": "00000000-0000-0000-0000-000000000000"
    }
  ],
  "Data": [
    {
      "RoleIds": [
        "00000000-0000-0000-0000-000000000000",
        "00000000-0000-0000-0000-000000000000"
      ],
      "ClientId": "ClientId",
      "Name": "Name",
      "Enabled": false,
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
      "ClientId": "ClientId",
      "Name": "Name",
      "Enabled": false,
      "Tags": [
        "String",
        "String"
      ]
    }
  ]
}
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

## `Delete Client Credential Client`

Delete a Client Credential Client

### Request

`DELETE api/v1-preview/Tenants/{tenantId}/ClientCredentialClients/{clientId}`

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

