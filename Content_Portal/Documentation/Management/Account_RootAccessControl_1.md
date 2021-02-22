---
uid: AccountRootAccessControl_1
---

# Root Access Control

APIs to manage default access to entities governed by an [AccessControlList](xref:accessControl).

***

## `Get Root Namespace AccessControlList`

Retrieves the [AccessControlList](xref:accessControl) that is used to authorize access to a `Namespace` if none is specified during creation.

### HTTP

`GET api/v1/Tenants/{tenantId}/AccessControl/Namespaces`


### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the tenant to access.


### Security

A root [AccessControlList](xref:accessControl) can only be retrieved if the current principal has Read access.

### Returns

| Status Code | Return Type | Description |
| --- | --- | ---  |
| 200 | AccessControlList | Returns the root [AccessControlList](xref:accessControl) for `Namespaces`. |
| 400 | Nothing is returned | Could not retrieve the root [AccessControlList](xref:accessControl) for `Namespaces` due to missing or invalid input. |
| 403 | Nothing is returned | Unauthorized to retrieve the root [AccessControlList](xref:accessControl) for `Namespaces`. |


***

## `Set Root AccessControlList`

Modifies the [AccessControlList](xref:accessControl) that is used to authorize access to a `Namespace` if none is specified during creation.

### Http

`PUT api/v1/Tenants/{tenantId}/AccessControl/Namespaces`


### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the tenant to modify.
```csharp
[Required]
[FromBody]
AccessControlList newAccessControlList
```

The new root [AccessControlList](xref:accessControl) for `Namespaces`.


### Security

A root [AccessControlList](xref:accessControl) can only be modified if the current principal has ManageAccessControl access.

### Returns

| Status Code | Return Type | Description |
| --- | --- | ---  |
| 200 | AccessControlList | Returns the modified root [AccessControlList](xref:accessControl) for `Namespaces`. |
| 400 | Nothing is returned | Could not modify the root [AccessControlList](xref:accessControl) for `Namespaces` due to missing or invalid input. |
| 403 | Nothing is returned | Unauthorized to change the root [AccessControlList](xref:accessControl) for `Namespaces`. |
| 405 | Nothing is returned | Method not allowed at this base URL. Try the request again at the Global base URL. |


***

