Before data can be shared into a community and accessed by external tenants, a user with the **Share** permission on one or more streams in the `Sequential Data Store` must share the streams into a community that they have read access to. By default, the [Tenant Data Steward](xref:ccRoles) role is intended for users in the tenant to share resources with other external tenants using communities. However, the Tenant Data Steward role is not assigned the **Share** permission on streams by default. Therefore, an administrative user assigned **Manage Permissions** on the streams must first grant the Tenant Data Steward role (or another role) the **Share** permission on streams before they can be shared by users within that role. 

## Prerequisites

[!include[prereq-share-streams](prereq-share-streams.md)]

## To enable stream sharing permissions

1. From the left pane, select **Data Management** > **Sequential Data Store**.

1. Select one or more streams that you want to allow sharing on.

1. From the right pane, select **Manage Permissions**.

	**Note:** If you only have one stream selected, select **More options** ![More options icon](../../_icons/default/dots-vertical.svg) > **Manage Permissions** instead.

1. From **Select Role**, choose a role that you want to modify permissions for. Using the **Tenant Data Steward** role is recommended, but you can use any role.

1. Select the **Allow** checkbox for the **Share** access type.

1. Select **Save**.

To configure different roles to allow different data stewards to share different sets of data, do not use the default Tenant Data Steward role and instead create the number of roles needed to manage this within your organization. Then repeat the steps above to grant the share permission for those roles on the specific sets of streams/data that each role will manage.
