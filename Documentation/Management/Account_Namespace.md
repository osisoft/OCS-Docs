---
uid: AccountNamespace
---

# Namespace

A `Namespace` is a collection of SDS types, streams, and stream views.

Namespace identifiers are unique within an account. Requirements for `Namespace` Ids are the following:
- Must contain 260 characters or fewer
- Must only contain alphanumeric characters, underscores, dashes, spaces, and periods
- Must not contain two consecutive periods
- Must not start or end with a period
- Must not start with two consecutive underscores

## Properties

For HTTP requests and responses, the Namespace object has the following properties and JSON-serialized body: 

| Property | Type | Description | 
 | --- | --- | ---  | 
| Id | string | Name of this Namespace. Unique within a Tenant's Namespaces. | 
| TenantId | string | GUID of the Tenant that this Namespace corresponds to | 
| Region | string | The region that the namespace is provisioned in | 
| Self | string | The namespace's URI | 
| Description | string | Description of this Namespace. | 
| TierId | string | Id of the Tier that this Namespace is associated with. | 
| ThroughputUnits | int32 | Number of Throughput units for this Namespace. | 
| StorageUnits | int32 | Number of Storage units for this Namespace. | 
| State | NamespaceProvisioningState | Current state of this Namespace. | 
| Owner | Trustee | Owner [Trustee](xref:accessControl) of this Namespace. | 
| AccessControl | AccessControlList | The [AccessControl](xref:accessControl) that defines Access Control for this `Namespace` | 


```json
{
	"Id": "id",
	"TenantId": "tenantid",
	"Region": "region",
	"Self": "self",
	"Description": "description",
	"TierId": "tierid",
	"ThroughputUnits": 0,
	"StorageUnits": 0,
	"State": 0,
	"Owner": {
		"Type": 0
	},
	"AccessControl": {
		"RoleTrusteeAccessControlEntries": []
	}
}
```
***

## `GetAll()`

Returns all `Namespaces` owned by the specified `Tenant` that the caller has access to.

### Http

`GET api/Tenants/{tenantId}/Namespaces`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account to access.


### Security

A `Namespace` can only be retrieved if the current principal has Read access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | [Namespace] | Returns a list of all `Namespace` objects for the specified tenantId that the caller has access to. | 
| 400 | Nothing is returned | Could not retrieve `Namespaces` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to access the tenant's `Namespaces`. | 


***
## `GetNamespaceById()`

Returns a `Namespace` with the specified Id.

### Http

`GET api/Tenants/{tenantId}/Namespaces/{namespaceId}`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
string namespaceId
```

The identifier of the `Namespace` to return.


### Security

A `Namespace` can only be retrieved if the current principal has Read access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | Namespace | Returns a `Namespace` object with the specified namespaceId. | 
| 400 | Nothing is returned | Could not retrieve the `Namespace` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to access this `Namespace`. | 
| 404 | Nothing is returned | `Namespace` not found in the specified account. | 


***
## `Create()`

Creates a new `Namespace` in the specified `Tenant`.

### Http

`POST api/Tenants/{tenantId}/Namespaces`

### Parameters

```csharp
[Required]
string tenantId
```

The account identifier where the `Namespace` will be created.
```csharp
[Required]
[FromBody]
Namespace namespaceObj
```

The new `Namespace` to be created.


### Security

A `Namespace` can only be created if the current principal has Write access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 201 | Namespace | Returns the created `Namespace` object. | 
| 400 | Nothing is returned | Could not create the `Namespace` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to create a `Namespace` in this account. | 


***
## `Update()`

Updates `Namespace` information: Description and TierId. The [AccessControl](xref:accessControl) and Owner's [Trustee](xref:accessControl) can only be updated through their own routes.

### Http

`PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
string namespaceId
```

The identifier of the `Namespace` to update.
```csharp
[Required]
[FromBody]
Namespace newProperties
```

The new details to store for the `Namespace`.


### Security

A `Namespace` can only be updated if the current principal has Write access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | Namespace | Returns the updated `Namespace`. | 
| 400 | Nothing is returned | Could not update the `Namespace` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to update the `Namespace`. | 


***
## `Delete()`

Deletes a `Namespace` in the specified `Tenant`.

### Http

`DELETE api/Tenants/{tenantId}/Namespaces/{namespaceId}`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
string namespaceId
```

The identifier of the `Namespace` to delete.


### Security

A `Namespace` can only be deleted if the current principal has Delete access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 204 | Nothing is returned | The `Namespace` was deleted. | 
| 400 | Nothing is returned | Could not delete the `Namespace` due to an invalid state. | 
| 403 | Nothing is returned | Unauthorized to delete the `Namespace`. | 


***
## `GetAccessControl()`

Returns the [AccessControl](xref:accessControl) that is used to authorize access to a `Namespace`.

### Http

`GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/accesscontrol`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
string namespaceId
```

The identifier of the `Namespace` to access.


### Security

An [AccessControl](xref:accessControl) can only be retrieved if the current principal has Read access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | AccessControl | Returns the [AccessControl](xref:accessControl) for the specified `Namespace`. | 
| 400 | Nothing is returned | Could not retrieve the [AccessControl](xref:accessControl) of the specified `Namespace` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to get the [AccessControl](xref:accessControl) for the specified `Namespace`. | 


***
## `SetAccessControl()`

Updates the [AccessControl](xref:accessControl) that is used to authorize access to a `Namespace`.

### Http

`PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}/accesscontrol`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
string namespaceId
```

The identifier of the `Namespace` to access.
```csharp
[Required]
[FromBody]
AccessControlList newAccessControlList
```

The updated [AccessControl](xref:accessControl) for the `Namespace`.


### Security

An [AccessControl](xref:accessControl) can only be updated if the current principal has ManageAccessControl access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | AccessControl | Returns the updated [AccessControl](xref:accessControl). | 
| 400 | Nothing is returned | Could not update the [AccessControl](xref:accessControl) of the specified `Namespace` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to update the [AccessControl](xref:accessControl) for the specified `Namespace`. | 


***
## `GetOwner()`

Returns the Owner's [Trustee](xref:accessControl) for a given `Namespace`.

### Http

`GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/owner`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
string namespaceId
```

The identifier of the `Namespace` to access.


### Security

An Owner's [Trustee](xref:accessControl) can only be retrieved if the current principal has Read access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | Trustee | Returns the Owner's [Trustee](xref:accessControl) of the specified `Namespace`. | 
| 400 | Nothing is returned | Could not retrieve the Owner's [Trustee](xref:accessControl) of the specified `Namespace` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to get the Owner's [Trustee](xref:accessControl) of the specified `Namespace`. | 


***
## `SetOwner()`

Changes the Owner's [Trustee](xref:accessControl) for a given `Namespace`.

### Http

`PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}/owner`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
string namespaceId
```

The identifier of the `Namespace` to access.
```csharp
[Required]
[FromBody]
Trustee newOwner
```

The new Owner's [Trustee](xref:accessControl) of the `Namespace`.


### Security

An Owner's [Trustee](xref:accessControl) can only be changed if the current principal has ManageAccessControl access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | Trustee | Returns the new Owner's [Trustee](xref:accessControl) of the specified `Namespace`. | 
| 400 | Nothing is returned | Could not change the Owner's [Trustee](xref:accessControl) of the specified `Namespace` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to change the Owner's [Trustee](xref:accessControl) of the specified `Namespace`. | 


***
