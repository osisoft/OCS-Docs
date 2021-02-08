---
uid: communities
---

# Communities

OCS communities help industrial users share operational data with their external business partners, service providers, and analytics providers. Sharing data helps OCS users generate more value from their data.

The data you share remains within your namespace. For others to see your data, you must share it with them. <!-- add link to sharing procedure?>

MORE OVERVIEW MATERIAL TO BE DEVELOPED HERE

Some random scenarios

- share data with users (such as contractors) without bringing them inside your corporate firewall
- helps prevent rogue data sharing (such as passed-around Excel spreadsheets)
- share data with customers so they can feel assured they are getting what they paid for (for example Dominion Power generation)
- share data without being onsite, necessary in a COVID world

## Community roles

When using Communities, you may need to [assign roles](xref:managecommunityusers#assign-user-roles) that grant permissions for certain types of actions. The following roles are available:

### Community Owner

The tenant who created the community. Currently, only this one tenant can be the Community Owner. Any tenant granted the Communities entitlement <!--this needs a link or more explanation> can create a community. By default, the Account Administrator is granted the privilege to create communities.

### Account Administrator

A tenant-level role assigned to users within a tenant that allows those users to administer their own tenant. Note that this user role will eventually be renamed "Tenant Administrator".

### Data Steward

A role granted the privilege to share their tenant’s data with any community they are a part of. This sharing privilege may be granted to other roles. 

### Community Member

The role representing a user in the community authorized to read any data shared in the community. 

### Community Moderator

The role assigned to a user within a community "member tenant" who manages the community for their tenant. Usually, a Community Moderator is the person who accepted the invitation on behalf of his or her community. This user must also be an Account Administrator within their own tenant. 

The Community Moderator's primary purpose is to manage what users from their tenant have access to the community. Community Moderators have all the privileges of a Community Member, plus the ability to:  

- Pause access to shared data from their tenant.
- Add or remove users from their tenant to the community
- Manage user access up to their role.
- Remove their tenant from the community

A Community Moderator can assign the Community Moderator role or Community Member role to any user in their own tenant. A Community Moderator cannot assign the Community Administrator role.

### Community Administrator

The role assigned to the user within the Community Owner's tenant. Community Administrators have full administrative rights to their community. These rights include all the privileges granted to a Community Moderator plus the ability to:

- Delete the community
- Invite and remove tenants from the community

Community Administrators can assign other users any Communities-based role including the Community Administrator role. Community Administrators can only assign roles to users within their own tenant, which, by definition, is the Community Owner's tenant.

### Community Member

The role representing a user in the community authorized to read any data shared in the community.  



