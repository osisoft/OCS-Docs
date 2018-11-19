---
uid: AccountNamespace
---

# Namespace

A Namespace is a collection of Data Streams.

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
| AccessControlList | AccessControlList | Access Control List. | 


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
	},
	"AccessControlList": {
		"RoleTrusteeAccessControlEntries": []
	}
}
```
***

## `GetAll()`

Returns all `Namespaces` owned by the specified tenant that the caller has access to.

### Http

`GET api/Tenants/{tenantId}/Namespaces`

### Parameters

```csharp
[Required]
string tenantId
```

The `Tenant` identifier for the request.
```csharp
[Optional]
[Default = ""]
string include
```

An optional parameter specifying which attached properties to include


### Security

A `Namespace` can only be retrieved if the current principal has Read access.

### Returns

An array of all `Namespace` objects for the specified tenantId that the caller has access.

***
## `GetNamespaceById()`

Returns the Namespace with the specified Id.

### Http

`GET api/Tenants/{tenantId}/Namespaces/{namespaceId}`

### Parameters

```csharp
[Required]
string tenantId
```

The account identifier for the request
```csharp
[Required]
string namespaceId
```

The Namespace identifier for this request


### Security

A `Namespace` can only be retrieved if the current principal has Read access.

### Returns

A `Namespace` object with the specified namespaceId

***
## `Create()`

Creates a namespace.

### Http

`POST api/Tenants/{tenantId}/Namespaces`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier for the account the namespace is to be created for.
```csharp
[Required]
[FromBody]
Namespace namespaceObj
```

The `Namespace` to be created.


### Security

A `Namespace` can only be create if the current principal has Write access.

### Returns

The created `Namespace` object

***
## `Update()`

Updates Namespace information - Description, TierId, AccessControl, and Owner.

### Http

`PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of Namespace's Account.
```csharp
[Required]
string namespaceId
```

The identifier for the Namespace to update.
```csharp
[Required]
[FromBody]
Namespace newProperties
```

The new details to store for the Namespace.


### Security

A `Namespace` can only be updated if the current principal has Write access. The [AccessControl](xref:accessControl) and owner [Trustee](xref:accessControl) can only be updated if the current principal has ManageAccessControl access.

### Returns

The updated `Namespace`.

***
## `Delete()`

Deletes a namespace.

### Http

`DELETE api/Tenants/{tenantId}/Namespaces/{namespaceId}`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of namespace's account
```csharp
[Required]
string namespaceId
```

The identifier of the namespace to be deleted


### Security

A `Namespace` can only be deleted if the current principal has Delete access.

### Returns

Nothing is returned.

***
## `GetAccessControl()`

Gets the [AccessControl](xref:accessControl) that is used to authorize access to a `Namespace`.

### Http

`GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/accesscontrol`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account being accessed.
```csharp
[Required]
string namespaceId
```

The identifier of the `Namespace` being accessed.


### Security

The current principal has Read access.

### Returns

The [AccessControl](xref:accessControl) for the `Namespace`.

***
## `SetAccessControl()`

Edits the [AccessControl](xref:accessControl) that is used to authorize access to a `Namespace`.

### Http

`PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}/accesscontrol`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account being modified.
```csharp
[Required]
string namespaceId
```

The identifier of the `Namespace` being modified.
```csharp
[Required]
[FromBody]
AccessControlList newAccessControlList
```

The new [AccessControl](xref:accessControl) for the `Namespace`.


### Security

The current principal has ManageAccessControl access.

### Returns

The updated [AccessControl](xref:accessControl) for the `Namespace`.

***
## `GetOwner()`

Gets the owner for a given `Namespace`.

### Http

`GET api/Tenants/{tenantId}/Namespaces/{namespaceId}/owner`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account being accessed.
```csharp
[Required]
string namespaceId
```

The identifier of the `Namespace` being accessed.


### Security

The current principal has Read access.

### Returns

The owner [Trustee](xref:accessControl) of the `Namespace`.

***
## `SetOwner()`

Changes the owner for a given `Namespace`.

### Http

`PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}/owner`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account being edited.
```csharp
[Required]
string namespaceId
```

The identifier of the `Namespace` being edited.
```csharp
[Required]
[FromBody]
Trustee newOwner
```

The new owner [Trustee](xref:accessControl) for the `Namespace`.


### Security

The current principal has ManageAccessControl access.

### Returns

The new owner [Trustee](xref:accessControl) of the `Namespace`.

***
