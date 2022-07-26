---
uid: streams-manage-streams
---

# Manage streams

The Sequential Data Store gives you capabilities to manage stored streams. The capabilities function the same if you are working in the context of a namespace or a community.

## Streams best practices

The following best practices are recommended when [creating streams](#add-a-stream):

- Ensure that the default stream permissions are configured before you begin creating streams. While you can later do a bulk update of stream permissions, it is easier to configure the default permissions before the streams are created. Permissions that vary from the default are configured on the individual streams.

- Use a meaningful pattern when naming streams. For example, a naming pattern might be "*Company_name*.{*Region*}.{*Site*}.{*Equipment*}". This makes it possible for tools, such as metadata rules, to use this naming schema to find relevant data. Metadata like this can also be stored as key-value pairs on the stream, but a well-defined naming pattern allows metadata to be generated automatically. 

- Use the stream description field, metadata, and tags to capture any other relevant information about the stream. This information is useful to search for specific streams in the system, especially as systems become large. If possible, use consistent patterns in description, metadata, and tags.

   - Use metadata for information that follows a specific or consistent pattern, such as the location, manufacturer, and site. 
   
   - Use tags for simple information about the stream that does not adhere to any particular pattern.
   
   - Use the description field for longer descriptions of the stream and what it represents.

## Add a stream

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

## Remove streams

When you remove a stream, you are deleting it.

1. From the left pane, select **Data Management** > **Sequential Data Store**.

1. Select one or more streams.

1. Select **More options** ![More options icon](../../../_icons/default/dots-vertical.svg) > **Remove Stream**.

1. In the confirmation window, select **Remove** to confirm the deletion.
