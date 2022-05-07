---
uid: AssetRulesCC
---

# Asset rules

An asset rule identifies patterns in a stream name and uses this information to automatically create assets. In order to generate assets, the stream names must have the following characteristics:

- A pattern that can be mapped for configuration.

- A set of characters that uniquely identify the asset.

- A unique set of characters that identifies one stream from another for the same asset. For example, the stream name could include an abbreviation for the stream measurement. 

The asset rule identifies the pattern and the parts of the stream name and stream metadata that provide information about the asset. A token is created for each part of the pattern and piece of information. The tokens are used to construct the asset and add references to the relevant streams. For more information, see [How tokens are used in the Asset Rule Builder to generate assets](xref:TokensGenerateAssets).

Depending on the definition and consistency of the stream names, you may have to create multiple rules to capture all the relevant streams for your asset. For more information, see [Using multiple asset rules to create assets](xref:UsingMultipleRules).

## Asset rules and generated assets

An asset rule and the assets generated from that rule remain linked in the following ways:

- If you delete an asset rule, then any assets created with the rule are also deleted. There may be a short delay between the time the rule is deleted and when the related assets are deleted. 

- If you edit the properties of assets created with asset rules, those edits take precedence over the asset rule configuration. For example, if you edit the asset name, the rule does not overwrite this edit.

- If you manually delete an asset, the deletion is treated as an edit of the asset and overrides the rule. Therefore, if you delete an asset created by an asset rule, you cannot recreate that asset with the same Id. If you inadvertently delete an asset, you can recover the asset by deleting the rule. This action deletes any assets created with this rule. Then you can recreate the rule and configure the Id so that it resolves to a different Id. For example, assume that the asset Id in the first rule resolves to `Boiler Tank 1` and this asset is deleted in error. You then create a second rule which the Id resolves to `Region 1 - Boiler Tank 1`. OCS sees this as different asset and creates it. 
