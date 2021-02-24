# Roles

## Definition

Roles are used to manage access to assets, resources, and services in OSIsoft Cloud Services (OCS). Roles are assigned to identities, which includes users, groups, and client-credentials clients.

There are five built-in roles, which cannot be removed from a tenant.

- **Account Administrator** - Represents the Administrator of OCS, and granted full permissions throughout OCS by default.
- **Account Contributor** - Granted read and write permissions throughout OCS by default.
- **Account Data Steward** - Not granted any specific permissions by default.
- **Account Viewer** - Not granted any specific permissions by default.
- **Account Member** - Automatically granted to any user or client in OCS, and granted read access throughout OCS by default.

In addition, custom roles can be added, which are not granted any specific permissions by default.

For any resource in OCS, permissions are granted or denied to specific roles, rather than specific users or clients. These permissions are managed using the **Manage Permissions** dialog for the given resource. Role access to a resource an include **Read**, **Write**, **Delete**, and **Manage Permissions**. Each access type can be set to **Allow** or **Deny** for each individual role.

You must have the **Account Administrator** role to add and manage roles in a tenant.

## PI Core Counterpart

Roles in OCS are comparable to PI Identities in the PI Data Archive, or Identities in the PI AF Server. Throughout OCS, permissions are granted to Roles instead of directly to individual users or clients, in much the same way that Identities in PI Core are used to assign permissions for a set of users or clients.

## Roles Best Practices

1. Consider whether the read access granted by the Account Member role is acceptable for all users and clients in your tenant. If you plan to invite users from outside your organization, it may be important to limit the read access granted by the Account Member role.

1. Use caution when granting the Account Administrator role, ideally using a different role for users and clients that should not be able to manage permissions. Clients should not generally be granted the Account Administrator role.

1. If users from other organizations will be given a user account to log in to your tenant, consider creating a role for their specific organization so that their permissions can be managed explicitly.

## Creating a Role

Find the Roles page in the OSIsoft Cloud Services portal [here](https://cloud.osisoft.com/roles).

1. In the toolbar, click **Add Role**.

1. Enter a Name for the role and, optionally, a Description.

1. Click **Add** to create the new role. It will be added to the table of Roles. Note that the **Role Type** is listed as **Account Custom** for all custom (or non-default) roles. You can now specify permissions for this role when managing permissions on assets, resources, and services in OCS.

Note: By default, the new role will not have any access granted or denied in OCS.
