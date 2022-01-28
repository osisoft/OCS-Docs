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

  **Note:** Although this role has no permissions by default, it is intended for use with community administration permissions. See [Community administrators](#community-administrators-preview) for more information.

Some tenant roles are assigned permissions by default (Tenant Administrator, Tenant Contributor, Tenant Member). However, others are not (Tenant Contributor, Tenant Data Steward, Tenant Viewer, and Community Administrator). These roles without default permissions are intended to be customized; you must assign these roles permissions for individual system resources to best suit your organization.

For any resource, you can set access to it for specific roles rather than for specific users or clients. Manage access using Manage Permissions for the given resource. For each role, you set access to the following access types: Read, Write, Delete, and Manage Permissions. When managing permissions for the Sequential Data Store, an additional access type is available: Share. This permission allows users to share data streams from their tenant with a [community](xref:communities).

### Tenant custom roles 

In addition to the default tenant roles, you can create tenant custom roles for further access control. By default, tenant custom roles do not have any specific permissions assigned following their creation. You must add or remove permissions for each resource.

You must have the Tenant Administrator role to add and manage tenant custom roles.

### Community Member role (Preview)

The Community Member role is a role that can be shared among multiple tenants. It allows users from different tenants to access a [community](communities).

When a new community is created, the founding tenant automatically adds a new Community Member role to the system, which is named using the following convention:**_<Community Name>_ Community Member**. For example, if you create a new community named **TEST COMMUNITY**, a new community role is added to the tenant named **TEST COMMUNITY Community Member**.

This new role is also shared with other tenants that join the community. For example, a tenant that joins **TEST COMMUNITY** will have the **TEST COMMUNITY Community Member** role added to their tenant as well. 

Users assigned the Community Member role have read permissions within the community by default. However, to allow community members to share data streams within a community, you must assign the Share permission for streams to their assigned tenant roles.

#### Community administrators (Preview)

When a user creates or joins a new community, they are prompted to assign new community administration permissions to one or more existing roles. All users from your tenant that are assigned these roles inherit administrative permissions within the community, including the following actions:

- Modify the community name and description.

- Add and remove users and clients to/from the community.

- Assign roles that can administer the community.

- Pause the sharing of data from your tenant into the community.

- Withdraw from the community.

OCS includes a tenant role named Community Administrator that is assigned no permissions by default. Assigning community administrator permissions to this role is recommended.

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
