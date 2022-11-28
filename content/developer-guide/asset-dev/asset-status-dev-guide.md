---
uid: asset-status-dev-guide
---

# Asset and Asset Type Status

Status is a property of an asset or asset type that defines the simple status of an asset or asset type. There is one status property for each asset or asset type.

If an asset references an existing asset type and the asset type has a corresponding type reference, then the status mapping on the asset is ignored.

Create, read, update, and delete of an asset status mapping is done through the asset or asset type itself.

## Status table

The following table lists the most common fields in a status mapping.

| Property       | Type       | Required? | Description                                                  |
| -------------- | ---------- | --------- | ------------------------------------------------------------ |
| DefinitionType | String     | Required  | At this moment, only the value "StreamPropertyMapping" is supported. |
| Definition     | Definition | Required  | Status definition.                                           |

## Status definition table

The following table lists the most common fields in a status mapping.

| Property            | Type                     | Required? | Description                                                  |
| ------------------- | ------------------------ | --------- | ------------------------------------------------------------ |
| StreamReferenceId   | String                   | Required  | `Id` for the asset's StreamReferences property. The stream reference must exist before the status mapping can be created. |
| StreamPropertyId    | String                   | Required  | SDS stream property that status uses for calculations. It must be present on the StreamId property on the asset StreamReference.  The SDS stream property must be a numeric enumeration, character, or string type. |
| ValueStatusMappings | List<ValueStatusMapping> | Required  | The value status mapping maps values to a given status. See [Value status mapping properties table](xref:AssetStatus#value-status-mapping-properties-table) |

The following table lists the most common fields in a value status mapping. A single value status mapping corresponds to a single status. If you want additional statuses in your asset status mapping, add additional elements in the `ValueStatusMappings` list.

| Property    | Type               | Required? | Description                                                  |
| ----------- | ------------------ | --------- | ------------------------------------------------------------ |
| Value       | Object             | Required  | The value that must be matched for the status enumeration to be set. If none of the values match, the status is set to Unknown. Since value ranges are not supported, floating point values are not very amendable to mappings at this point. |
| Status      | Status Enumeration | Required  | Status enumeration can be Unknown, Good, Warning, or Bad.    |
| DisplayName | String             | Optional  | Display name for this value status mapping.                  |

## Status enumerations

The following are valid status enumerations: 

- Unknown = 0
- Good = 1
- Warning = 2
- Bad = 3

## Example status mapping

The following is an example of a status property which is on the asset or asset type.

```
"Status": {
  "DefinitionType": "StreamPropertyMapping",
  "Definition": {
    "StreamReferenceId": "AssetStreamReferenceId1",
    "StreamPropertyId": "Value",
    "ValueStatusMappings": [
      {
        "Value": 3,
        "Status": "Bad",
        "DisplayName": "AssetIsInBadState"
      },
      {
        "Value": 1,
        "Status": "Good",
        "DisplayName": "AssetIsInGoodState"
      }
    ]
  }
}
```
The asset or asset type's `StreamReferences` field has an `Id` property. To assign a status mapping to an asset or asset type, the value assigned to the `Id` property must match the `StreamReferenceId` of the status mapping object. Using the status mapping example above, AssetStreamReferenceId1 is assigned to the asset in the following example. 
```
{
  "Id": "ChargingStationAsset", 
   "AssetTypeId": null,
  "Metadata": [{ 
      "Name": "Location",  "Value": "Houston", "SdsTypeCode": "String", "Uom": null​ 
    }], 
    "StreamReferences": [{ 
      "Id": "AssetStreamReferenceId1", 
      "StreamId": "pi2ocs_stream1_inputpower", 
    }] 
} 
```
