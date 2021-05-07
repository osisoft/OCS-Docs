---
uid: export-missing-pi-points
---

# Export a list of missing PI points

Sometimes, a data transfer cannot transfer certain PI points because they have been removed from the source PI Server. When this occurs, PI to OCS flags the points as missing and displays a message.  You can view a .csv file that contains information about the missing PI points from the Transfer window using the Export Missing PI Point IDs button. This .csv file can be viewed in Excel or Notepad and contains the following information to help you troubleshoot and resolve missing PI points:

- Transfer name
- PI point IDs
- The name of the source PI Server

### Procedure

1. In the `PI to OCS Agents` window, select the transfer that contains the unresolved PI points.
2. Click the **View Transfer** button on the `Details` pane.

   The `Transfer` window opens.
3. Click the **Export Missing PI Point Ids** button.

   A file that contains a list of the missing PI points in the transfer opens.

