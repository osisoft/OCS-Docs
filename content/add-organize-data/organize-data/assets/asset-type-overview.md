---
uid: AssetTypes
---

# Asset types

Asset types provide a template for assets that share a common structure or type. You can define the expected metadata and stream references for assets that are created with the asset type. This makes it  easier to compare assets of the same type and to ensure consistency across similar assets. Note the following characteristics of an asset created from an asset type:  

- The asset name must be configured and, optionally, the description can be configured.
- The asset type determines the metadata and stream type associated with the asset. Therefore, you cannot add or remove metadata from the asset; however, you can edit the values of the metadata. 
- Stream references must be configured to point to streams of the type defined in the asset type. 
- The status mapping is determined by the asset type. You cannot change the mappings or select another measurement.
- Otherwise, the configuration of the asset is read-only and inherited from the asset type.

There are two ways to create an asset type:

- Take an existing asset and convert it to an asset type. For more information, refer to [Convert an asset to an asset type](xref:ConvertAssetToAssetType).

- Create a new asset type. For more information, refer to [Create an asset type with the asset type editor](xref:CreateAssetTypeWithEditor).

## PI Server counterpart

Asset types are comparable to element templates in the PI AF server. Like element templates, OCS asset types are a template for any assets or elements that are created from them. Asset types also serve a similar purpose to element templates in that they help ensure consistency and make it easier to compare assets of the same type.

## Asset types best practices 

When deciding whether or not to use asset types, consider whether all assets of a given type are similar enough that they can be modeled by a type. Additional metadata and stream references cannot be added to assets that are created from an asset type.
