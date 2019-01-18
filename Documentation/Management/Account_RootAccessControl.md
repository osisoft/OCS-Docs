---
uid: AccountRootAccessControl
---

# Root Access Control

APIs to manage default access to entities governed by an [AccessControl](xref:accessControl).

***

## `GetRootNamespaceAcl()`

Retrieves the [AccessControl](xref:accessControl) that is used to authorize access to a `Namespace` if none is specified during creation.

### Http

`GET api/Tenants/{tenantId}/AccessControl/Namespaces`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account to access.


### Security

A root [AccessControl](xref:accessControl) can only be retrieved if the current principal has Read access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | AccessControlList | Returns the root [AccessControl](xref:accessControl) for `Namespaces`. | 
| 400 | Nothing is returned | Could not retrieve the root [AccessControl](xref:accessControl) for `Namespaces` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to retrieve the root [AccessControl](xref:accessControl) for `Namespaces`. | 


***
## `SetRootNamespaceAcl()`

Modifies the [AccessControl](xref:accessControl) that is used to authorize access to a `Namespace` if none is specified during creation.

### Http

`PUT api/Tenants/{tenantId}/AccessControl/Namespaces`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier of the account to modify.
```csharp
[Required]
[FromBody]
AccessControlList newAccessControlList
```

The new root [AccessControl](xref:accessControl) for `Namespaces`.


### Security

A root [AccessControl](xref:accessControl) can only be modified if the current principal has ManageAccessControl access.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | AccessControlList | Returns the modified root [AccessControl](xref:accessControl) for `Namespaces`. | 
| 400 | Nothing is returned | Could not modify the root [AccessControl](xref:accessControl) for `Namespaces` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to change the root [AccessControl](xref:accessControl) for `Namespaces`. | 


***
