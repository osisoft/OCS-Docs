---
uid: gpTypes
---

# Add a type

Sequential Data Store (SDS) types define the shape and structure of events and how to associate events with streams of data. Once created, you cannot modify a type. You can add one of two types: **Standard Types** or **Enum Types**.

**Tip:** For a list of the supported property types, see [Supported types](xref:sdsTypes#sdstypecode). 

# [Standard type](#tab/tabid-1)

To add a base type: 

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. From the **Streams** dropdown list, select **Types**.

1. Select **Add Type**.

    The `Add Type` pane opens.

1. Ensure **Standard Type** is selected.

1. Complete the following fields:

    - **Id** - Enter the Id for the type.
    
    - **Name** - (Optional) Enter a user-friendly name. If you do not enter a name, the **Id** is used as the name.
    
    - **Description** - (Optional) Enter a user-friendly description of the type.
    
    - **Type** - (Optional) To base the new type on an existing standard type, select the existing type from the dropdown. The new type inherits the properties of the base type. Inherited properties are read only and cannot be modified.

1. For each property to add to the type, select **Add Property** and complete the following fields:
 
    - **Key** - Select the checkbox to indicate the property is an index. Only system SDS types can be designated as keys. You can select up to three properties as indexes. Drag and drop the properties in the list to reorder the index keys.
    
    - **Id** - Enter the identifier for referencing the property.
    
    - **Name** - Enter the name of the property. If you do not enter a name, the **Id** is used as the name. 
    
    - **Base Type** - Select the SDS type of the property from the dropdown.
    
        **Note:** To find the type in the list, filter the property types by entering text in the **Filter Types** field and use the **System** or **Tenant** controls to include or exclude these types. **Tenant** includes any types that were previously created in the selected namespace for a particular tenant. **System** includes SDS types that are provided and defined such as `string`, `integer`, `double`, `datetime`, and `Boolean`.
    
    - **UOM** - (Optional) Select a unit of measure for the property from the list. 
   
1. To save the type, select **Save**.

# [Enum type](#tab/tabid-2)

You can also create enumeration types that you can include as a property in standard types.

To add a enum type:

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. From the **Streams** dropdown list, select **Types**.

1. Select **Add Type**.

    The `Add Type` pane opens.

1. Select **Enum Type**.

1. In the `Add Enum Type` pane, complete the following fields:

    - **Id** - Enter the Id for the type.
    
    - **Name** - (Optional) Enter a user-friendly name. If you do not enter a name, the **Id** is used as the name.
    
    - **Description** - (Optional) Enter a user-friendly description of the type.
    
    - **Enum Type** - Select the enum type from the dropdown.

1. For each property to add to the enum type, select **Add Property** and complete the following fields:
 
    - **Id** - Enter the identifier for referencing the property.
    
    - **Value** - Enter the numeric value of the property.

        **Note:** Accepted numeric values change based on the selected **Enum Type**. Refer to the following table for accepted values for each type.

        | Enum Type | Int<sup>1</sup> | -Int<sup>2</sup> | Nullable<sup>3</sup> |
        |--|--|--|--|
        | ByteEnum | ✔ | ✖ | ✖ |
        | Int_X_Enum | ✔ | ✔ | ✖ |
        | NullableByteEnum | ✔ | ✖ | ✔ |
        | NullableInt_X_Enum | ✔ | ✔ | ✔ |
        | NullableSByteEnum | ✔ | ✔ | ✔ |
        | NullableUInt_X_Enum | ✔ | ✖ | ✔ |
        | SByteEnum | ✔ | ✔ | ✖ |
        | UInt_X_Enum | ✔ | ✖ | ✖ |

        <sup>1</sup>: Integer<br>
        <sup>2</sup>: Negative Integer<br> 
        <sup>3</sup>: Nullable fields can be left empty
    
1. To save the type, select **Save**.

***