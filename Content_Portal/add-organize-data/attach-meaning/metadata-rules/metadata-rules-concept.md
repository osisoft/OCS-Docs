---
uid: ccAboutMetadataRules
---

# Add context with metadata rules

Metadata rules enable users to capture data streams based on specific data items, such as a plant location or device category. You create a metadata rule by defining a stream name pattern based on a selected stream name. The metadata rule captures all streams in a given namespace that match the stream name pattern defined in the rule. 

Therefore, stream names that follow a standard naming pattern, including items such as location, asset class, and asset ID, allow users to create rules based on this naming pattern. The application of the metadata to streams makes it easier for users to understand the data contained in the stream. 

The following diagram shows metadata in the context of several different but similar data streams.![Metadata and streams](images/streams.jpg) 

The diagram above shows three data streams for turbines named GEO1 and GEO2. 
1. The color-coded data streams show the specific data each stream is tracking, detailed in the Stream Metadata column. 

2. The basic description of the stream data is encoded in the stream name. For example, looking at the first stream in the table, the metadata rule takes what might have been meaningless to a user, GEO1_P.ACT_PV, and translates this.  The user sees that GEO1 is the name of the turbine and ACT_PV  or Active Power is the measurement in this stream.  

3. A metadata rule based on this stream naming pattern can capture active power values for all turbines in each wind farm. 
   

The OCS portal provides a wizard to create metadata rules. Users select a stream as the template for creating a metadata rule and define the criteria by which the metadata rule determines matching streams. ![Adding metadata](images/metadata1.jpg)

In the screen capture above, the wizard displays the stream name selected by the user, and it identifies each delimiter with a + sign. ![Adding metadata to streams](images/metadata2.jpg)

Each part of the stream name is assigned a metadata type. The screen capture above shows the different metadata types (wildcard, metadata, and string literal) that can be assigned to each delimited part of a stream name. 

•       In this example, all data is coming from wind turbines on a wind farm, The user knows that the first part of the stream name (GEO1 in the selected stream above) identifies the wind turbine. This rule uses a wildcard to capture streams for all turbines.  

•       The second part of the stream name (P.ACT in the selected stream above) has been assigned a metadata type of metadata. Metadata is defined as key-value pairs. For example*, P.ACT* is the key for *Active Power*. The user defines all key-value pairs for this part of the stream name. 

**Note**: Stream name parts designated as metadata are defined as key-value pairs. Each value occupying a part designated as metadata is categorized under a key defined for it. This typically takes the form of values recorded at different timestamp intervals for a particular object or device, or key. The key-value data structure facilitates analytical processing of stream data returned by a metadata rule. 

•       PV is defined as a string literal. In this example, it refers to the Pine Valley Wind Farm. 

•       As defined, this metadata rule captures streams for all turbines for Active Power in the Pine Valley Wind Farm.

   In addition to being applied to any existing streams, a metadata rule captures any matching streams that are subsequently added to the selected namespace. You can edit a metadata rule. The modified rule may then capture a different set of streams.

## Related Links

- [Create a metadata rule](xref:gpMetadataRules)