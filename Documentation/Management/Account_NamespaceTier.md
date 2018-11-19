---
uid: AccountNamespaceTier
---

# NamespaceTier

An attribute that specifies namespace performance.

## Properties

For HTTP requests and responses, the NamespaceTier object has the following properties and JSON-serialized body: 

| Property | Type | Description | 
 | --- | --- | ---  | 
| Id | string | GUID for this Namespace Tier. | 
| Description | string | Description of this Tier. | 
| ThroughputUnits | int32 | The number of throughput units associated with this Tier. | 
| StorageUnits | int32 | The number of Storage units associated with this Tier. | 


```json
{
	"Id": "id",
	"Description": "description",
	"ThroughputUnits": 0,
	"StorageUnits": 0
}
```
***

## `GetNamespaceTier()`

Retrieves a Namespace tier associated with a specified id

### Http

`GET api/NamespaceTiers/{namespaceTierId}`

### Parameters

```csharp
[Required]
string namespaceTierId
```

The tier identifier for this request


### Security

Allowed by Account Member [Role](xref:AccountRole)

### Returns

A `NamespaceTier` object with the specified namespaceTierId

***
## `GetAllNamespaceTiers()`

Retrieves a list of all available namespace tiers.

### Http

`GET api/NamespaceTiers`

### Parameters

This API call does not have any parameters.

### Security

Allowed by Account Member [Role](xref:AccountRole)

### Returns

An array of `NamespaceTier` objects

***
