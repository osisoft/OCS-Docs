---
uid: WorkWithAssets
---

# Asset rules expected behavior

<!-- There may be a better title -->

An asset rule and the assets generated from that rule remain linked in the following ways:

- If you delete an asset rule, then any assets created with the rule are also deleted. There may be a short delay between the time the rule is deleted and when the related assets are deleted. 

- If you edit the properties of assets created with asset rules, those edits take precedence over the asset rule configuration. For example, if you edit the asset name, the rule does not overwrite this edit.

- If you manually delete an asset, the deletion is treated as an edit of the asset and overrides the rule. Therefore, if you delete an asset created by an asset rule, you cannot recreate that asset with the same Id. If you inadvertently delete an asset, you can recover the asset by deleting the rule. This action deletes any assets created with this rule. Then you can recreate the rule and configure the Id so that it resolves to a different Id. For example, assume that the asset Id in the first rule resolves to `Boiler Tank 1` and this asset is deleted in error. You then create a second rule which the Id resolves to `Region 1 - Boiler Tank 1`. OCS sees this as different asset and creates it. 
