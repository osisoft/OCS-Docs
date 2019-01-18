---
uid: AccountClientRole
---

# Client Roles

Client `Roles` authorize API requests made by clients to various OCS features. Clients can be assigned more than one `Role`, but all clients have the Account Member role.

The following are currently available Client `Roles`:
- Account Administrator: Can add, edit, and remove data using APIs except for displays.
- Account Contributor: Can add, edit, and remove data using APIs for displays.
- Account Member: Can read data using most APIs, except displays.
- Account Viewer: Can read data using APIs for displays.

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

Assigns a `Role` to a specified client.

### Http

`PUT api/Tenants/{tenantId}/Clients/{clientId}/Roles/{roleId}`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account in which the client belongs to.
```csharp
[Required]
string clientId
```

The identifier of the client who will be given the role.
```csharp
[Required]
string roleId
```

The identifier of the `Role` to be assigned.


### Security

A `Role` can only be assigned to a client by an Account Administrator.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | Role | Returns the `Role` with the specified roleId. | 
| 400 | Nothing is returned | Could not assign `Role` to client due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to add a `Role` to this client. | 
| 404 | Nothing is returned | The client was not found in the specified `Tenant`. | 


***
## `ReplaceClientRoles()`

Replaces the `Roles` of a client with a new list of roles.

### Http

`PUT api/Tenants/{tenantId}/Clients/{clientId}/Roles`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account the client belongs to.
```csharp
[Required]
string clientId
```

The identifier of the client whose roles will be replaced.
```csharp
[Required]
[FromBody]
[Role] roleList
```

List of `Role` objects to set as the Roles for the specified client.


### Security

`Roles` of a client can only be replaced by an Account Administrator.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | [Role] | Returns a list of all `Role` objects assigned to the user specified by clientId after the replacement operation is complete. | 
| 400 | Nothing is returned | Could not replace `Roles` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to replace `Roles` of this client. | 
| 404 | Nothing is returned | The client was not found in the specified `Tenant`. | 


***
## `RemoveRoleFromClient()`

Removes a `Role` from a client.

### Http

`DELETE api/Tenants/{tenantId}/Clients/{clientId}/Roles/{roleId}`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account in which the client belongs to.
```csharp
[Required]
string clientId
```

The identifier of the client whose role will be removed.
```csharp
[Required]
string roleId
```

The identifier of the `Role` to be removed.


### Security

A `Role` can only be removed from a client by an Account Administrator.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 204 | Nothing is returned | The `Role` was removed from the client. | 
| 400 | Nothing is returned | Could not remove the `Role` from the client due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to remove a `Role` from this client. | 
| 404 | Nothing is returned | The client was not found in the specified `Tenant`. | 


***
## `Find()`

Retrieves all `Roles` from a client.

### Http

`GET api/Tenants/{tenantId}/Clients/{clientId}/Roles`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier for the account in which the client belongs to.
```csharp
[Required]
string clientId
```

The identifier of the client whose `Roles` will be retrieved.
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

### Security

`Roles` can be retrieved by an Account Administrator.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | [Role] | Returns a list of `Role` objects belonging to the client with the specified clientId. | 
| 400 | Nothing is returned | Could not retrieve `Roles` from the client due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to retrieve `Roles` from this client. | 
| 404 | Nothing is returned | The client was not found in the specified `Tenant`. | 


***
