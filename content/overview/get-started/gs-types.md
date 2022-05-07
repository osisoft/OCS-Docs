---
uid: gsTypes
---

# Get started with types

After creating the namespace, the next step is to add one or more types. A type defines the shape and structure of events and how to associate events within a stream of data. For more information about types, see the following topics:

- [Types](xref:ccTypes)

- [Types best practices](xref:bpTypes)

To add a type, follow these steps:

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. From the **Streams** dropdown list, select **Types**.

1. Add four properties to the type. 

   Click **Add Property** to add a property to the type. Update each new property using the values from the table below.

   | Property | Key | Id | Name | Type | UOM | 
   |----------|-----|------|----|--|-----|
   | Property One | &#10004;<sup>1</sup> | Timestamp | Timestamp | DateTime | -<sup>2</sup> | 
   | Property Two | - | Temperature | Temperature | Double | degree Celsius | 
   | Property Three | - | Pressure | Pressure | Double | kilogram per cubic meter | 
   | Property Four | - | Status | Status | String | - | 
   
   <sup>1</sup> The `Key` field identifies this property as the index. You can select up to three properties as indexes. Drag and drop the properties in the list to order the index keys. For this exercise, use only the `Timestamp` property as an index.
   
   <sup>2</sup> Cells with an entry of `-` indicate that you should leave the property value blank.

1. Select **Apply**.

To explore information about the type you just created, follow these steps:

1. Select the `MyData.PumpState` type, select **More Options** ![More Options](../../_icons/default/dots-vertical.svg) > **Manage Permissions**.

    The `Manage Permissions for MyData.PumpState` window opens where you can override the default permissions and set permissions for the specific type. You must be assigned the Tenant Administrator role to configure the type permissions.

    Review the permissions for the `MyData.PumpState` type, and when you have finished exploring this window, select **Cancel** to continue. 

1. Select the `MyData.PumpState` type, select **More Options** ![More Options](../../_icons/default/dots-vertical.svg) > **Get Type Streams**.

   The **Streams** list opens and, by default, the `typeId:MyData.PumpState` query is used to filter any streams with the `MyData.PumpState` type. The list is currently empty, because you have not created streams for this type yet.

## Next step

Continue with [Get started with streams](xref:gsStreams).
