# Roles

## Definition

Roles are used to manage access to assets, resources, and services in OSIsoft Cloud Services (OCS). Roles are assigned to identities, which includes users, groups, and client-credentials clients.

There are five built-in roles, which cannot be removed from a tenant.

- **Account Administrator** - OCS Administrator of OCS who is granted full permissions throughout OCS, by default.
- **Account Contributor** - Granted read and write permissions throughout OCS, by default.
- **Account Data Steward** - No specific permissions are granted to this role, by default.
- **Account Viewer** - No specific permissions are granted to this role, by default.
- **Account Member** - This role is assigned to all users or clients in OCS.  Account members are granted read access throughout OCS, by default.

In addition, you can create custom roles which are not granted any specific permissions, by default. Access to OCS resources depends on explicitly allowing or denying access to a role. Therefore, simply assigning a custom role to a user or client does not determine access. This is defined when a role is explicitly allowed or denied access to OCS resources.

For any resource in OCS, permissions are allowed or denied for specific roles, rather than to specific users or clients. These permissions are managed using the **Manage Permissions** dialog for the given resource. Each role can be allowed or denied access to one or more of the following access types:  **Read**, **Write**, **Delete**, and **Manage Permissions**. 

You must have the **Account Administrator** role to add and manage roles in a tenant.

## PI Core counterpart

Roles in OCS are comparable to PI identities in PI Data Archive or identities in PI AF server. Throughout OCS, permissions are granted to roles instead of directly to individual users or clients. This is similar to how identities in PI Core are used to assign permissions for a set of users or clients.

## Roles best practices

1. Consider whether the read access granted by the Account Member role is acceptable for all users and clients in your tenant. Specifically, if you plan to invite users from outside your organization, you may want to limit their read access. One way to do this is to create a custom role for external users so that their permissions can be explicitly managed.

1. Use caution when granting the Account Administrator role.  OSIsoft recommends that you assign a different role to users and clients who should not manage permissions. OSIsoft recommends that you avoid assigning the Account Administrator role to client-credentials clients. 
1. Ensure that the roles assigned to client-credentials clients only grant the minimum set of permissions required by the application that uses these clients. This minimizes the potential damage in the event a client secret is compromised or a problem arises with the application.

1. If users from other organizations will be given a user account to log in to your tenant, consider creating a role for their specific organization so that their permissions can be managed explicitly.

1. Use caution when denying permissions because this supersedes any allowed access to a role. For example, if a user is allowed write access through one role but is denied write access through another role, the user will not have write access. Because all users and clients are assigned the Account Member role, you cannot deny permissions to the **Account Member** role. Doing so would deny the given permission to every user in the tenant.

## Creating a role

Find the Roles page in the OSIsoft Cloud Services portal [here](https://cloud.osisoft.com/roles).

1. In the toolbar, click **Add Role**.

1. Enter a Name for the role and, optionally, a Description.

1. Click **Add** to create the new role. It will be added to the table of Roles. Note that the **Role Type** is listed as **Account Custom** for all custom (or non-default) roles. You can now specify permissions for this role when managing permissions on assets, resources, and services in OCS.

Note: By default, the new role will not have any access granted or denied in OCS.
