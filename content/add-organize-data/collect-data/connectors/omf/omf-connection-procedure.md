---
uid: gpOMFConnection
---

# Configure an OMF connection

You must configure an OMF connection to send OSIsoft Message Format (OMF) data to OCS.

## Prerequisite

An OMF connection requires a client-credentials client.

## Procedure

To configure an OMF connection:

1. In the left pane, select **Data Collection** > **OMF Connections**.

1. In the toolbar, select **Add Connection**.

   The `Add Connection` pane appears.

1. In the `Add Connection` pane, complete the following fields:

   - **Name** - Enter a name for the OMF connection.

   - **Description** - (Optional) Enter a description for the connection.

1. From the **Clients** dropdown, select the client that you want to use for authentication.

1. Select **Save**.

An application can now use the selected client-credentials client to write OMF data to the specified namespace.
