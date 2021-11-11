---
uid: ccAssets
---

# Assets

An asset is a container for data streams and metadata associated with a particular device or object. Assets allow you to group related streams and provide context to the stream data.

When you create an asset, you select a namespace and a set of streams within that namespace. Assets typically represent devices with multiple data streams, but you can create an asset with only one stream if needed.

Use the asset explorer in the portal to create assets, then visualize data streams and properties to troubleshoot and analyze the associated devices. You can create assets as needed, create them from an asset type, which acts as a template for creating similar assets, and generate them based on stream naming patterns using asset rules.

## PI Server counterpart

Assets are comparable to elements in PI AF server. Like elements, assets include both dynamic and static information associated with the asset. The static information provides context for the dynamic data. Assets appear as a flat list that you can search using metadata values. This contrasts with the elements in PI AF server which are organized in a hierarchy.

## Assets best practices

We recommend the following best practices when you create assets:

- Use assets to bring together data from multiple streams and the static data associated with a logical asset. Assets make it easier to visualize and contextualize the data for a given logical asset.

- Define the UOM on the type whenever possible. The UOM can also be defined on the stream, but if it is defined in multiple places, ensure that the UOMs match. If a different UOM is configured, there is no conversion between the UOMs.  
