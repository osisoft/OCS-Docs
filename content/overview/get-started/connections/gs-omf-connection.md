---
uid: gsOMF
---

# Get started with OMF connections

To send OSIsoft Message Format (OMF) data to OCS, you must first configure an OMF connection. For more information about OMF connections, see [OMF best practices](xref:bpOMFConnection).

Use this get started procedure to become familiar with OMF connections.

To create an OMF connection:

1. In the left pane, select **Security** > **Clients**.

1. Verify that there is at least one client-credentials client to use in the OMF connection. If you need to create one, see [Clients](xref:ccClients).

1. In the left pane, select **Data Collection** > **OMF Connections**.

1. In the **Namespace** field, select `MyData`.

1. Select **Add Connection** to open the `Add Connection` pane.

1. In the **Name** field, enter *MyData*.

1. In the **Clients** dropdown list, select a client in the list and select **Save**.

   **Note:** For the purposes of this exercise, you may choose any client.

   An application can now use the selected client-credentials client to write OMF data to the `MyData` namespace.

1. To learn more about OMF connections, do the following:

   - Select **Manage Permissions** to open the `Manage Permissions` window.

     In this window, you configure permissions only on the connection object itself. Select **Cancel** to continue.

   - Select **Edit Connection** to open the `Edit` window.

     Use this window to edit the name and description of the connection. Enter the new name *MyDataEdit* and enter the description *OMF Connection used by MyData*. When you are done, select **Next** until you get to the **Review** tab, and then select **Save**.

## Next step

If you have not already completed [Get started with PI to OCS connections](xref:gsPItoOCS), do this next. Otherwise, continue with [Get started with types](xref:gsTypes).
