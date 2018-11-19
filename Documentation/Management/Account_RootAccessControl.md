---
uid: AccountRootAccessControl
---

# RootAccessControl

Apis to control default access to entities governed by an [AccessControl](xref:accessControl).

***

## `GetRootNamespaceAcl()`

Get the [AccessControl](xref:accessControl) that is used to authorize access to a `Namespace` if none is specified during creation.

### Http

`GET api/Tenants/{tenantId}/AccessControl/Namespaces`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier for the account being accessed.


### Security

`CommonAccessRights.Read`

### Returns

The root [AccessControl](xref:accessControl) for `Namespaces`.

***
## `SetRootNamespaceAcl()`

Set the [AccessControl](xref:accessControl) that is used to authorize access to a `Namespace` if none is specified during creation.

### Http

`PUT api/Tenants/{tenantId}/AccessControl/Namespaces`

### Parameters

```csharp
[Required]
string tenantId
```

The identifier for the account being modified.
```csharp
[Required]
[FromBody]
AccessControlList newAccessControlList
```

The new root [AccessControl](xref:accessControl) for `Namespaces`.


### Security

`CommonAccessRights.ManageAccessControl`

### Returns

The new root [AccessControl](xref:accessControl) for `Namespaces`.

***
