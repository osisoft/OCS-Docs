Scroll down to see the procedure for streams.

# Add a type

Sequential Data Store (SDS) types define the shape and structure of events and how to associate events with streams of data. See the following for more information about types:

- [About types](xref:ccTypes)
- [Types best practices](xref:bpTypes)

## Procedure

1. Click the ![Menu icon](../images/menu-icon.png) icon and click **Sequential Data Store** (under Data Management).

2. From the **Namespace** drop-down list at top left, select the namespace in which you want the type created. If necessary, you can filter namespaces by typing in the **Filter Namespaces** box.
![Select namepace and types or stream](../images/callouts-for-types-streams.png)

3. From the **Streams** drop-down menu, select **Types**.  

4. Click **Add Type**.

5. In the `Add Type` window, provide the following information:

   - **Id** &ndash; Enter an identifier for referencing the type.
   - **Name** &ndash; Enter a user-friendly name.
   - **Description** &ndash; Enter descriptive text that you can use to identify the type.
   - **Base Type** &ndash; Select a previously created type on which the new type will be based. The type you are creating will inherit the properties of the base type. Inherited properties are read only.

6. To add a property, take the following steps:   
   a. Click **Add Property**.   
   b. If the property will be an index, click **Key**. Multiple index properties are allowed. If necessary, you can reorder index properties by dragging and dropping them.   
   c. For **Id** and **Name**, enter an identifier and a name for the property. By default Id and Name are the same.   
   d. To specify the property type, click in the **Property** field. A dialog for filtering types opens.   
   e. If necessary, filter property types by typing in the **Filter Types** box. You can also select **System** or **Tenant** to filter by system property types and tenant property types. Tenant property types are property types that were previously created in your namespace.   
   f. Optionally, specify a unit of measure by clicking in the **UOM** field and selecting a unit of measure.

7. Repeat the previous step to add more properties.

8. When you are done adding properties, click **Apply**. After a type is created, it cannot be edited.

## Related links

- [Types](xref:sdsTypes) API


# Add a stream

Sequential Data Store (SDS) stream data are values or events of the same SDS type. SDS stream data are stored in the Sequential Data Store and indexed by one or more properties defined by the stream's SDS type. See the following for more information about streams:

- [About streams](xref:ccStreams)
- [Streams best practices](xref:bpStreams)

## Procedure

1. Click the ![Menu icon](../images/menu-icon.png) icon and click **Sequential Data Store** (under Data Management).

2. From the **Namespace** drop-down list at top left, select the namespace in which you want the type created. If necessary, you can filter namespaces by typing in the **Filter Namespaces** box.
![Select namepace and types or stream](../images/callouts-for-types-streams.png)

3. From the **Streams** drop-down menu, select **Streams** if it is not already selected.  

4. Click **Add Streams**.

5. In the `Add Stream` window, provide the following information:

   - **Id** &ndash; Enter an identifier for referencing the stream.
   - **Name** &ndash; Enter a name for the stream.
   - **Description** &ndash; Enter a user-friendly description of the stream.
   - **Type** &ndash; Select the type used in this stream. If necessary, you can filter types by typing in the **Filter Types** text box.

6. To add a tag, perform the following steps:   
   a. Select the **Tags** tab.   
   b. In the **New Tag** text box, type the name of the metadata tag and click ![Add](../images/add-button.png).<br>**Note:** Click **X** next to a tag name to delete the tag from the stream.

7. To add metadata, perform the following steps:   
   a. Select the **Metadata** tab.   
   b. Click **Add Metadata**.   
   c. Enter a value for `Metadata key` and `Metadata Value`. A metadata key is required.<br>**Note:** You can click either of these fields to edit them later, click the **X** to delete it from the stream, or click the ![Information](../images/info.png) to see who last changed this metadata key.

# Edit a stream

1. Click the ![Menu icon](../images/menu-icon.png) icon and click **Sequential Data Store** (under Data Management).

2. From the **Namespace** drop-down list at top left, select the namespace in which you want the type created. If necessary, you can filter namespaces by typing in the **Filter Namespaces** box.
![Select namepace and types or stream](../images/callouts-for-types-streams.png)

3. From the **Streams** drop-down menu, select **Streams** if it is not already selected.  

4. Select a stream to edit.

5. Select **More Options** ![More Options](..\images\MoreOptions.png "More Options") and click **Edit Stream**.

5. In the `Edit Stream` window, you can edit the following information:   
   - **Name** &ndash; Enter a name for the stream.
   - **Description** &ndash; Enter a user-friendly description of the stream.
 
6. To add or remove tags, select the **Tags** tab and take any of the following steps:
   - To delete a tag from the stream, click **X** next to a tag name.   
   - To add a new tag, type the name of the tag in the **New Tag** text box and click ![Add](../images/add-button.png).

7. To add, edit, or remove metadata, select the **Metadata** tab and take any of the following steps:   
   - To add metadata, click **Add Metadata** and enter a value for **Metadata key** and **Metadata Value**. A metadata key is required.
   - To edit metadata, enter new values for **Metadata key** and **Metadata Value**.
   - To delete metadata, click the **X** next to that row of metadata.

## Related links

- [Streams](xref:sdsStreams) API