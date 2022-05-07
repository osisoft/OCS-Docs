---
uid: ClientMaintenance
---

# Maintain a client

## Prerequisite

You must have the role of Tenant Administrator to add and manage clients.

## Edit a client

To edit an existing client:

1. In the left pane, select **Security** > **Clients**.

1. In the **Client Type** field, select the appropriate client type.

1. Select an existing client.

1. Select **Edit Client**.

1. Make any desired changes to the client configuration.

1. Select **Save**.

## Remove a client

To remove an existing client:

1. In the left pane, select **Security** > **Clients**.

1. In the **Client Type** field, select the appropriate client type.

1. Select an existing client.

1. Select **Remove Client**.

1. Select **Remove** to confirm.

## Create a new secret

To create a new secret for an existing Client-Credentials or Hybrid client:

1. In the left pane, select **Security** > **Clients**.

1. In the **Client Type** field, select the appropriate client type.

1. Select the client in the list.

1. Select **Add Secret** in the `Details` pane.

1. (Optional) In the **Description** field, enter a description for the client secret.

1. In the **Expiration Date** field, enter a date and time that the secret expires.

   Ensure that the expiration date is valid for the secret. By default, the secret is set to expire one year after creation. Select the **Never Expires** checkbox to specify that the secret does not expire. Secrets can be deleted later, including secrets that are set to never expire.

1. Select **Add**.  

## Edit secret details

To edit secret details for a client:

1. In the left pane, select **Security** > **Clients**.

1. In the **Client Type** field, select the appropriate client type.

1. Select the client in the list.

1. Select an existing secret and select **Edit Secret** in the `Details` pane.

1. Make any changes and select **Save**.

## Remove a secret

To remove a secret from a client:

1. In the left pane, select **Security** > **Clients**.

1. In the **Client Type** field, select **Hybrid**.

1. Select the client in the list.

1. Select an existing secret and select **Remove Secret** in the `Details` pane.

1. Select **Remove** to confirm.
