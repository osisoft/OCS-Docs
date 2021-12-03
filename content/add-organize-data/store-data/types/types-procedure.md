---
uid: gpTypes
---

# Add a type

Sequential Data Store (SDS) types define the shape and structure of events and how to associate events with streams of data. Once created, you cannot modify a type. 

To add a stream, follow these steps:

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. From the **Streams** dropdown, select **Types**.

1. Select **Add Type**.

1. In the `Add Type` pane, complete the following fields:

 - **Id** &ndash; Enter the Id for the type.

 - **Name** &ndash; (Optional) Enter a user-friendly name. If you do not enter a name, the **Id** is used as the name.

 - **Description** &ndash; (Optional) Enter a user-friendly description of the type.

 - **Base Type** &ndash; (Optional) To base the new type on an existing type, select the existing type from the dropdown. The new type inherits the properties of the base type. Inherited properties are read only and cannot be modified.

1. For each property to add to the type, select **Add Property** and complete the following fields:
 
 - **Key** &ndash; Select the checkbox to indicate the property is an index. Only system SDS types can be designated as keys. You can select up to three properties as indexes. Drag and drop the properties in the list to reorder the index keys.
   
 - **Id** &ndash; Enter the identifier for referencing the property.
   
 - **Name** &ndash; Enter the name of the property. If you do not enter a name, the **Id** is used as the name. 
   
 - **Type** &ndash; Select the SDS type of the property from the dropdown.
   
     **Note:** To find the type in the list, filter the property types by entering text in the **Filter Types** box and use the **System** or **Tenant** controls to include or exclude these types. **Tenant** includes any types that were previously created in the selected namespace for a particular tenant. **System** includes SDS types that are provided and defined such as `string`, `integer`, `double`, `datetime`, and `Boolean`.
   
 - **UOM** &ndash; (Optional) Select a unit of measure for the property from the list. 
   
1. To save the type, select **Save**.
