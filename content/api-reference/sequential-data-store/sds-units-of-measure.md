---
uid: sds-units-of-measure
---

# Units of measure
The REST APIs provide programmatic access to read and write SDS data. The APIs in this section interact with `Units`.
The APIs are for GET (read) methods. Update (write) operations on `Units` go through [Quantities](xref:sds-quantities).
For more information on unit of measure, see [Units of measure](xref:unitsOfMeasure).

## `List Units of Measure`

<a id="opIdUnit_List Units of Measure"></a>

Returns a list of all available units of measure in the system.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Units?skip={skip}&count={count}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>
`[Optional] int skip`  
Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.
<br/><br/>
`[Optional] int count`  
Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.
<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsUom](#schemasdsuom)[]|Returns a list of `SdsUom` objects|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was invalid or missing|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response

```json
HTTP/1.1 200
Content-Type: application/json
[
{
    "Id":"count",
    "Abbreviation":"count",
    "Name":"count",
    "DisplayName":"count",
    "QuantityId":"Quantity",
    "ConversionFactor":1
},
{
    "Id":"Ampere hour",
    "Abbreviation":"Ah",
    "Name":"Ampere hour",
    "DisplayName":"Ampere hour",
    "QuantityId":"Electric Charge",
    "ConversionFactor":3600
},
{
    "Id":"coulomb",
    "Abbreviation":"C",
    "Name":"coulomb",
    "DisplayName":"coulomb",
    "QuantityId":"Electric Charge",
    "ConversionFactor":1
}
]
```
> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---

## `Get Unit of Measure`

<a id="opIdUnit_Get Unit of Measure"></a>

Returns the unit of measure corresponding to the specified uomId within a given namespace.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Units/{uomId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string uomId`
<br/>The unit of measure identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsUom](#schemasdsuom)|Returns the `SdsUom`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was invalid or missing|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response

```json
HTTP/1.1 200
Content-Type: application/json
{
    "Id":"ounce",
    "Abbreviation":"oz",
    "Name":"ounce",
    "DisplayName":"ounce",
    "QuantityId":"Mass",
    "ConversionFactor":0.028349523
}
```
> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

---
## Definitions

### SdsUom

<a id="schemasdsuom"></a>
<a id="schema_SdsUom"></a>
<a id="tocSsdsuom"></a>
<a id="tocssdsuom"></a>

DataContract representing a unit of measure

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Unique identifier for this unit of measure.|
|Abbreviation|string|false|true|Abbreviation for this unit of measure.|
|Name|string|false|true|Full name for this unit of measure.|
|DisplayName|string|false|true|Display name for this unit of measure.|
|QuantityId|string|false|true|The Id of the quantity that this unit is a measure of.|
|ConversionFactor|double|false|false|When a value of this unit is multiplied by the ConversionFactor and then incremented by the ConversionOffset, the value in terms of the base unit of the corresponding quantity is returned.|
|ConversionOffset|double|false|false|When a value of this unit is multiplied by the ConversionFactor and then incremented by the ConversionOffset, the value in terms of the base unit of the corresponding quantity is returned.|

```json
{
  "Id": "string",
  "Abbreviation": "string",
  "Name": "string",
  "DisplayName": "string",
  "QuantityId": "string",
  "ConversionFactor": 0,
  "ConversionOffset": 0
}

```

---

### ErrorResponseBody

<a id="schemaerrorresponsebody"></a>
<a id="schema_ErrorResponseBody"></a>
<a id="tocSerrorresponsebody"></a>
<a id="tocserrorresponsebody"></a>

Contains the error message format that follows the OCS error standards

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Operation unique identifier of action that caused the error|
|Error|string|false|true|Error description|
|Reason|string|false|true|Reason for the error|
|Resolution|string|false|true|Resolution to resolve the error|
|Parameters|object|false|true|IDs or values that are creating or are affected by the error|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}

```

---

