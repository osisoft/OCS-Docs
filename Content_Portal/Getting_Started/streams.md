# Streams

Sequential Data Store (SDS) stream data are values or events of the same SDS type. SDS stream data are stored in the Sequential Data Store and indexed by one or more properties defined by the stream's SDS type.

The SDS stream is the container that holds the data. When a stream is created, it is scoped to a specific namespace. An SDS type is defined for that stream that determines the values and events in the stream, their data type, and the property or properties used to index the data. Once the stream is created, the SDS type cannot be changed.

The SDS stream container uses metadata and tags to define information about the stream container itself. Metadata are key-value pairs that add context to the data (for example, the metadata key "Manufacturer" and a metadata value "Caterpiller" ), and tags are string values that represent stream attributes, for example, region. Organizing data using metadata tags and tags makes it much easier to retrieve data streams.

### PI Core Counterpart

An SDS stream is comparable to a PI point in the PI Data Archive. For example, a float32 PI point might be sent to OSIsoft Cloud Services as an SDS stream with a type that contains a timestamp index and float32 value. If you use PI to OCS to import data into SDS, each PI point in the PI Data Archive will be created in SDS as individual stream and the data itself will be added as values in the stream.

## Best Practices for Creating Streams

- Ensure that the default stream permissions are configured before you begin creating streams. While you can later do a bulk update of stream permissions, it is easier to configure the default permissions before the streams are created. Permissions that vary from the default are configured on the individual streams. 

- OSIsoft recommends you use a meaningful pattern when naming your streams. For example, a naming pattern might be "QuickStart.{Region}.{Site}.{Equipment}". This makes it possible for OCS tools, such as metadata rules, to use this naming schema to find relevant data. Metadata like this can also be stored as key-value pairs on the stream, but a well-defined naming pattern allows metadata to be generated automatically. 

  <!-- I removed the following  and added a note in step 5 below telling them to leave it blank. --> <!-- 3. Use the stream name to provide a more readable name for the string than the stream ID itself. -->

- Use the stream description field, metadata, and tags to capture any other relevant information about the stream. This information is useful for searching for specific streams in the system, especially as systems become large. If possible, use consistent patterns in description, metadata, and tags.
   - Use metadata for information that follows a specific or consistent pattern, such as the location, manufacturer, and site. 
   - Use tags for simple information about the stream that doesn't adhere to any particular pattern.
   - Use the description field for longer descriptions of the stream and what it represents.

## Get Started with Streams

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
