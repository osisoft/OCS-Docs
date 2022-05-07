---
uid: gsRoles
---

# Get started with roles

Roles are used to manage access to assets, resources, and services in OSIsoft Cloud Services (OCS). Roles are assigned to identities, which includes users, groups, and client-credentials clients. See the following topics for more information about roles:

- [Roles](xref:ccRoles)

- [Roles best practices](xref:ccRoles#roles-bp)

To create a role, follow these steps:

1. In the left pane, select **Security** > **Roles**.

1. In the toolbar, select **Add Role**.

1. In the `Add Role` window, complete the following fields:

   - **Name**  - Enter *MyData.Role*.
   
   - **Description** - (Optional) Add a description for this role.

1. To create the new role, select **Add**. 

    It is added to the table of Roles. Note that the Role Type for all custom roles is `Tenant Custom`. You can now specify permissions for this role when managing permissions on assets, resources, and services. 
    
    **Note:** By default, the new role will not have any access granted or denied.
    
1. Select the `MyData.Role` role and select **Manage Identities**.

1. In the `Manage identities for MyData.Role Role` window, select the **Add Identity** dropdown list. 

    The list displays all users and clients in the tenant. Select **+** to add any users or clients in the list to the role.

1. When you are finished, select **Save**.

## Next step

Continue with [Get started with users](xref:gsUsers).
