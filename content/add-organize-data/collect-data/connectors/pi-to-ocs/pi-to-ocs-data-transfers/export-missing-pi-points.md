---
uid: export-missing-points
---

# Export a list of missing PI points

Sometimes, PI points cannot be transferred because they have been removed on the source PI Server. When this occurs, the points are flagged as missing and a message is displayed. You can export a file that contains a list of these missing PI points for your records. The .csv file contains the following information:

- Transfer name

- The missing PI point IDs

- The name of the source PI Server

To export a list of PI points missing from a transfer:

1. In the left pane, select **Data Collection** > **PI to OCS Agents**.

1. In the `PI to OCS Agents` window, select the transfer that contains the unresolved PI points.
 
1. In the `Details` pane, select **View Transfer**.

1. In the `Transfer` window, select **Export Missing PI Point Ids**.

   The `Save As` window opens.

1. In the `Save As` window, navigate to the location where you want to save the file, enter a name for the .csv file, and then select **Save**.
