---
uid: community-manage-groups
---

# Manage groups in a community

Add groups to make its users Community Members, which are users that can view the community and the data streams shared by other tenants. You can only add groups from your own tenant. Each tenant manages its own groups.

## Prerequisites

- [!include[prereq-community-admin](includes/prereq-community-admin.md)]

- Your tenant must be configured for one or more identity provider enabled. For more information, see <xref:identityProviders>.

## Add groups to a community

To add groups from your own tenant to a community:

1. In the left pane, select **Data Management** > **Communities**.

1. Find the community where you want to add groups and select **Details**.

1. On the **My Groups** tab, select **Add Group**.

1. Select tenant groups for membership. If necessary, you can filter the list of groups by typing in the **Filter groups** field.

1. Select **Save**.

Each group is added to the community and its users are assigned the Community Member role.

## Remove groups from a community

To remove tenant groups from a community:

1. In the left pane, select **Data Management** > **Communities**.

1. Find the community where you want to remove groups and select **Details**.

1. On the **My Groups** tab, select one or more groups. A details pane appears. If necessary, filter the list of groups by typing in the **Filter groups** field.

1. On the detail pane, select **Remove Groups**. When prompted for confirmation, select **Remove**.

The groups that you remove from the community can no longer view it nor which data streams are shared within it.
