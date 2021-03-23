---
uid: gsTypes
---

# Get started with types

After creating the namespace, the next step is to add one or more types. For more information about types, see the following:

- [About types](xref:ccTypes)
- [PI Core counterpart](xref:ccTypes#types-pi-core)
- [Types best practices](xref:bpTypes)

## Procedure

1. Click the ![Menu icon](images\menu-icon.png) icon and click **Sequential Data Store** (under Data Management).

1. Click **Types**. From the **Namespace** drop-down list, select MyOCS.

1. Click the ![Manage Default Type Permissions icon](images\ManageDefaultIcon.png) icon above the tree on the left. 
   This opens the Manage Default Permissions for New Types window where default permissions for new types are specified. 

   Note: By default, you must be assigned the Tenant Administrator role to change the default permissions. Any changes only affect new types. It does not change the permissions on already existing types. 

   When you are done reviewing the permissions, click **Cancel** to continue.

1. Click **Add Type**.

1. In the Add Type window, enter the following:

   - Id &ndash; MyOCS.PumpState
   - Name &ndash; MyOCS.PumpState
   - Description &ndash; SDS Type used by My OCS

1. Click the ![Properties icon](images\PropertiesPlusIcon.png) icon next to **Properties** to add a property.

1. Complete the following fields for the first property:
   - Id &ndash; Enter **Timestamp**.
   - Type &ndash; Select **DateTime**. 
   - Key &ndash; Select the checkbox.
   
   Note: The Key field identifies the Timestamp property as the index.
   
1. Click the ![Properties icon](images\PropertiesPlusIcon.png) icon to add a second property and complete the fields:
   - Id &ndash; Enter **Temperature**
   - Type &ndash; Select **Double**.
   
1. Click the ![Properties icon](images\PropertiesPlusIcon.png) icon to add a third property and complete the fields:

   - Id &ndash; Enter **Pressure**.
   - Type &ndash; Select **Double**.

1. Click **Save**.

1. Click the checkbox to select the MyOCS.PumpState type in the list and click the ![Manage Permissions icon](images/manage-permissions-icon.png) icon.

    This opens the Manage Permissions for MyOCS.PumpState window where you can override the default permissions and set permissions for the specific type. By default, you must be assigned the Tenant Administrator role to configure the type permissions.

    Review the permissions for the MyOCS.PumpState type, and when you are done exploring this window, click **Cancel** to continue. 

1. Click **View Type**.

   This window shows the type details which you entered in the dialog window when you added the type. Click **Cancel** to continue.

1. Click **Get Type Streams**.

   This takes you to the Streams list and, by default, it uses the _*typeId:MyOCS.PumpState* query to filter for any streams with the MyOCS.PumpState type. The list is empty because no streams have yet been created with this type.
   

## Next Step

Continue with [Get started with streams](xref:gsStreams).