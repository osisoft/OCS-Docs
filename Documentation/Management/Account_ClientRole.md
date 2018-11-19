---
uid: AccountClientRole
---

# ClientRole

APIs to manage client roles.

## Properties

For HTTP requests and responses, the ClientRole object has the following properties and JSON-serialized body: 

| Property | Type | Description | 
 | --- | --- | ---  | 
| ClientId | string | Client Id. | 
| RoleId | string | Role Id. | 


```json
{
	"ClientId": "clientid",
	"RoleId": "roleid"
}
```
***

## `AddRoleToClient()`

Assign a `Role` to a specified client.

### Http

`PUT api/Tenants/{tenantId}/Clients/{clientId}/Roles/{roleId}`

### Parameters

```csharp
[Required]
string tenantId
```

ID of the tenant for this request.
```csharp
[Required]
string clientId
```

ID of the client for this request.
```csharp
[Required]
string roleId
```

ID of the `Role` to be assigned.


### Security

Allowed by Account Administrator [Role](xref:AccountRole)

### Returns

The assigned `Role`.

***
## `ReplaceClientRoles()`

Assign a set of roles to a specified client.

### Http

`PUT api/Tenants/{tenantId}/Clients/{clientId}/Roles`

### Parameters

```csharp
[Required]
string tenantId
```

ID of the tenant the client belongs to.
```csharp
[Required]
string clientId
```

ID of the client for this request
```csharp
[Required]
[FromBody]
[Role] roleList
```

List of `Roles` to be assigned.


### Security

Allowed by Account Administrator [Role](xref:AccountRole)

### Returns

A list of the `Roles` the client now has.

***
## `RemoveRoleFromClient()`

Remove a `Role` specified by its Id.

### Http

`DELETE api/Tenants/{tenantId}/Clients/{clientId}/Roles/{roleId}`

### Parameters

```csharp
[Required]
string tenantId
```

ID of the tenant for this request.
```csharp
[Required]
string clientId
```

ID of the client for this request.
```csharp
[Required]
string roleId
```

ID of the `Role` to be removed.


### Security

Allowed by Account Administrator [Role](xref:AccountRole)

### Returns

HTTP status code - 200 OK if the `Role` was successfully remove.

***
## `Find()`

Get a list of an client's `Roles`.

### Http

`GET api/Tenants/{tenantId}/Clients/{clientId}/Roles`

### Parameters

```csharp
[Required]
string tenantId
```

ID of the tenant for this request.
```csharp
[Required]
string clientId
```

ID of the client for this request
```csharp
[Required]
string skip
```

Number of `Roles` to ignore.
```csharp
[Required]
string count
```

Number of `Roles` to return.
```csharp
[Optional]
[Default = ""]
string query
```

Unsupported parameter.


### Security

Allowed by Account Administrator [Role](xref:AccountRole)

### Returns

List of the specified client's `Roles`.

***
