---
uid: community-community-roles
---

# Community roles

To allow different tenants and users participating in a community to safely and securely share data streams with one another, OSIsoft Cloud Services (OCS) includes several user roles specifically for communities. These roles include granular permissions to allow different tenants and users to share specific data streams while keeping the remaining, unshared data streams private. When using Communities, you must assign the appropriate community roles to users that administrate or participate in the community.

Communities include the following roles, ordered from least privileged to most privileged.

## Community Member

The Community Member role is a role that can be shared among multiple tenants. This role is authorized to read any data shared in the community.

When a new community is created, a new Community Member role is automatically added to the system, which is named using the following convention: `<Community Name> Community Member`. For example, if you create a new community named `Test Community`, a new community role is added to the tenant named `Test Community Community Member`.

This new role is also shared with other tenants that join the community. For example, a tenant that joins `Test Community` will have the `Test Community Community Member` role added to their tenant as well. 

Users assigned the Community Member role have read permissions within the community by default. However, to allow community members to share data streams within a community, you must assign the Share permission for streams to their assigned tenant roles.

- For more information on assigning the Community Member role to users (or unassigning it), see <xref:community-manage-users>.

- For more information on the actions Community Members can perform, see <xref:community-data-sharing>.

## Community Administrators

Community administrator permissions are required to perform administrative actions for the community within the scope of the tenant, such as community membership management.

When a tenant creates or joins a new community, they are prompted to assign new community administration permissions to one or more existing roles. All users from your tenant that are assigned these roles inherit administrative permissions within the community. 

- For more information on assigning community administrator permissions to an existing user role, see <xref:community-manage-administrators>.

- For more information on the actions that Community Administrators can perform, see <xref:community-tenant-administration>.

### Administrative Tenant

Each community has an administrative tenant, which is the tenant that administers the community itself. When you create a new community, your tenant is automatically configured as the administrative tenant. Users assigned community administrator permissions on the administrative tenant have additional permissions for managing the community itself that affect all tenants within it. 

In addition to the tasks listed in <xref:community-tenant-administration>, Community Administrators for the Administrative Tenant can also perform the tasks listed in  <xref:community-community-administration>.
