---
uid: gsOMFConnection
---

# Get Started with OMF Connections

To send OSIsoft Message Format (OMF) data to OCS, you must first configure an OMF connection. Use this getting started procedure to become familiar with OMF connections.

1. Click the ![Menu icon](images\menu-icon.png) icon and click **Clients** (below Security) to open the Manage Clients page.

2. Verify that there is at least one client credentials client to use in the OMF connection. If you need to create one, refer to the Clients section.

1.  Click on the menu and click **Connections** (under Data Management).

2.  From the **Namespace** field, select _QuickStart_.

3.  From the **Type** drop-down list, select **OMF**.

4.  Click **Add Connection** to open the Add PI System Connection window.

5.  In the **Name** field, enter _QuickStart_ and click **Next**.

6.  In the Clients tab, click one of the clients in the Available list to add it
    to the Selected List. Click **Next**.

    Note: For the purposes of this Getting Started exercise, you may choose any client.

7.  In the Namespaces tab, verify that the QuickStart namespace appears in the
    Selected list. Click **Next**.

8.  In the Review tab, verify that the Clients list shows the client credentials
    client you chose, and the Namespace list shows the QuickStart namespace.
    Click **Save**.

    An application can now use the selected client credentials client to write OMF data to the QuickStart namespace.

11. Follow these tips to learn more about OMF connections.

     **Tip:** Click **Manage Permissions** to open the Manage Permissions window.

     Note: In this window, you configure permissions only on the connection object itself. Click **Cancel** to continue.

     **Tip:** Click **Edit Connection** to open the Edit window.

     Use this window to edit the name and description of the connection. Enter the new name _QuickStartEdit_ and enter the description _OMF Connection used by OCS Quick Start_. Click **Next**, and then click **Save** when you are done.
