---
uid: AssetTypes
---

# Asset types

Asset types are a template that is used to create multiple assets with similar properties. Assets created from asset types have the following characteristics:

* Metadata - A collection of properties that asset instances of this asset type are expected to provide. The type and units of measure for the value can be defined.

* Stream Type references - A collection of named references to streams that asset instances of the asset type are expected to provide. The name functions as a key identifying the relationship between asset of the referenced Stream. The stream type and unit of measure override define constraints on the referenced stream that instances will comply with.

Note the following characteristics of an asset created from an asset type:  

- The metadata associated with the asset is determined by the asset type. Therefore, you cannot add or remove metadata from the asset; however, you can edit the values of the metadata.
- The stream type for the asset is determined by the asset type. However, you must select the stream that is associated with the asset.
- The status mapping is determined by the asset type. You cannot change the mappings or select another measurement.
- You must assign a name to the asset and, optionally, a description.

There are two ways to create an asset type:

- Take an existing asset and convert it to an asset type. For more information, refer to [Convert an asset to an asset type](xref:ConvertAssetToAssetType).

- Create an asset type from the start. For more information, refer to [Create an asset type with the asset type editor](xref:CreateAssetType).

