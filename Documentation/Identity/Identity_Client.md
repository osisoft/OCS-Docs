---
uid: identityClient
---

# Client

APIs for creating, getting, updating, and deleting Clients


***

## `Get Clients`

This method is obsolete, please use the following instead:
            {tenantId}/ClientCredentialClients
            {tenantId}/HybridClients
            {tenantId}/ImplicitClients

### Request

`GET api/v1-preview/Tenants/{tenantId}/Client/`

### Parameters

```csharp
[Required]
Guid tenantId
```

Id of tenant

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
    "Enabled": false
  },
  {
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ],
    "ClientId": "ClientId",
    "Name": "Name",
    "Enabled": false
  }
]
```

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Tenant not found

#### 400

Missing or invalid inputs

#### 500

Internal server error
***

## `Delete Client`

This method is obsolete, please use the following instead:
            {tenantId}/ClientCredentialClients/{clientId}

### Request

`DELETE api/v1-preview/Tenants/{tenantId}/Client/{clientId}`

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

#### 400

Bad Request

#### 500

Internal server error
***

