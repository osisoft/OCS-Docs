---
uid: community-manage-clients
---

# Manage clients in a community

Clients are applications that act on behalf of users and allow programmatic access from APIs to shared data and resources. The `Community Details` page lets you add existing clients to a community. You can only add [client-credentials clients](xref:ccClients) from your own tenant.

## Prerequisites

To manage clients in a community:

- [!include[prereq-community-admin](includes/prereq-community-admin.md)]

- There must be at least one existing client-crediential client added to the tenant (which is typically done by a Tenant Administrator). For more information, see <xref:gpClientCredentialsClient>.

## Add clients to a community

To add a client to a community:

1. In the left pane, select **Data Management** > **Communities**.

1. Find the community where you want to add clients and select **Details**.

1. On the `Community Details` page, select the **My Clients** tab.

1. Select **Add Client**.

1. Select the clients to add. If necessary, filter the list of clients by typing in the **Filter clients** field.

1. Select **Add**.

## Remove clients from a community

Remove a client from a community to remove an application's access to the REST API. To remove a client from a community:

1. In the left pane, select **Data Management** > **Communities**.

1. Find the community where you want to remove clients and select **Details**.

1. On the `Community Details` page, select the **My Clients** tab.

1. Select a client to remove. If necessary, filter the list of clients by typing in the **Filter clients** field. 

1. Select **Remove Client**. When prompted for confirmation, select **Remove** again.
