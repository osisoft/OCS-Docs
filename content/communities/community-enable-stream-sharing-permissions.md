---
uid: community-enable-stream-sharing-permissions
---

# Enable stream sharing permissions

Before data can be shared into a community and accessed by external tenants, a user with the **Share** permission on one or more streams in the `Sequential Data Store` must share the streams into a community that they have read access to. By default, the [Tenant Data Steward](xref:ccRoles) role is intended for users in the tenant to share resources with other external tenants using communities. However, the Tenant Data Steward role is not assigned the **Share** permission on streams by default. Therefore, an administrative user assigned **Manage Permissions** on the streams must first grant the Tenant Data Steward role the **Share** permission on streams before they can be shared by users within that role. Granting **Share** permissions to the Tenant Data Steward role is recommended, but you can give those permissions to other roles instead.

## Prerequisites

[!include[prereq-share-streams](includes/prereq-share-streams.md)]

## To enable stream sharing permissions

When enabling stream sharing permissions, you can either enable them for an entire namespace or on specific streams, stream-by-stream basis. Enabling streams for an entire namespace is more convenient; enabling specific streams is more secure.

### [Namespace](#tab/tabid-1)

You can change permissions for all streams in a namespace with a single action. 

1. From the left pane, select **Data Management** > **Sequential Data Store**.

1. From the **Namespace** dropdown list, select the namespace that includes the streams that you want to share.

1. Select **More options** ![More options](../_icons/default/dots-vertical.svg) > **Manage Default Permissions**.

	The the `Manage Default Permissions for New Streams` window opens.

1. Allow **Share** permissions for the user roles that you want to be able to share data.  

	1. Update each applicable **Share** permission dropdown list to **Allow**. If necessary, select **Add Role** to add a new role.

	1. Select **Apply to all existing streams in the namespace**. 
	
	![Share permissions: Allow](images/stream-permissions-share-namespace.png)

	**Note:** For more information on this window, see [Manage Permissions window](xref:permissions-management#manage-permissions-window).

1. Select **Save**.

### [Specific streams](#tab/tabid-2)

To apply sharing permission to specific streams in a namespace:

1. From the left pane, select **Data Management** > **Sequential Data Store**.

1. Select one or more streams that you want to allow sharing on.

1. From the right pane, select **Manage Permissions**.

	**Note:** If you only have one stream selected, select **More options** ![More options icon](../_icons/branded/dots-vertical.svg) > **Manage Permissions** instead.

	The `Manage Permissions for Streams` window opens.

1. For user roles that you want to have the ability to share data, update each **Share** permission dropdown list to **Allow**.

	![Share permissions: Allow](images/stream-permissions-share.png)

	**Tips:** For more information on this window, see [Manage Permissions window](xref:permissions-management#manage-permissions-window).

1. Select **Save**.

***
