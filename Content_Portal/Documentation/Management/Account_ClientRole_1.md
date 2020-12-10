---
uid: AccountClientRole_1
---

# Client Roles

Client `Roles` authorize API requests made by clients to various OCS features. Clients can be assigned more than one
`Role`, but all clients have the Account Member role. The following are currently available Client `Roles`:
- Account Administrator: Can add, edit, and remove data using APIs.
- Account Member: Can read data using most APIs.


## Properties

For HTTP requests and responses, the ClientRole object has the following properties and JSON-serialized body: 

| Property Name | Data Type | Description | 
 | --- | --- | ---  | 
| ClientId | string | String value that identifies the client. | 
| RoleId | string | String value that identifies the role. | 


```json
{
	"ClientId": "clientid",
	"RoleId": "roleid"
}
```
***

## `Replace Client Roles`

Replaces the `Roles` of a client with a new list of roles.

### Http

`PUT api/v1/Tenants/{tenantId}/Clients/{clientId}/Roles`


### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the account to which the client belongs.
```csharp
[Required]
[FromRoute]
string clientId
```

The identifier of the client whose `Roles` will be replaced.
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
| 405 | Nothing is returned | Method not allowed at this base URL. Try the request again at the Global base URL. | 


***

## `Find Client Roles`

Retrieves all `Roles` from a client.

### Http

`GET api/v1/Tenants/{tenantId}/Clients/{clientId}/Roles`


### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the account to which the client belongs.
```csharp
[Required]
[FromRoute]
string clientId
```

The identifier of the client whose `Roles` will be retrieved.
```csharp
[Optional]
[Default = "0"]
[FromQuery]
int32 skip
```

Number of `Roles` to ignore.
```csharp
[Optional]
[Default = "100"]
[FromQuery]
int32 count
```

Number of `Roles` to return.
```csharp
[Optional]
[Default = ""]
[FromRoute]
string query
```

Unsupported parameter.


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

