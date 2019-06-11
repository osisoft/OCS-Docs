---
uid: AccountNamespaceTier
---

# Namespace Tiers

An attribute that specifies `Namespace` performance.

## Note

Namespace tiers are only applicatble for version 1-preview. Namespace tiers are removed in version 1. Please remove references to it.

## Properties

For HTTP requests and responses, the NamespaceTier object has the following properties and JSON-serialized body: 

| Property | Type | Description | 
 | --- | --- | ---  | 
| Id | string | Gets or sets unique identifier for this Namespace Tier. | 
| Description | string | Gets or sets description of this Tier. | 
| ThroughputUnits | int32 | Gets or sets the number of throughput units associated with this Tier. | 
| StorageUnits | int32 | Gets or sets the number of Storage units associated with this Tier. | 


```json
{
	"Id": "id",
	"Description": "description",
	"ThroughputUnits": 0,
	"StorageUnits": 0
}
```
***

## `Get Namespace Tier`

Retrieves a Namespace tier associated with a specified id.

### Http

`GET api/v1-preview/NamespaceTiers/{namespaceTierId}`


### Parameters

```csharp
[Required]
[FromRoute]
string namespaceTierId
```

The tier identifier for this request.


### Security

A `NamespaceTier` can be retrieved by an Account Member.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | NamespaceTier | A `NamespaceTier` object with the specified namespaceTierId. | 
| 400 | Nothing is returned | Could not retrieve the specified `NamespaceTier` due to missing or invalid input. | 


***

## `Get All Namespace Tiers`

Retrieves a list of all available namespace tiers.

### Http

`GET api/v1-preview/NamespaceTiers`


### Parameters

This API call does not have any parameters.

### Security

`NamespaceTiers` can be retrieved by an Account Member.

### Returns

| Status Code | Return Type | Description | 
 | --- | --- | ---  | 
| 200 | [NamespaceTier] | Returns a list of `NamespaceTier` objects. | 


***

