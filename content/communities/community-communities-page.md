---
uid: community-communities-page
---

# Communities page

The `Communities` page, accessible at **Data Management** > **Communities**, is the entry point for creating and participating in communities. Depending on your user roles and permissions, this page displays a different inventory of communities and options.

## Community list

Each OCS community that your tenant participates in is listed on the `Communities` page. From this page, you can review high level details for the community and view if you have access to view data streams from the community.

The following table describes each field listed for a community:

| Field | Description |
|--|--|
| **Tenants** | The number of tenants participating in the community. |
| **Date Created** | The date that the community was created. |
| **Sharing Status** | Indicates whether one or more tenant in the community is sharing data streams. Statuses include: <ul><li><img src="../_icons/custom/check-circle.svg" alt="Sharing Active"/> <strong>Sharing Active</strong>: No tenants in the community have paused sharing.</li><li><img src="../_icons/custom/pause-circle.svg" alt="Sharing Paused"/> <strong>Sharing Paused</strong>: One or more tenant in the community has paused sharing their data streams. The total number of tenants that have sharing paused are also listed.</li></ul> |
| **Member Status** | Indicates whether you are [Community Member](xref:community-community-roles#community-member) and can view data shared to the community within `Sequential Data Store`. If the field displays a status of ![information](../_icons/branded/information.svg) **Cannot view shared data**, then you are not a Community Member. If you are a Community Member, this field is omitted.<br><br>For more information on adding a Community Member, see <xref:community-manage-users>. |


Select **Details** to administrate the community. For more information on administrative actions, see the following topics:

- <xref:community-community-administration>
- <xref:community-tenant-administration>

You can also toggle the `Communities` page between the default list view and a card view.

| View | Icon | Description |
|--|--|--|
| **List view** | ![list view](../_icons/branded/view-list.svg) | Lists each community your tenant participates in as list items. |
| **Card view** | ![card view](../_icons/branded/view-grid.svg) | Lists each community your tenant participates in as cards. |

## Community toolbar

Use the controls available in the toolbar find, create, or manage a community.

| Control | Description |
|--------|-------------|
| **Filter Communities** | Type criteria to find a specific community. |
| **Add community**<sup>1</sup> | Creates a new community. For more information on this process, see <xref:community-workflow-create>. |
| **View invitations**<sup>1</sup> | View any invitations that your tenant has pending to join a community. For more information on pending invitations, see <xref:community-view-invitations>.
| **More options** ![More options](../_icons/default/dots-vertical.svg) > **Manage Default Community Administrators**<sup>1</sup> | Configures which roles are automatically added as the default Community Administrators while you are creating or joining a community. For more information, see <xref:communities-manage-default-admins>. |

<sup>1</sup>Requires [Community Administrator](xref:community-community-roles#community-administrators) permissions.
