---
uid: gpTypes
---

# Add a type

Sequential Data Store (SDS) types define the shape and structure of events and how to associate events with streams of data. For more information about types, see [Types](xref:ccTypes) and [Types best practices](xref:bpTypes).

After you have created a type, it cannot be modified.

## Procedure

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. Click the **Change Namespace** button in the upper-right toolbar, then select the namespace in which you want to create the stream.

1. In the left corner, click **Streams** > **Types**.

1. Click **Add Type**.

1. In the `Add Type` pane, enter the following information:

   - `Id` &ndash; Id for referencing the type
    
   - `Name` &ndash; (Optional) User-friendly name. If you do not provide a name, the Id will be assigned as the name.
   
   - `Description` &ndash; (Optional) Descriptive text that you can use to identify the type
   
   - `Base Type` &ndash; (Optional) Select a previously created type on which the new type will be based. The new type inherits the properties of the base type. Inherited properties are read only and cannot be modified.

1. Click  **Add Property** to add a property.

1. Complete the following fields for the first property:
 
   - `Key` &ndash;  When selected, identifies the property as the index. Only system SDS types can be designated as keys. 
   
   - `Id` &ndash; Identifier for referencing the property.
   
   - `Name` &ndash; Name of the type. By default, the `Id` and `Name` are the same. 
   
   - `Type` &ndash;  SDS type of the property
   
     **Note:** You can filter on the property types by entering text in the **Filter Types** box. You can also use the **System** or **Tenant** controls to include or exclude these types. *Tenant* includes any types that were previously created in the selected namespace for a particular tenant. *System* includes SDS types that are provided and defined such as *string*, *integer*, *double*, *datetime*, and *boolean*.
   
   - `UOM` &ndash; (Optional) Select a unit of measure from the list. 
   
   **Note:**
   
   - The `Key` field identifies the property as the index.
   
   - You can select up to three properties as indexes. Drag and drop the properties in the list to reorder the index keys.
   
1. Continue adding properties to the type.

1. When you have finished adding properties, click **Save**.

## Related links

- [Types](xref:sds-types) API
