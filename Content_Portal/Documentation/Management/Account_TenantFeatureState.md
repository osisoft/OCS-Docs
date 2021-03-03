---
uid: AccountTenantFeatureState
---

# Tenant feature states

APIs for managing the feature states of an OCS `Tenant`.

## Properties

For HTTP requests and responses, the TenantFeatureState object has the following properties and JSON-serialized body: 

| Property Name | Data Type | Description |
| --- | --- | ---  |
| TenantId | string | The identifier of the tenant that the TenantFeatureState corresponds to. |
| FeatureId | string | The identifier of the Service that the TenantFeatureState corresponds to. |
| State | int32 | Current state of this TenantFeatureState. |


```json
{
	"TenantId": "tenantid",
	"FeatureId": "featureid",
	"State": 0
}
```
***

## `Get All Tenant Feature States`

Retrieves all instances of `FeatureState` for the specified `Tenant`.

### Request

`GET api/v1/Tenants/{tenantId}/Features`

### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the tenant to access.


### Authorization

Authorized for Tenant Members of the specified tenant.

### Response

| Status Code | Return Type | Description |
| --- | --- | ---  |
| 200 | [FeatureState] | Returns a list of `FeatureState` for the specified `Tenant`. |
| 400 | Nothing is returned | Unable to retrieve `FeatureState` instances due to missing or invalid input. |
| 403 | Nothing is returned | Unauthorized to retrieve `FeatureState` instances for the specified `Tenant`. |


***

## `Get Tenant Feature State`

Retrieves a `FeatureState` with the specified ID from a `Tenant`.

### Request

`GET api/v1/Tenants/{tenantId}/Features/{id}`

### Parameters

```csharp
[Required]
[FromRoute]
string tenantId
```

The identifier of the tenant to access.
```csharp
[Required]
[FromRoute]
string id
```

The identifier of the `FeatureState` to retrieve.


### Authorization

Authorized for Tenant Members of the specified tenant.

### Response

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | FeatureState | Returns the `FeatureState` of the specified tenant. | 
| 400 | Nothing is returned | Unable to retrieve the `FeatureState` due to missing or invalid input. | 
| 403 | Nothing is returned | Unauthorized to retrieve the `FeatureState` of the specified tenant. | 


***

