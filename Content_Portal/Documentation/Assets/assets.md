---
uid: AssetsProperties
---
# Assets

The asset API allows you to programmatically model your on-premises assets in OSIsoft Cloud Services (OCS). A single stream with its metadata can be used to model very simple assets. However, in most instances, an asset relates to dynamic data from several streams and to static information that describe the asset. This is better structured as an asset instead of any single stream. The assets feature is well suited to model these aspects of an asset. It allows users to create an asset, add static metadata, and reference streams in a standard, structured way. The asset API includes search capabilities and features to directly retrieve the values of dynamic data associated with a given asset. It also provides methods to configure determining the asset status and to configure different user views of an asset.

## Asset types

In many instances, you will have multiple assets of the same type. 

In this situation, an asset type can be used to create multiple similar assets. A change to the asset type is reflected in all assets that are derived from the asset type.

### Asset and asset type properties

| Property      | Type              | Required? | Searchable? | Description                                                  | Asset Property? | Asset Type Property? |
| ------------- | ----------------- | --------- | ----------- | ------------------------------------------------------------ | ----- | --------------- |
| Id           | String            | Required  | Yes         | `Id` for referencing this asset. If you do not provide an `Id`, OCS copies the name as the identifier`Id`. If you do not provide a name, OCS assigns a random GUID for the `Id`.| Yes  | Yes            |
| Name          | String            | Required only if `Id` is not specified  | Yes         | User-friendly name. Required if `Id` is not provided. If Name is used as the `Id`, it must be unique within a given namespace. | Yes  | Yes            |
| Description   | String            | Optional  | Yes         | User-provided description.                                   | Yes  | Yes            |
| AssetTypeId   | String            | Optional  | No          | `Id` for the asset type that this asset is derived from. To get the merged view of the asset, get the resolved asset through the /Assets/{assetId}/Resolved route. | Yes  | No            |
| Metadata      | Metadata List     | Optional  | Yes       | Asset and asset type metadata                               | Yes  | Yes            |
| StreamReferences   | Stream Reference List | Optional  | No       | Asset stream references                                             | Yes  | No            |
| TypeReferences | Type Reference List | Optional  | No        | Asset type type references                                     | No | Yes            |
| StatusMapping | Status Mapping | Optional  | No        | Asset and asset type status mapping | Yes | Yes            |

For more information on search syntax, see [Assets Search API](xref:AssetsSearchAPI).

## Asset and asset type metadata properties

An asset or asset type metadata is static information associated with a given asset. A given metadata contains a list of individual metadata values. <!-- I wonder if it's correct to call this a list? "A given metadata contains any number of metadata values." -->There is no limit on the number of metadata values defined by an asset. An asset or asset type metadata does not stand alone. It must be specified within an asset or asset type object and, therefore, there are no direct API routes to asset or asset type metadata.

| Property    | Type   | Required? | Description                                                  |
| ----------- | ------ | --------- | ------------------------------------------------------------ |
| Id          | String | Required*  | `Id` for the metadata value.                                 |
| Name        | String | Required  | User-friendly name for the metadata value. If not null, must be unique within an asset or asset type. |
| Description | String | Optional  | User-provided description                                    |
| SdsTypeCode | Int    | Required  | This integer corresponds to the SdsTypeCode. Asset metadata support the following integer values: 11 (Int64), 14 (Double), 16 (DateTime), and 18 (String). |
| Uom         | String | Optional  | Asset metadata unit of measurement. Select from the list of supported Uom types. |
| Value       | String | Optional  | String representation of the metadata.                       |

\* `Id` is not required on property if the `Name` matches a `Name` on the Asset Type metadata. In this case, the `Id` of the metadata on the Asset will be set as the metadata `Id` of the Asset Type. This also applies when an Asset is updated.

## Asset stream reference properties

An asset stream reference represents dynamic stream data associated with an asset. The references must either be an SDS stream or an SDS stream view. Asset-centric data routes provide direct access to dynamic data for a given asset. There are no limitations on the number of references an asset may contain. However, an asset cannot contain multiple references to the same SDS stream. An asset stream reference does not stand alone. It must be specified within an asset object and, therefore, asset references do not have direct API routes. 

| Property      | Type   | Required? | Searchable? | Description                                                  |
| ------------- | ------ | --------- | ----------- | ------------------------------------------------------------ |
| Id            | String | Required*  | No          | `Id` for this stream reference object.  This `Id` must be unique within the asset.                    |
| Name          | String | Required  | No          | User-friendly name for the stream reference object. If not null, must be unique within an asset. |
| Description   | String | Optional  | No          | Description text.                                            |
| StreamId      | String | Required  | No          | The SDS stream `Id` of this stream reference. This SDS stream must exist at the time the asset is created. |

\* `Id` is not required on property if the `Name` matches a `Name` on the Asset Type type reference. In this case, the `Id` of the stream reference on the Asset will be set as the type reference `Id` of the Asset Type. This also applies when an Asset is updated.

## Asset type type reference properties

An asset type type reference represents dynamic stream data associated with an asset. The references must either be an SDS stream or an SDS stream view. Asset-centric data routes provide direct access to dynamic data for a given asset. There are no limitations on the number of references an asset may contain. However, an asset cannot contain multiple references to the same SDS stream. An asset reference does not stand alone. It must be specified within an asset object and, therefore, asset references do not have direct API routes. 

| Property    | Type   | Required? | Searchable? | Description                                                  |
| ----------- | ------ | --------- | ----------- | ------------------------------------------------------------ |
| StreamReferenceId | String | Required | No |The `Id` for this type reference. If an asset is derived from this asset type, this Id must be referenced in the asset reference type object. This `Id` must be unique within the asset type. |
| StreamReferenceName  | String | Required  | No          | The user friendly name for this type reference. If not null, must be unique within an asset type.|
| Description | String | Optional  | No          | Description text                                             |
| TypeId    | String | Required  | No          | This string must be an SDS stream type `Id` in the referenced SDS stream. |

## Asset and asset type status mapping properties
For information about asset and asset type status mapping, please refer to [Asset Status](xref:AssetStatusMapping) for more details.  

The following is an example of an asset derived from an asset type.

Asset type example

```
Content-Type: application/json
{
  "Id": "ChargingStationType", 
  "Description": "Charging Station Type", 
  "Metadata": [{ 
     "Id":"d7368dc2-58f0-4669-8e6e-44ac2cc3f47c",
     "Name": "Location", 
     "SdsTypeCode": 18, 
     "Value": null 
     "Uom": null 
  }], 
  "TypeReferences": [{ 
     "StreamReferenceId": "Reference1", 
     "StreamReferenceName": "ReferenceName", 
     "TypeId": "PI-Float32" 
   }] 
}
```

Asset example
```
{ 
  "Id": "ChargingStation1", 
  "Name": " ChargingStation1", 
  "Description": "Charging Station Instance", 
  "AssetTypeId": "ChargingStationType", 
  "Metadata": [{ 
      "Id": "d7368dc2-58f0-4669-8e6e-44ac2cc3f47c",   
      "Name": null,   
      "Value": "Houston",  
      "SdsTypeCode": 18,  
   }],
   "StreamReferences": [
        {
            "Id": "Reference1",
            "Name": "ReferenceName",
            "StreamId": "PI_StreamReference_1010"
   }],
   "Status": {
        "Name": "ChargingStationStatus",
        "StreamReferenceId": "Reference1",
        "StreamPropertyId": "Value",
        "ValueStatusMappings": [
            {
                "Value": 0,
                "Status": 0,
                "DisplayName": "Bad"
            }
            {
                "Value": 1,
                "Status": 1,
                "DisplayName": "Good"
            }
        ]
    }
} 
```
