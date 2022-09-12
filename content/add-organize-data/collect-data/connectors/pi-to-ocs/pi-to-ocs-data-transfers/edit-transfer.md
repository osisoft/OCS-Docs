---
uid: edit-transfer
---

# Edit a transfer

You can edit saved transfer settings and add or remove AF elements and/or PI points with Edit Mode. You must be the owner of a stream or asset to remove it from a transfer and cloud storage.

**Note:** Your transfer settings affect whether streams and data get replicated or deleted from cloud storage after you have removed elements or explicit PI points from a transfer. See [Name the transfer and set data privacy settings](xref:transfer-data) for details.

<!-- VTT: Add note about how the Opt-in setting (Transfer Settings window) affects streams/assets being deleted from cloud storage or replicated, depnding on the client's preference/option selection.-->

To edit an existing transfer:

1. In the `PI to OCS Agents` page, select the agent that contains the transfer you want to edit.

1. Select **View/Edit Transfer**.

1. In the transfer pane, select the **Edit Mode** toggle.

   Edit mode is enabled and the **Search** pane opens. 

1. (Optional) To add PI points to a transfer, enter search criteria on the **PI Point Search** tab, select **Search**, select desired PI points, then select **Add PI Points to Transfer**. 

1. (Optional) To add AF elements to a transfer, enter search criteria on the **AF Elements Search** tab, select **Search**, select desired PI points, and then select **Add AF Elements to Transfer**.

1. (Optional) To remove PI points from a transfer, select the **PI Points** tab, select the PI points you want removed, select **Remove Points**, then select **Remove** to confirm.
 
   **Note:** You can only remove explicit PI points from a transfer. To remove implicit PI points from a transfer, you will need to remove the associated AF element. 

1. (Optional)  To add the removed PI points back to the transfer, select **Undo Last Point Removal**.

1. (Optional) To remove AF elements from a transfer, select the **AF Elements** tab, select the AF elements you want removed, select **Remove Elements**, then select **Remove**.

   The removed AF elements are marked as **Removed** in the **AF Elements** list. 

   **Note:** Any implicitly referenced PI points that are not referenced by another AF element will also be removed from the transfer.

1. (Optional) To add the removed PI points back to the transfer, select **Undo Last Element Removal** .
 
1. (Optional) To open the `Transfer Settings` dialog box and edit transfer settings, select **Settings** and then perform the desired action(s):

    * To change the transfer name and description, enter a new name and description in the **Name** and **Description** fields.
    
    * To change the transfer's historical start time, enter or select a new time in the **Historical Start Time** field.
    
    * To change the transfer's data privacy settings, select one of the **Stream Metadata Replication Policy** options.  

    * To change whether streams or assets or removed automatically, select or deselect the **Automatically remove Streams and Assets** option.

1. After transfer edits are done, select **Save** to retain these changes and return to the `PI to OCS Agents` page.

   **Note:** If a transfer was started and in progress when edits were made, these changes will be processed after the transfer is saved.
