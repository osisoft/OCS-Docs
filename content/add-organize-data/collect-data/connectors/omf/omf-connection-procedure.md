---
uid: gpOMFConnection
---

# Configure an OMF connection

To send OSIsoft Message Format (OMF) data to OCS, you must first configure an OMF connection.

## Procedure

1. In the left pane, select **Security** > **Clients**.

1. Verify that there is at least one client credentials client to use in the OMF connection. If you need to create one, refer to the Clients section.

1. Click on the menu and click **Connections** (under Data Management).

1. From the **Namespace** field, select the namespace in which you want the OMF data written.

1. From the **Type** dropdown list, select **OMF**.

1. Click **Add Connection** to open the `Add PI System Connection` window.

1. In the **Name** field, enter a name for the OMF connection, and click **Next**.

1. In the **Clients** tab, click one of the clients in the **Available** list to add it to the **Selected List**. Click **Next**.

1. In the **Namespaces** tab, verify that the namespace where you want the data written appears in the **Selected** list. Click **Next**.
   
1. In the **Review** tab, verify that the **Clients** list shows the client credentials client you chose. Verify that the **Namespace** list displays the namespace where you want the data written. Click **Save**.  

An application can now use the selected client credentials client to write OMF data to the specified namespace.
