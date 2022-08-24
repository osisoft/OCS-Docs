---
uid: communities-manage-default-admins
---

# Manage default community administrators

When you create or join a community, you are prompted to assign community administration permissions to one or more role within your tenant. By default, these permissions are assigned to two default system roles: Community Administrator and Tenant Administrator. However, you can update these default roles to any system role. For example, you can configure a custom system role named `Community Manager` as the default community administrator.

## Prerequisites

[!include[prereq-community-admin](includes/prereq-community-admin.md)]

## To manage default community administrators

To manage default community administrators:

1. In the left pane, select **Data Management** > **Communities**.

1. Select **More Options** ![More Options](../_icons/default/dots-vertical.svg) > **Manage Default Community Administrators**.

1. Add or remove roles as default community administrators. 

	To add a role, select **Add Roles** and then select **Add Role** ![add role](../_icons/branded/plus.svg) for any role that you want to function as community administrator. 

	To remove a role, select **Remove Role** ![Remove Role](../_icons/branded/window-close.svg).

1. Select **Save**.

The default community administrator roles are updated. The next time that you create or join a community, the community administrator defaults to your settings.

**Note:** Updating default community administrators does not affect permissions for existing communities. To update permissions for existing communities, edit their permissions that are already in place. For more information, see <xref:community-manage-administrators>.
