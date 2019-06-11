---
uid: AccountNamespace
---

# Namespaces

A `Namespace` is a collection of SDS types, streams, and stream views. Namespace identifiers are unique within an account. Requirements for Namespace IDs are the following:
- Must contain 100 characters or fewer
- Must only contain alphanumeric characters, underscores, dashes, spaces, and periods
- Must not contain two consecutive periods
- Must not start or end with a period
- Must not start with two consecutive underscores


## Properties

For HTTP requests and responses, the Namespace object has the following properties and JSON-serialized body: 

### Version 1-Preview

| Property | Type | Description | 
 | --- | --- | ---  | 
| Id | string | Gets or sets name of this Namespace; unique within a Tenant's Namespaces. | 
| TenantId | string | Gets or sets unique identifier of the Tenant that this Namespace corresponds to. **Note:** TenantId will be removed in the next version. Please remove references to it. | 
| Region | string | Gets or sets the region that the namespace is provisioned in. | 
| Self | string | Gets or sets the namespace's URI. | 
| Description | string | Gets or sets description of this Namespace. | 
| TierId | string | Gets or sets id of the Tier that this Namespace is associated with. **Note:** TierId will be removed in the next version. Please remove references to it. | 
| ThroughputUnits | int32 | Gets or sets number of Throughput units for this Namespace. **Note:** ThroughputUnits will be removed in the next version. Please remove references to it. | 
| StorageUnits | int32 | Gets or sets number of Storage units for this Namespace. **Note:** StorageUnits will be removed in the next version. Please remove references to it. | 
| State | NamespaceProvisioningState | Gets or sets current state of this Namespace. | 


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
	"State": 0
}
```
***

### Version 1
| Property | Type | Description | 
 | --- | --- | ---  | 
| Id | string | Gets or sets name of this Namespace; unique within a Tenant's Namespaces. | 
| Region | string | Gets or sets the region that the namespace is provisioned in. | 
| Self | string | Gets or sets the namespace's URI. | 
| Description | string | Gets or sets description of this Namespace. | 
| State | NamespaceProvisioningState | Gets or sets current state of this Namespace. | 


```json
{
	"Id": "id",
	"Region": "region",
	"Self": "self",
	"Description": "description",
	"State": 0
}
```
***

# NamespaceProvisioningState

A `NamespaceProvisioningState` is a status code describing a Namespace's current Provisioning State.

| Value | Description | Meaning |
| --- | --- | ---  |
| 0 | Creating | A Namespace cannot be used until all resources are provisioned successfully.  In this state, the Namespace cannot be used until it transitions to Active. |
| 1 | Active | The required resources for the Namespace have been created. The Namespace is ready for use. |
| 2 | Deleting | The Namespace has been marked for deletion. The Namespace and its resources will be removed and unavailable while in this state. |
| 3 | Deleted | The Namespace has been deleted, along with any resources (e.g. Types and Streams) associated with the Namespace. |
***

## `Get All Namespaces`

Returns all `Namespaces` owned by the specified `Tenant` that the caller has access to.

### Http

`GET api/v1-preview/Tenants/{tenantId}/Namespaces`

`GET api/v1/Tenants/{tenantId}/Namespaces`

### Parameters

```csharp
[Required]
[FromRoute]
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

## `Get Namespace By Id`

Returns a `Namespace` with the specified Id.

### Http

`GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}`

`GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}`

### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
[FromRoute]
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

## `Create New Namespace`

Creates a new `Namespace` in the specified `Tenant`. Currently, there is a limit of five Namespaces per tenant.

### Http

`POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId?}`

`POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId?}`


### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The account identifier where the `Namespace` will be created.
```csharp
[Required]
[FromBody]
Namespace namespaceObj
```

The new `Namespace` to be created.
```csharp
[Optional]
[Default = ""]
[FromRoute]
string namespaceId
```

The Id of the new `Namespace`. The Id can also be specified in the namespace object. If it is omitted in both, the Id will be generated.


### Security

A `Namespace` can only be created if the current principal has Write access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 201 | Namespace | Returns the created `Namespace` object. | 
| 302 | Nothing is returned | Returns the location of the existing `Namespace` object. | 
| 400 | Nothing is returned | Could not create the `Namespace` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to create a `Namespace` in this account. | 
| 409 | Nothing is returned | A `Namespace` already exists with different values. | 


***

## `Update Namespace`

Updates `Namespace` information: Description and TierId. The [AccessControlList](xref:accessControl) and Owner's [Trustee](xref:accessControl) can only be updated through their own routes.

### Http

`PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}`

`PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}`

### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
[FromRoute]
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

## `Delete Namespace`

Deletes a `Namespace` in the specified `Tenant`.

### Http

`DELETE api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}`

`DELETE api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}`

### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
[FromRoute]
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

## `Get Namespace AccessControlList`

Returns the [AccessControlList](xref:accessControl) that is used to authorize access to a `Namespace`.

### Http

`GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/accesscontrol`

`GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/accesscontrol`

### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
[FromRoute]
string namespaceId
```

The identifier of the `Namespace` to access.


### Security

An [AccessControlList](xref:accessControl) can only be retrieved if the current principal has Read access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | AccessControlList | Returns the [AccessControlList](xref:accessControl) for the specified `Namespace`. | 
| 400 | Nothing is returned | Could not retrieve the [AccessControlList](xref:accessControl) of the specified `Namespace` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to get the [AccessControlList](xref:accessControl) for the specified `Namespace`. | 


***

## `Set Namespace AccessControlList`

Updates the [AccessControlList](xref:accessControl) that is used to authorize access to a `Namespace`.

### Http

`PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/accesscontrol`

`PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/accesscontrol`

### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
[FromRoute]
string namespaceId
```

The identifier of the `Namespace` to access.
```csharp
[Required]
[FromBody]
AccessControlList newAccessControlList
```

The updated [AccessControlList](xref:accessControl) for the `Namespace`.


### Security

An [AccessControlList](xref:accessControl) can only be updated if the current principal has ManageAccessControl access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | AccessControlList | Returns the updated [AccessControlList](xref:accessControl). | 
| 400 | Nothing is returned | Could not update the [AccessControlList](xref:accessControl) of the specified `Namespace` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to update the [AccessControlList](xref:accessControl) for the specified `Namespace`. | 


***

## `Get Namespace Owner`

Returns the Owner's [Trustee](xref:accessControl) for a given `Namespace`.

### Http

`GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/owner`

`GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/owner`

### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
[FromRoute]
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

## `Set Namespace Owner`

Changes the Owner's [Trustee](xref:accessControl) for a given `Namespace`.

### Http

`PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/owner`

`PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/owner`

### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the account to access.
```csharp
[Required]
[FromRoute]
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

