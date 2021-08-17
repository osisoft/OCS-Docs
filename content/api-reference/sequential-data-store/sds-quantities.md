---
uid: sds-quantities
---

# Quantities
The REST APIs provide programmatic access to read and write SDS data. 
The APIs in this section interact with `Quantities`.
For more information, see [Quantities](xref:unitsOfMeasure).

## `List Quantities`

<a id="opIdQuantity_List Quantities"></a>

Returns a list of all quantities available within a given namespace

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities?skip={skip}&count={count}
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
|200|[SdsUomQuantity](#schemasdsuomquantity)[]|Returns a list of `SdsUomQuantity` objects|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
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
    "Id":"Angular Velocity",
    "Name":"Angular Velocity",
    "BaseUom":{
        "Id":"radian per second",
        "Abbreviation":"rad/s",
        "Name":"radian per second",
        "DisplayName":"radian per second",
        "QuantityId":"Angular Velocity",
        "ConversionFactor":1
    },
    "Dimensions":[
        0,
        0,
        -1,
        0,
        0,
        0,
        0
    ]
},
{
    "Id":"Area",
    "Name":"Area",
    "BaseUom":{
        "Id":"square meter",
        "Abbreviation":"m2",
        "Name":"square meter",
        "DisplayName":"square meter",
        "QuantityId":"Area",
        "ConversionFactor":1
    },
    "Dimensions":[
        2,
        0,
        0,
        0,
        0,
        0,
        0
    ]
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

## `Get Quantity`

<a id="opIdQuantity_Get Quantity"></a>

Returns the quantity corresponding to the specified quantityId within a given namespace

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsUomQuantity](#schemasdsuomquantity)|Returns the `SdsUomQuantity`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
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
"Id":"Length",
"Name":"Length",
"BaseUom":{
    "Id":"meter",
    "Abbreviation":"m",
    "Name":"meter",
    "DisplayName":"meter",
    "QuantityId":"Length",
    "ConversionFactor":1
},
"Dimensions":[
    1,
    0,
    0,
    0,
    0,
    0,
    0
]
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

## `Get Quantity Unit of Measure`

<a id="opIdQuantity_Get Quantity Unit of Measure"></a>

Returns the unit of measure associated with the specified uomId belonging to the quantity with the specified quantityId

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>`string uomId`
<br/>The unit of measure identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsUom](#schemasdsuom)|Returns the `SdsUom`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
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
    "Id": "mile",
    "Abbreviation": "mi",
    "Name": "mile",
    "DisplayName": "mile",
    "QuantityId": "Length",
    "ConversionFactor": 1609.344
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

## `List Quantity Units of Measure`

<a id="opIdQuantity_List Quantity Units of Measure"></a>

Returns the list of units of measure that belongs to the quantity with the specified quantityId

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsUom](#schemasdsuom)[]|Returns a list of `SdsUom` objects|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
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
    "Id":"milliampere",
    "Abbreviation":"mA",
    "Name":"milliampere",
    "DisplayName":"milliampere",
    "QuantityId":"Electric Current",
    "ConversionFactor":0.001
},
{
    "Id":"ampere",
    "Abbreviation":"A",
    "Name":"ampere",
    "DisplayName":"ampere",
    "QuantityId":"Electric Current",
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
## Definitions

### SdsUomQuantity

<a id="schemasdsuomquantity"></a>
<a id="schema_SdsUomQuantity"></a>
<a id="tocSsdsuomquantity"></a>
<a id="tocssdsuomquantity"></a>

DataContract representing a measurable quantity. i.e. A unit of measure 'meter' would measure a quantity 'length'

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Unique identifier for this quantity.|
|Name|string|false|true|Friendly name for this quantity|
|BaseUom|[SdsUom](#schemasdsuom)|false|true|The base unit of measurement for this quantity. All other uom's measuring this quantity will be calculated relative to the base uom.|
|Dimensions|[integer]|false|true|Powers of each dimension that define this quantity. This array must have a length of 7. Dimensions represented in index order are Length, Mass, Time, Electric Current, Thermodynamic Temperature, Amount of Substance, and Luminous Density i.e. A velocity quantity would have values [1,0,-1,0,0,0,0] for (length)/(time)|

```json
{
  "Id": "string",
  "Name": "string",
  "BaseUom": {
    "Id": "string",
    "Abbreviation": "string",
    "Name": "string",
    "DisplayName": "string",
    "QuantityId": "string",
    "ConversionFactor": 0,
    "ConversionOffset": 0
  },
  "Dimensions": [
    0
  ]
}

```

---

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

