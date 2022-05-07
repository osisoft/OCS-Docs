---
uid: gsStreams
---

# Get started with streams

After creating types, you can add streams and associate a type with the stream. A stream is a container that holds data. For more information on streams, see the following topics:

- [Streams](xref:ccStreams)

- [Streams best practices](xref:bpStreams)

## Procedure

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. From the **Streams** dropdown list, select **Streams**. 
   
1. Select **Add Stream**.

1. In the `Add Stream` window, enter the following values for these fields:

   - **Id** - *MyData.NorthAmerica.SLTC.PumpA*

   - **Name** - Leave this field blank. By default, it will take the value of the Stream Id.

   - **Description** - *SDS Stream used by MyData*

   - **Type** - *MyData.PumpState*


1. Select the **Tags** tab.

1. In the **New Tag** field, enter *OSIsoft*, and select **+** to add the tag. 

    **Note:** Select the **X** to delete the tag from the stream.

1. Select the **Metadata** tab and select **Add Metadata**.

1. In the **Metadata Key** field,  enter *Site*, and in **Metadata Value**, enter *SLTC*. 

    **Note:** Select the **X** to delete metadata from the stream. Once the stream is created, you can make changes to the tags and the metadata.

1. Select **Save**.

1. In the **Search** field, enter *Site:SLTC*.

    This search query searches for streams that have the metadata key *Site* and the value *SLTC*, and returns the MyData stream. 
   
    **Note:** 
    
    - Use quotation marks around the value if there are spaces in the text.
    
    - You can also search by the Type Id. If you enter *TypeId:MyData.PumpState*, it returns the `MyData.NorthAmerica.SLTC.PumpA` stream.
    
1. Select the **MyData.NorthAmerica.SLTC.PumpA** stream and select **Manage Data**. 

    This allows you to run queries against the data in the stream and to add, edit, and remove events.

1. Select **Add Event**.

1. In the `Add Event` window, complete the following fields: 

    - **Status** &ndash; Enter *Running*.

    - **Pressure** &ndash; Enter *325*.

    - **Temperature** &ndash; Enter *21*.
    
    - **Timestamp** &ndash; Leave this setting as it appears, displaying the current time.

1. Select **Save**. 

    The event appears as the latest value in the stream. 

## Next step

Continue with [Get started with roles](xref:gsRoles).
