---
uid: community-manage-users
---

# Manage users in a community

Add users to make them Community Members, which are users that can view the community and the data streams shared by other tenants. You can only add users from your own tenant. Each tenant manages its own community membership.

## Prerequisites

[!include[prereq-community-admin](includes/prereq-community-admin.md)]

## Add users to a community

To add users from your own tenant to a community:

1. In the left pane, select **Data Management** > **Communities**.

1. Find the community where you want to add users and select **Details**.

1. On the **My Members** tab, select **Add Member**.

1. Select tenant users for membership. 

	**Tip:** If necessary, you can filter the list of users by typing in the **Filter users** field.

1. Select **Save**.

Each user is added to the community and assigned the Community Member role.

## Remove users from a community

To remove tenant users from a community:

1. In the left pane, select **Data Management** > **Communities**.

1. Find the community where you want to remove users and select **Details**.

1. On the **My Members** tab, select one or more users.

	**Tip:** If necessary, filter the list of users by typing in the **Filter members** field.

1. On the detail pane, select **Remove Member(s)**. When prompted for confirmation, select **Remove**.

The users that you remove from the community can no longer view it nor which data streams are shared within it.

## User from groups

The **Members** tab lists implicit users that hold community membership through a group. These users are denoted by the **From a Group** icon ![group](../_icons/default/account-group.svg). These implicit users cannot be edited individually. Instead, you must manage them through the group. For more information, see <xref:community-manage-groups>.