---
uid: gsStreams
---

# Get started with streams

<!-- Joyce: Do you think this terse intro is sufficient? I am reluctant to get into more detail about streams because we run into the problem of repeating what is covered in the About streams topic. -->

After creating your types, you can add streams and associate a type with the stream. For more information on streams, see the following:

- [About streams](xref:ccStreams)
- [PI Core counterpart](xref:ccStreams#streams-pi-core)
- [Streams best practices](xref:bpStreams)

## Procedure

1. Click the ![Menu icon](images\menu-icon.png) and click **Sequential Data Store** (under Data Management).

1. Click **Streams**. From the **Namespace** drop-down list, select MyOCS.

1. Click the **Manage Default Stream Permissions** icon above the tree on the left.  
    This opens the Manage Default Permissions for New Streams window where default permissions for streams created in the selected namespace are configured. 
   
    Note: By default, you must be assigned the Tenant Administrator role to change the default permissions. Any changes only affect new streams. It does not change the permissions on already existing steams.   
    When you are done reviewing the permissions, click **Cancel** to continue.
   
1. Click **Add Stream**.

1. In the Add Stream window, enter the following:

   - Stream Id &ndash; MyOCS.NorthAmerica.SLTC.PumpA
   - Description &ndash; SDS Stream used by My OCS
   - Type ID &ndash; MyOCS.PumpState

    Note: Leave the Name field blank. By default, it will take the value of the Stream Id.

1. Click **Save**.

1. In the **Search...** field, enter _TypeId:MyOCS.PumpState_. 

    This searches for streams that use the MyOCS.PumpState type. 

1. Select the newly created stream in the list and in the right panel, select the **Metadata and Tags** tab.

1. Click **Add Tag**.

1. In the input field, type *OSIsoft*, and click anywhere outside of the text box to add the tag. 

    Note: You can click the tag to edit it, or click the *X* to delete it from the stream.

1. Click **Add Metadata**.

1. In **Enter Metadata key...**, type *Site*, and in in **Enter Metadata value...**, enter *SLTC*. 

    Note: You can click either of these fields to edit them later, click the *X* to delete it from the stream, or click the *i* <!-- add screen capture here --> to see who last changed this metadata key.

1. In the **Search...** field, enter *Site:SLTC*. 

    This searches for streams that have the metadata key *Site* and the value *SLTC*. This search query returns the MyOCS stream. 
   
    Note: Use quotation marks around the value if there are spaces in the text.
    
1. Select the MyOCS.NorthAmerica.SLTC.PumpA stream and click **Manage Data**. 

    This allows you to run queries against the data in the stream and to add, edit, and remove events.

1. Click **Add Event**.

1. In the Add Event window, enter the following: 

   - Status &ndash; Running
   - Value &ndash; 3.14
   - Timestamp &ndash; Leave at default, which should be current time

1. Click **Save**. 

    The event appears as the latest value in the stream.

## Next step

Continue with [Get started with roles](xref:gsRoles).