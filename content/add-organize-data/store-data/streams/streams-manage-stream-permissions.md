---
uid: streams-manage-stream-permissions
---

# Manage stream permissions

If you are assigned the **Manage Permissions** access right, then you can configure stream permissions for other user roles in your tenant. You can granularly assign individual stream permissions to each user role in your tenant.

## Prerequisites

To manage data stream permissions, your user role must be assigned the **Manage Permissions** access right.

## Manage default permissions for new streams

Each time that a user adds a new stream to the `Sequential Data Store`, that stream is automatically assigned a profile of default permissions for each user role in your tenant. You can edit these default permissions from the `Sequential Data Store`. 

To manage default permissions added when a [new stream is created](xref:streams-manage-streams#add-a-stream), complete the following steps:

1. From the left pane, select **Data Management** > **Sequential Data Store**.

1. Select **More options** ![More options icon](../../../_icons/dots-vertical.svg) > **Manage Default Permissions**.

1. Configure permissions for each role.

	### [To add permissions to a role](#tab/add-permissions)

	For each **Role**, select whether each stream permission is allowed or denied. Permissions that are undefined default to a setting of **Deny**. For more information on each permission, see [Stream permissions](#stream-permissions).

	- To allow a permission for a role, select ![allow](../../../_icons/check.svg)**Allow**.

	- To explicitly deny a permission for a role, select <!-- TODO: add icon -->**Deny**.

	### [To add a new role](#tab/add-role)

	Tab content-2-1.

	***

	<details>
		<summary><strong>Tips:</strong></summary>
		<ul>
			<li><p>If you want to deny a permission for user role, leaving it undefined is recommended.</p></li>
			<li><p>To clear all permission settings for a role, select <strong>Refresh</strong>.</p></li>
			<li><p>For a description of each permission, mouse over each column <strong>Info</strong> <img src="../../../_icons/info.svg"/> icon.</p></li>
		</ul>
	</details>

1. Select **Save**.

## Manage permissions for a single stream

To manage permissions for a single data stream, complete the following steps:

1. From the left pane, select **Data Management** > **Sequential Data Store**.

1. Select a single stream.

1. Select **More options** ![More options icon](../../../_icons/dots-vertical.svg) > **Manage Permissions**.

1. In the `Manage Permissions` window, from **Select Role**, choose the role whose permissions you want to modify.

1. Select the permissions to grant to the selected role, and then select **Save**.

## Manage permissions for multiple streams

Fugiat voluptate nisi dolore elit aute pariatur. Magna est aute cupidatat enim occaecat amet dolor qui id consequat enim. Aliquip commodo deserunt duis consequat pariatur proident dolor reprehenderit ipsum nostrud ex enim.

### [Patch](#tab/patch)

Enim pariatur eu ex fugiat. Tempor nisi consequat qui amet esse do culpa est mollit ea ut deserunt irure. Aute Lorem reprehenderit cupidatat amet velit ex ut nisi amet. Ut aliqua est amet nisi.

### [Replace](#tab/replace)

Aliqua nostrud in aute excepteur consectetur cupidatat aute minim ea mollit veniam dolore deserunt. Pariatur ex laboris excepteur minim dolore quis aute excepteur Lorem laboris veniam culpa. Duis ullamco ut tempor enim nisi nulla deserunt anim. Laboris in sunt labore eu sint et esse proident.

***

## Manage permissions for all streams

Deserunt elit ea culpa esse voluptate pariatur nostrud nulla aliqua consectetur cupidatat qui. Quis est reprehenderit duis aliquip esse quis reprehenderit irure esse et et. Eiusmod occaecat id labore veniam culpa nulla tempor reprehenderit cillum veniam ipsum consequat magna. Occaecat nulla quis aliqua consectetur. Ex consectetur ut nisi commodo. Anim velit eiusmod commodo nostrud magna quis.

## Stream permissions

When editing permissions for data streams, you can explicitly allow or deny data stream permissions based on user role. Each user assigned a role listed in the **Manage Permissions** dialog inherits the permissions that you configure. The following table describes each permission that you can assign to a user role:

<!-- TODO: Test individual stream permissions -->

| Permission | Description |
|--|--|
| **Read** | Allows users to view data streams details in `Sequential Data Store`. |
| **Write** | Allows user to edit data stream details, metadata, and tags. |
| **Delete** | Allows users to delete existing data stream details, metadata, and tags. |
| **Manage Permissions** | Allows users to assign permissions to one or more selected data streams. |
| **Share** | Allows user to share a data stream into a community. |
