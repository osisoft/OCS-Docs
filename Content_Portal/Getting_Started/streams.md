---
uid: gsStreams
---

# Get Started with Streams

Find the Streams page in the OSIsoft Cloud Services portal [here](https://cloud.osisoft.com/data/streams). <!-- FYI: looks like the UI might be changing. Refer to cloud.osisoft.com main page-->

1. Click the menu icon and click **Sequential Data Store** (under Data Management).

1. Click **Streams**. From the **Namespace** drop-down list, select QuickStart.

1. Click the **Manage Default Stream Permissions** icon above the tree on the left.  
    This opens the Manage Default Permissions for New Streams window where default permissions for streams created in the selected namespace are configured. 
   
    Note: Permissions to change the defaults are restricted to Account Administrators. Any changes that are made here do not change the permissions on already existing streams.  
    When you are done reviewing the permissions, click **Cancel** to continue.
   
1. Click **Add Stream**.

1. In the Add Stream window, enter the following:

   - Stream Id &ndash; QuickStart.NorthAmerica.SLTC.PumpA
   - Description &ndash; SDS Stream used by OCS Quick Start
   - Type ID &ndash; QuickStart.PumpState

    Note: Leave the Name field blank. By default, it will take the value of the Stream Id.

1. Click **Save**.

1. In the **Search...** field, enter _TypeId:QuickStart.PumpState_. 

    This searches for streams that use the QuickStart.PumpState type. 

1. Select the newly created stream in the list and in the right panel, select the **Metadata and Tags** tab.

1. Click **Add Tag**.

1. In the input field, type *OSIsoft*, and click anywhere outside of the text box to add the tag. 

    Note: You can click the tag to edit it, or click the *X* to delete it from the stream.

1. Click **Add Metadata**.

1. In **Enter Metadata key...**, type *Site*, and in in **Enter Metadata value...**, enter *SLTC*. 

    Note: You can click either of these fields to edit them later, click the *X* to delete it from the stream, or click the *i* <!-- add screen capture here --> to see who last changed this metadata key.

1. In the **Search...** field, enter *Site:SLTC*. 

    This searches for streams that have the metadata key *Site* and the value *SLTC*. This search query returns the QuickStart stream. 
   
    Note: Use quotation marks around the value if there are spaces in the text.
    
1. Select the QuickStart.NorthAmerica.SLTC.PumpA stream and click **Manage Data**. 

    This allows you to run queries against the data in the stream and to add, edit, and remove events.

1. Click **Add Event**.

1. In the Add Event window, enter the following: 

   - Status &ndash; Running
   - Value &ndash; 3.14
   - Timestamp &ndash; Leave at default, which should be current time

1. Click **Save**. 

    The event appears as the latest value in the stream.
