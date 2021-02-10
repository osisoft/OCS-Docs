---
uid: communityroles
---

# Community roles

When using Communities, you must [assign users to roles](xref:managecommunityusers#assign-user-roles) that grant permissions for certain types of actions. The following roles are possible:

## Community Member

The role representing a user in the community authorized to read any data shared in the community.

## Data Steward

A role granted the privilege to share a tenant’s data with any community to which the data steward belongs. A data steward can grant this sharing privilege (that is, the data steward role) to other roles.

## Community Moderator

The role assigned to a user within a community "member tenant" who manages the community for their tenant. Usually, a Community Moderator is the person who accepted the invitation on behalf of his or her tenant. This user must also be an Account Administrator within their own tenant. 

The Community Moderator's primary purpose is to manage what users from their tenant have access to the community. Community Moderators have all the privileges of a Community Member, plus the ability to:  

- Pause access to shared data from their tenant.
- Add or remove users from their tenant to the community
- Manage user access up to their role.
- Remove their tenant from the community

A Community Moderator can assign the Community Moderator role or Community Member role to any user in their own tenant. A Community Moderator cannot assign the Community Administrator role.

## Community Administrator

The role assigned to the user within the Community Owner's tenant. Community Administrators have full administrative rights to their community. These rights include all the privileges granted to a Community Moderator plus the ability to:

- Delete the community
- Invite and remove tenants from the community

Community Administrators can assign other users any Communities-based role including the Community Administrator role. Community Administrators can only assign roles to users within their own tenant, which, by definition, is the Community Owner's tenant.

## Related user classifications

In addition to the roles you can assign in Communties, you should be aware of the following related roles and user classifications:

### Account Administrator

A tenant-level role that allows those users to administer their own tenant. Account Administrators are OCS roles rather than Community roles. In OCS user roles are managed as part of the Security component. Note that this user role will eventually be renamed "Tenant Administrator".

### Community Owner

The tenant who created a community. A Community Owner is not a role and is not granted any privileges. By default Account Administrators are granted the privilege to create communities.