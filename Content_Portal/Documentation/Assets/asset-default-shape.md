---
uid: AssetDefaultShape
---

# Asset Default Shape

A shape describes the consumption-oriented aspects of an OCS resource, rather than describing how the resource is configured. For example, the shape of an asset corresponds to its metadata and measurements which define how the data is interpreted (that is, SdsTypeCode, InterpolationMode, UOM, and names that are meaningful in the context of an asset) rather than how the data is retrieved from the Sequential Data Store (that is, configuration information such as StreamId and TypeId).

***

## `Get Default Shape of an Asset`

Returns the default shape of an asset.

## Default Shape Metadata Value Rules

When an asset references an asset type, the following rules explain how the values are derived for a given `Metadata` value on the default shape.

- If a `Metadata` value with the same `Id` exists on the asset type and asset, the `Metadata` value properties, `Name`, `UOM`, and `SdsTypeCode`, of the asset type take precedence over the asset properties.
- If the `Metadata` value with the same `Id` exists on the asset type and asset, the `Value` property on the asset takes precedence (Example 3) if its value is not null.  
- If the `Value` property on the asset is null, then the `Value` property of the asset type's `Metadata` value is used (Example 2) unless that value is also null. In this instance, the `Value` property on the default shape is zero for shapes whose `SdsTypeCode` is a numeric type, and it is an empty string for shapes whose `SdsTypeCode` is string. (Example 1).
- If the `SdsTypeCode` on the asset and asset type do not match, then the `Value` property of the `Metadata` value on the default shape will be coerced to the `SdsTypeCode` property of the asset type (Examples 7 and 8).
- If the `Metadata` value with the same `Id` exists on the asset and the default shape, but the `Metadata` value does not exist on the asset type, then the asset's `Metadata` value appears on the default shape (Example 4), unless the asset's `Name` property is null. In this instance, the `Metadata` value does not appear on the default shape (Example 5).

### Examples

The examples in the following table illustrate the default shape metadata value rules.

| Example | Metadata value on asset type                          | Metadata value on asset                                      | Metadata value on default shape                           | Details                                                      |
| ------- | ----------------------------------------------------- | ------------------------------------------------------------ | --------------------------------------------------------- | :----------------------------------------------------------- |
| 1       | `Id` ="md_id"<br/> `Name`="**m1**"<br/>  `Value`=null | `Id`="md_id"<br> `Name`=null<br>  `Value`=null               | `Id`="md_id"<br> `Name`="**m1**"<br> ` Value`=See Details | For a numeric `SdsTypeCode`, the value of the `Value` property for **m1** is 0. For a string `SdsTypeCode`, the value of the `Value` property for **m1** is an empty string. For both, the `Metadata` value is returned, along with the `UOM` and `SdsTypeCode`, for the asset type. |
| 2       | `Id`="md_id"<br/> `Name`="**m2**"<br/>  `Value`=10    | `Id`="md_id"<br/> `Name`=null<br/> `Value`=null              | `Id`="md_id"<br/> `Name`="**m2**"<br/>  `Value`=10        | **m2** appears on the default shape with `Value`=10, along with `UOM` and `SdsTypeCode` from the asset type. |
| 3       | `Id`="md_id"<br/> `Name`="**m3**"<br/>  `Value`=10    | `Id`="md_id"<br/> `Name`=null<br/>  `Value`=20               | `Id`="md_id"<br/> `Name`="**m3**"<br/>  `Value`=20        | **m3** appears on the default shape with `Value`=20, along with `UOM` and `SdsTypeCode` from the asset type. The `Value` property on the asset `Metadata` value always overrides the `Value` property on the asset type. |
| 4       | Not present                                           | `Id`="md_id"<br/> `Name`="**m4**"<br/>  `Value`=30           | `Id`="md_id"<br/> `Name`="**m4**"<br/>  `Value`=30        | m4 appears on the default shape with value =30, along with `UOM` and `SdsTypeCode` from the asset. Because this metadata value does not exist on the asset type, the metadata value on the default shape takes the value of the asset. |
| 5       | Not present                                           | `Id`="md_id"<br/> `Name`=null<br/>  `Value`=30               | Not present                                               | Because there is no `Metadata` value with `Id` = "md_id" on the asset type and the name of the `Metadata` value on the asset is null, then this `Metadata` value does not appear on the default shape. |
| 6       | `Id`="md_id"<br/> `Name`="**m6**"<br/>  `Value`=10    | `Id`="md_id"<br/> `Name`="anotherName"<br/>  `Value`="1234"  | `Id`="md_id"<br/> `Name`="**m6**"<br/>  `Value`=10        | The `Metadata` value `Name` with `Id`= "md_id" is not null on the asset. Therefore, the default shape's `Metadata` value takes the  asset type's `Metadata` value. |
| 7       | `Id`="md_id"<br/> `Name`="**m7**"<br/>  `Value`=10    | `Id`="md_id"<br/> `Name`=null<br/>  `Value`="a string value" | `Id`="md_id"<br/> `Name`="**m7**"<br/> ` Value`=0         | The `Metadata` value with `Id`="md_id" has different `SdsTypeCode` on the asset and asset type. Therefore, the default shape's `Metadata` value coerces the overloaded `Value` from the asset to the `SdsTypecode` on the asset type.  It also takes the  `Metadata` value for `UOM` and `SdsTypeCode` from the asset type. |
| 8       | `Id`="md_id"<br/> `Name`="**m9**"<br/> ` Value`=10    | `Id`="md_id"<br/> `Name`=null<br/> ` Value`="1.23"           | `Id`="md_id"<br/> `Name`="**m9**"<br/>  `Value`=1         | The `Metadata` value with `Id`="md_id" has a different `SdsTypeCode` on the asset and asset type. Therefore, the default shape's `Metadata` value coerces the overloaded `Value` from the asset to the `SdsTypecode` on the asset type. It also takes the  `Metadata` value for `UOM` and `SdsTypeCode` from the asset type. |

### Default Shape Reference Rules

The following example illustrates the default shape reference rules. If an asset references an asset type, the the following rules apply for a given reference:

Assume that the following is true for the asset and asset type:

- `Id`="reference1" is defined for both the asset and the asset type. The asset type has measurement mappings for "Temperature" and "Pressure".
- `Id`="reference2" is defined only on the asset, with one measurement mapping for "Temperature".
- `Id`="reference3" is defined only on the asset, but its `StreamReferenceName` is null, with one measurement mapping for "Pressure".

<!-- Are "Temperature" and "Pressure" fields like "Id" and "Name." If so, then they should be formatted similarly. Is "reference1", "reference2", etc. the value of "Id"? -->
In this scenario, the default reference rules resolve as follows: 

- Measurement mappings for "reference1" are determined by the asset type. Any measurement mappings for "reference1" on the asset are ignored.
- The "Temperature" measurement mapping for "reference2" on the asset overrides the "Temperature" measurement mappings from "reference1".
- Any measurement mappings for "reference3" are ignored because Name on the asset is null. Note: `StreamReferenceName` on the asset type cannot be null. 

### Request

```
GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Assets/{assetId}/Shape
```

### Parameters

`string tenantId`    
The tenant identifier

`string namespaceId`  
The namespace identifier

`string assetId`  
The asset identifier

### Response

The response includes a status code and a response body.

| Status Code     | Body Type | Description                                                  |
| --------------- | --------- | ------------------------------------------------------------ |
| 200 OK          | `Shape`   | The default shape of an asset                                |
| 400 Bad Request | error     | The request is not valid. See the response body for additional details. |
| 403 Forbidden   | error     | You are not authorized to view the requested asset.          |
| 404 Not Found   | error     | The asset with the specified identifier is not found.        |

#### Example response body

```
HTTP 200 OK
Content-Type: application/json
{
    "Id": "AssetTest",
    "Name": "AssetName",
    "Metadata": [
        {
            "Id": "metadataId_101",
            "Name": "DateTimeAttr",
            "SdsTypeCode": 16,
            "Value": "0001-01-01T00:00:00Z"
        }
    ],
    "Measurements": [
        {
            "Id": "3509f11f-8b51-4555-acca-8c7c7c8192c2",
            "Name": "measurementTemperature",
            "StreamId": "theSdsStreamId",
            "Properties": [
                {
                    "Id": "Timestamp",
                    "IsKey": true,
                    "ExtrapolationMode": 2,
                    "SdsType": {
                        "SdsTypeCode": 16
                    }
                },
                {
                    "Id": "Value",
                    "InterpolationMode": 4,
                    "ExtrapolationMode": 2,
                    "SdsType": {
                        "SdsTypeCode": 113
                    }
                }
            ]
        }
    ]
}
```