---
uid: gpOMFConnection
---

# Configure an OMF Connection

To send OSIsoft Message Format (OMF) data to OCS, you must first configure an OMF connection. 

## Procedure

1. Click the ![Menu icon](images\menu-icon.png) icon and click **Clients** (below Security) to open the Manage Clients page.

2. Verify that there is at least one client credentials client to use in the OMF connection. If you need to create one, refer to the Clients section.

1.  Click on the menu and click **Connections** (under Data Management).

2.  From the **Namespace** field, select the namespace in which you want the OMF data written.

3.  From the **Type** drop-down list, select **OMF**.

4.  Click **Add Connection** to open the Add PI System Connection window.

5.  In the **Name** field, enter a name for the OMF connection, and click **Next**.

6.  In the Clients tab, click one of the clients in the Available list to add it
    to the Selected List. Click **Next**.

7.  In the Namespaces tab, verify that the namespace where you want the data written appears in the Selected list. Click **Next**.
    
8.  In the Review tab, verify that the Clients list shows the client credentials
    client you chose. Verify that the Namespace list displays the namespace where you want the data written. Click **Save**.
    
An application can now use the selected client credentials client to write OMF data to the specified namespace.
    
