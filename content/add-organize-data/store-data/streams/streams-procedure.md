---
uid: gpStreams
---

# Add a stream

Sequential Data Store (SDS) stream data are values or events of the same SDS type. SDS stream data are stored in the Sequential Data Store and indexed by one or more properties defined by the stream's SDS type. 

To add a stream, follow these steps:

1. In the left pane, select **Data Management** > **Sequential Data Store**.
   
1. From the **Streams** dropdown, select **Streams**.
 
1. Select **Add Stream**.

1. In the `Add Stream` pane, complete the following fields:

 - **Id** &ndash; (Optional) Enter an identifier for referencing the stream. If you do not enter an Id, a GUID is generated.
   
 - **Name** &ndash; (Optional) Enter a user-friendly name for the stream. If you do not enter a name, the **Id** is used as the name. 
   
 - **Description** &ndash; (Optional) Enter a user-friendly description of the stream.
   
 - **Type** &ndash; SDS type identifier of the type used in this stream.

1. To add tags to the stream, select the **Tags** tab.

1. For each tag you want to add, enter the name of the tag in the **New Tag** field, and then click **+**. 

1. Select the **Metadata** tab.

1. For each metadata you want to add, select **Add Metadata**, and then in the **Metadata Key** and **Metadata Value** fields, enter the key and corresponding value for the metadata.

1. To save the stream, select **Save**.
