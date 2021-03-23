---
uid: gsRoles
---
# Get started with roles

Roles are used to manage access to assets, resources, and services in OSIsoft Cloud Services (OCS). Roles are assigned to identities, which includes users, groups, and client-credentials clients. See the following for more information about roles:

- [About roles](xref:ccRoles)
- [PI Core counterpart](xref:ccRoles#roles-pi-core)
- [Roles best practices](xref:ccRoles#roles-bp)

## Procedure

Follow the procedure to create role.

1. Click the ![Menu icon](images/menu-icon.png) icon and click **Roles** (under Security).

1. In the toolbar, click **Add Role**.

1. In the Add Role window, enter the following:
   - Name  &ndash; MyOCS.Role
   - Description &ndash; Optionally, add a description for this role
   
1. Click **Add** to create the new role. It will be added to the table of Roles. Note that the Role Type is listed as *Tenant Custom* or all custom (or non-default) roles. You can now specify permissions for this role when managing permissions on assets, resources, and services in OCS.

    Note: By default, the new role will not have any access granted or denied in OCS.
    
1. Select the MyOCS.Role role and  click **Manage Identities**.

1. In the Manage identities for MyOCS.Role window, click the **Add Identity** drop-down list. 

    The list displays all users and clients in the tenant. Click the + to add any users or clients to the role.

1. When you are done adding users and clients, click **Save**.

## Next step

Continue with [Get started with users](xref:gsUsers).

