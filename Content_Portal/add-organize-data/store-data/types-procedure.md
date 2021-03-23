---
uid: gpTypes
---

# Add a type

Sequential Data Store (SDS) types define the shape and structure of events and how to associate events with streams of data. See the following for more information about types:

- [About types](xref:ccTypes)
- [Types best practices](xref:bpTypes)

## Procedure

1. Click the ![Menu icon](images\menu-icon.png) icon and click **Sequential Data Store** (under Data Management).

1. Click **Types**. From the **Namespace** drop-down list, select the namespace in which you want the type created.

1. Click **Add Type**.

1. In the Add Type window, enter the following:

   - Id &ndash; Id for referencing the type
   - Name &ndash; User-friendly name
   - Description &ndash; Descriptive text that you can use to identify the type

1. Click the ![Properties icon](Images\PropertiesPlusIcon.png)icon next to **Properties** to add a property.

1. Complete the following fields for the first property:
   - Id &ndash; Identifier for referencing the property
   - Type &ndash;  Sds type of the property
   - Key &ndash;  When selected, identifies the property as the index 
   
   Note:
   
   - The Key field identifies the property as the index.
   
   - In the OCS portal, only one key can be specified as an index. However, you can specify multiple keys  through the OCS API. For more information, see <!-- add xref to relevant API doc. -->
   
    <!-- This is due to a bug in the UI. Check with engineering/product management about how to frame this. It's unclear when this bug will be fixed. -->
   
1. Continue adding properties to the type.

1. When you are done adding properties, click **Save**.

## Related Links

- [Types](xref:sdsTypes) API