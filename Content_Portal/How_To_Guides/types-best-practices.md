---
uid: bpTypes
---

# Types Best Practices

<!-- David Moler: I think this topic is easier to explain with 2 extremes and 1 middle case: 
1) Data inextricably linked - all data must be present to interpret it (e.g. latitude & longitude, value & quality, <x, y, z>) - use the same type. 
2) Independent data - not always captured together, rarely used together, or must be independently secured - use separate types, relate via metadata keys. 
3) Always captured together but not inextricably linked - if data will be often used together and secured together and doesn't exceed 15 properties, use a single type. Otherwise split into multiple types. --> <!--This whole section needs reorganization. Recommendation: 1) what to include in types (see above), 2) creation and configuration (what to specify, what they mean, how to do it: API or SDK). -->

<!--Derek/Doug: Can you resolve these comments with David. -->

The following are best practices OSIsoft recommends for creating types and streams.

- When you create SDS types, the most important consideration to be aware of is that types are immutable. Once created, additional properties or information cannot be added and existing properties cannot be deleted.

- An SDS type  can include multiple data measurements of different data types. Each data measurement is a property of the type. In the  "Get Started with Types" procedure below, the SDS type, QuickStart.PumpState, has two measurements represented by the Temperature and Pressure properties. Each property describes the data fields. The user interface allows you to define the following fields for each property: Id, Name, Description, Type, and Key. At least one property in the SDS type must be an index, most commonly a timestamp. In the example below, the Timestamp property is the index. Each property is a value in each event of this type. Therefore, in an event of the QuickStart.PumpState type, there is a value for Timestamp, Temperature, and Pressure. <!-- Laureen: Because this topic will no  longer be tied to the Getting Started topic, I can add a screen capture and refer to it. -->

   Note: You may use the REST API or client libraries to define additional optional fields, including Value, Order, InterpolationMode, and UOM for each property. Therefore, it may be preferable to create types programmatically. 

   Ensure that each property is defined completely. A common error is to try to add Unit of Measure (UOM) to the type definition after it has been created, but UOM can only be defined on the type when it is created.  InterpolationMode and UOM on the type are inherited by the stream; however, these fields can be overridden. If they are not defined on the type, they can be added on the stream.  

- When multiple values share the same index and are frequently accessed together, consider grouping them as properties in the same SDS type. This is a more efficient way to manage your data and to transfer data into and out of OCS. For example, in the "Get Started with Types" procedure, both value properties use the DateTime index. Use a [stream view](xref:DataStorageConcepts#sds-stream-views) to view a subset of the type's properties.

- Define all of the properties of the SDS type at the time it is created. If you anticipate adding properties to the stream later, OSIsoft recommends that you create a separate stream for each property. 

- Where possible, include multiple value properties that use the same index in one SDS type. This is a more efficient way to manage your data and to transfer data into and out of OCS. In the following example, both Pressure and Temperature value properties use the DateTime index and the data values are read at the same time or index. 
  ![](C:/Users/lasato/source/repos/OCS-DOCS/lasato-ocs-get-start-doc/Content_Portal/Getting_Started/images/types-1.png)

  Do not include value properties that are read at different times or indices in the same SDS type. For example, if a device measures temperature every 30 seconds and pressure every 45 seconds, OSIsoft recommends that you define two types, one for temperature and one for pressure. Note: In this example, UOM is defined on each type and is inherited by the stream. 

  ![](C:/Users/lasato/source/repos/OCS-DOCS/lasato-ocs-get-start-doc/Content_Portal/Getting_Started/images/types-2.png)
  An alternative is to create a generic type with timestamp and value and use separate streams for temperature and pressure. The generic type is recommended in the following situations:

  - PI to OCS data or data transferred using the PI Adapters
  - When time intervals and the UOMs for the streams are unknown 
    ![](C:/Users/lasato/source/repos/OCS-DOCS/lasato-ocs-get-start-doc/Content_Portal/Getting_Started/images/types-3.png)
    In this instance, UOM is not defined on the type; it is added on the stream. 

- If you expect that different devices will have different sets of properties at different points in time, OSIsoft recommends that you use separate streams for each measurement. For example, you may have an instrument that currently measures temperature and pressure, but it may later also measure humidity. In this example, use separate streams for temperature and pressure. Later, if you add humidity, this data will be in its own stream. Using separate streams for each measurement simplifies managing the measurements in multiple devices over time.

- If properties are added to a type later, you must create a new type that includes all the properties of the original type, plus the new properties. Use a stream view to convert the existing streams to the new stream type and migrate the data. There are no values for the new properties for the existing streams, and null values are assigned. Before you migrate your data, be sure to consider the effect of the null values on your application and ensure that the application will not break if it encounters null values.

- For custom applications using the SDS client libraries or OSIsoft Messaging Format (OMF) OSIsoft recommends that you use the client libraries to define the type rather than defining them in the OSIsoft portal. This ensures that the type the application expects matches the type in the Sequential Data Store. You can also take advantage of the custom property fields such as UOM when defining a property using the .NET client libraries methods.

## Inherited Attributes

<!-- We might want to add some general discussion about inheritance of attributes and why/when you want to define these attributes on the type. -->