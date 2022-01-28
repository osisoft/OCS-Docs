---
uid: ccRoles
---

# Roles

Administrators use roles to manage access to assets, resources, and services. They can then assign these roles to identities, which include users, groups, and client-credentials clients. When an identity tries to access a resource, OSIsoft Cloud Services (OCS) checks the assigned roles against the permissions on the resource to determine their access level.

## Role types

OCS includes three types of roles:

- [Tenant roles](#tenant-roles)

- [Tenant custom roles](#tenant-custom-roles)

- [Community roles](#community-roles-preview)

### Tenant roles

Tenant roles are the default permission sets that control access to each asset, resource, and service within OCS. These default roles cannot be removed from the tenant. 

The default tenant roles are:

- Tenant Administrator – Administrator with full permissions by default. This is the highest privilege role, with the ability to create new and remove existing users, groups, clients, and secrets.

  **Note:** Do not assign the Tenant Administrator role to clients.

- Tenant Contributor – This role has read and write permissions by default.

- Tenant Data Steward – This role has no specific permissions by default.

- Tenant Viewer – This role has no specific permissions by default.

- Tenant Member – This role, which OCS assigns to all users or clients, has read access by default.

- Community Administrator – This role has no specific permissions by default.

  **Note:** Although this role is assigned no permissions by default, it is designed to be assigned community administration permissions. See [Community administrators](#community-administrators-preview) for more information.

Although most tenant roles are assigned permission sets by default, you can edit these roles to add or remove permissions. For example, OCS assigns no permissions to the Tenant Contributor, Tenant Data Steward, or Tenant Viewer roles. For these roles, you can add or remove permissions to best suit your organization.

For any resource, you set access to it for specific roles, rather than for specific users or clients. Manage access using Manage Permissions for the given resource. For each role, you set access to the following access types: Read, Write, Delete, and Manage Permissions.

### Tenant custom roles 

In addition to the default tenant roles, you can create tenant custom roles for further access control. By default, tenant custom roles do not have any specific permissions after you create one. You must add or remove permissions for each resource.

You must have the Tenant Administrator role to add and manage tenant custom roles.

### Community roles (Preview)

A community role is a role that is shared among multiple tenants. Community roles allow for sharing data within a [community](communities).

When a new community is created, the tenant automatically adds a new community role to the system, which is named using the following convention:"_<Community Name>_ Community Member". For example, if you created a new community named "TEST COMMUNITY", a new community role would be added to your tenant named "TEST COMMUNITY Community Member".

This new role is also shared with other tenants that join the community. For example, a tenant that joins "TEST COMMUNITY" will have the "TEST COMMUNITY Community Member" role added to their tenant as well. 

There is a single community role:

- Community Member – This role has read permissions by default. However, like all 

#### Community administrators (Preview)

When a tenant administrator creates or joins a new community, they are prompted to assign new community administration permissions to one or more existing roles. All users assigned these roles inherit administrative permissions within the community for their tenant, including the following actions:

- Modify the community name and description.

- Add and remove users and clients to/from the community.

- Assign roles that can administer the community.

- Pause the sharing of data from your tenant into the community.

- Delete the community.

OCS includes a tenant role named **Community Administrator** that is assigned no permissions by default. Assigning community administrator permissions to this role is recommended.

#### Community owner (Preview)

The user that creates a community becomes its community owner. The community owner has full administrative access to the community and some additional permissions:

- Remove other tenants from the community.

- Delete the community.

## <a name="roles-pi-server"></a>PI Server counterpart

Roles are comparable to PI identities in PI Data Archive or identities in PI AF server. An administrator grants permissions to roles instead of directly to individual users or clients. This is similar to how PI Server uses identities to assign permissions for a set of users or clients.

## <a name="roles-bp"></a>Roles best practices

Consider the following best practices when you create and assign roles:

- Consider whether the read access granted by the Tenant Member role is acceptable for all users and clients in your tenant. Specifically, if you plan to invite users from outside your organization, you may want to limit their read access. One way to do this is to create a custom role for external users so that their permissions can be explicitly managed.
 
- When using PI to OCS, ensure write access to stream and asset collections. The PI to OCS Agent has write permission to the streams collection in OCS. By default, the Tenant Contributor role provides write permission to the automatically generated PIToOcs Agent Client User. Write permission to this collection is required to enable stream creation.

- Use caution when granting the Tenant Administrator role. Make sure to assign a different role to users and clients who should not manage permissions. Avoid assigning the Tenant Administrator role to client-credentials clients.

- Ensure that the roles assigned to client-credentials clients only grant the minimum set of permissions required by the application that uses these clients. This minimizes the potential damage in the event a client secret is compromised or a problem arises with the application.

- Use caution when denying permissions because this supersedes any allowed access to a role. For example, if a user is allowed write access through one role but is denied write access through another role, the user will not have write access. Because all users and clients are assigned the Tenant Member role, you cannot deny permissions to the Tenant Member role. Doing so would deny the given permission to every user in the tenant.
