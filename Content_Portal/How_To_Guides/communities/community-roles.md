---
uid: communityroles
---

# Community roles

When using Communities, you must [assign users to roles](xref:managecommunityusers#assign-user-roles) that grant permissions for certain types of actions.

In Communities, the following roles are possible, ordered from least privileged to most privileged:

## Community Member

The role authorized to read any data shared in the community.

## Community Moderator

A role that  manages the community for a tenant. Usually, a Community Moderator is the individual who accepted the invitation to join a community on behalf of a tenant. 

The Community Moderator's primary purpose is to specify which tenant's users have access to a community. Community Moderators have all the privileges of a Community Member, plus the ability to:  

- Add users from their tenant to the community
- Remove their tenant's users from the community
- Remove their tenant from the community

Community Moderators can assign the following roles to users in their own tenant:

- Community Member
- Community Moderator

## Community Administrator

A role granting full administrative rights. These rights include all the privileges granted to a Community Moderator plus the ability to:

- Delete the community
- Invite tenants to the community
- Remove tenants from the community

Community Administrators in the [community owner's](#community-owner) tenant can assign any role to any user in any tenant belonging to the community. Community Administrators in tenants other than the community owner's tenant can assign any role to users in their own tenant.

## Related roles and identities

In addition to the roles you can assign in Communities, be aware of the following related roles and identities:

### Tenant Administrator

A tenant-level role that allows users to administer their own tenant. Tenant Administrators are roles that apply to all of OCS rather than just to Communities. In OCS, user roles are managed as part of the Security component.

### Data Steward

A tenant-level role that can share a tenant’s data with any community to which the data steward belongs. A data steward can grant this sharing privilege (that is, the data steward role) to other users in their own tenant.

### Community Owner

The tenant who created a community. A community owner is not a role and is not granted any privileges. By default Tenant Administrators are granted the privilege to create communities.
