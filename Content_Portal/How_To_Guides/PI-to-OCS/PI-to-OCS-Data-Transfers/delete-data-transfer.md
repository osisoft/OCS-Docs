---
uid: delete-data-transfer
---

# Delete a data transfer

You can delete a data transfer for a PI system connection. When you delete a data transfer, it does not remove any data that has already been transferred.  After you have removed a data transfer, you can add a new data transfer to the existing connection.

## Procedure

1. Sign in to the [OCS portal](https://cloud.osisoft.com/).
1. In the OCS portal, open the **Connections** page.
2. Select the PI System connection that contains the data transfer you want to delete.
3. **Optional:** If the data transfer has been started, click the **Stop** button in the **Details** pane, then click **Stop again**.
4. Click the **Remove** button. 
5. In the **Remove Transfer** message box, click **Remove** again.
**Result:** The data transferred is deleted.

**Note:** When you remove a PI point data transfer and its corresponding PI System connection, the associated SDS stream types, streams and transferred data does not get deleted in OCS. These will need to be deleted separately. To delete a stream’s history, delete the stream on the Streams section of the **Sequential Data Store** page.
