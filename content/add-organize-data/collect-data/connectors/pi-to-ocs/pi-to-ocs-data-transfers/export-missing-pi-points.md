---
uid: export-missing-points
---

# Export a list of missing PI points

Sometimes, PI points cannot be transferred because they have been removed on the source PI Server. When this occurs, the points are flagged as missing and a message is displayed.  You can export a file that contains a list of these missing PI points for your records. The .csv file contains the following information:

- Transfer name
- The missing PI point ID(s)
- The name of the source PI Server

### Procedure

1. In the **PI to OCS Agents** window, select the transfer that contains the unresolved PI points.
 
1. Click the **View Transfer** button on the `Details` pane.

   **Result:** The `Transfer` window opens.

1. Click the **Export Missing PI Point Ids** link.

   **Result:** The **Save As** dialog box opens.

1. Enter a file name and select where to save the file, then click **Save**.
  
   **Result:** A .csv file that contains a list of missing PI points is saved.
