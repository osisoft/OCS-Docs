---
uid: gsTypes
---

# Get Started with Types



## Procedure

1. Click the ![Menu icon](images\menu-icon.png) icon and click **Sequential Data Store** (under Data Management).

1. Click **Types**. From the **Namespace** drop-down list, select QuickStart.

1. Click the ![Manage Default Type Permissions icon](Images\ManageDefaultIcon.png) icon above the tree on the left. 
   This opens the Manage Default Permissions for New Types window where default permissions for new types are specified. 

   Note: By default, you must be assigned the Account Administrator role to change the default permissions. Any changes only affect new types that are created. It does not change the permissions on already existing types. 

   When you are done reviewing the permissions, click **Cancel** to continue.

1. Click **Add Type**.

1. In the Add Type window, enter the following:

   - Id &ndash; QuickStart.PumpState
   - Name &ndash; QuickStart.PumpState
   - Description &ndash; SDS Type used by OCS Quick Start

1. Click the ![Properties icon](Images\PropertiesPlusIcon.png)icon next to **Properties** to add a property.

1. Complete the following fields for the first property:
   - Id &ndash; Enter **Timestamp**.
   - Type &ndash; Select **DateTime**. 
   - Key &ndash; Select the checkbox.
   
   Note: The Key field identifies the Timestamp property as the index.
   
1. Click the ![Properties icon](Images\PropertiesPlusIcon.png)icon to add a second property and complete the fields:
   - Id &ndash; Enter **Temperature**
   - Type &ndash; Select **Double**.
   
1. Click the ![Properties icon](Images\PropertiesPlusIcon.png)icon to add a third property and complete the fields:

   - Id &ndash; Enter **Pressure**.
   - Type &ndash; Select **Double**.

1. Click **Save**.

1. Click the checkbox to select the QuickStart.PumpState type in the list and click the ![Manage Permissions icon](Images/manage-permissions-icon.png) icon.

    This opens the Manage Permissions for QuickStart.PumpState window where you can override the default permissions and set permissions for the specific type. By default, you must be assigned the Account Administrator role to configure the type permissions.

    Review the permissions for the QuickStart.PumpState type, and when you are done exploring this window, click **Cancel** to continue. 

1. Click **View Type**.

   This window shows the type details which you entered in the dialog window when you added the type. Click **Cancel** to continue.

1. Click **Get Type Streams**.

   This takes you to the Streams list and, by default, it uses the _*typeId:QuickStart.PumpState* query to filter for any streams with the QuickStart.PumpState type. The list is empty because no streams have yet been created with this type.
   
