---
uid: ccRoles
---

# Roles

Administrators use roles to manage access to assets, resources, and services. They can then assign these roles to identities, which include users, groups, and client-credentials clients. When an identity tries to access a resource, OSIsoft Cloud Services (OCS) checks the assigned roles against the permissions on the resource to determine their access level.

There are five built-in roles which cannot be removed from a tenant:

- Tenant Administrator – Administrator with full permissions by default. This is the highest privilege role, with the ability to create new and remove existing users, clients and secrets.

  **Note:** Do not assign the Tenant Administrator role to clients.

- Tenant Contributor – This role has read and write permissions by default.

- Tenant Data Steward – This role has no specific permissions by default.

- Tenant Viewer – This role has no specific permissions by default.

- Tenant Member – This role, which OCS assigns to all users or clients, has read access by default.

You can add roles to further control access. By default, added roles do not have any specific permissions. You must have the Tenant Administrator role to add and manage roles in a tenant. 

Assigning a role to a user or client does not determine access. For any resource, you set access on the resource for specific roles, rather than for specific users or clients. Manage access using Manage Permissions for the given resource. For each role, you set access to the following access types: Read, Write, Delete, and Manage Permissions.

## <a name="roles-pi-server"></a>PI Server counterpart

Roles are comparable to PI identities in PI Data Archive or identities in PI AF server. An administrator grants permissions to roles instead of directly to individual users or clients. This is similar to how PI Server uses identities to assign permissions for a set of users or clients.

## <a name="roles-bp"></a>Roles best practices

Consider the following best practices when you create and assign roles:

- Consider whether the read access granted by the Tenant Member role is acceptable for all users and clients in your tenant. Specifically, if you plan to invite users from outside your organization, you may want to limit their read access. One way to do this is to create a custom role for external users so that their permissions can be explicitly managed.
 
- When using PI to OCS, ensure write access to stream and asset collections. The PI to OCS Agent has write permission to the streams collection in OCS. By default, the Tenant Contributor role provides write permission to the automatically generated PIToOcs Agent Client User. Write permission to this collection is required to enable stream creation.

- Use caution when granting the Tenant Administrator role. Make sure to assign a different role to users and clients who should not manage permissions. Avoid assigning the Tenant Administrator role to client-credentials clients.

- Ensure that the roles assigned to client-credentials clients only grant the minimum set of permissions required by the application that uses these clients. This minimizes the potential damage in the event a client secret is compromised or a problem arises with the application.

- Use caution when denying permissions because this supersedes any allowed access to a role. For example, if a user is allowed write access through one role but is denied write access through another role, the user will not have write access. Because all users and clients are assigned the Tenant Member role, you cannot deny permissions to the Tenant Member role. Doing so would deny the given permission to every user in the tenant.
