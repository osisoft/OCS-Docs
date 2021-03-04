---
uid: WhatAreTypes
---

# What are types?

A type defines the structure of data to be collected in OCS and is analogous to a template that defines each event in a stream of data. A type is also called a Sequential Data Store (SDS) type. The SDS is a streaming database optimized for storing sequential data, typically time-series data. You sue the SDS to store, retrieve, and analyze data. 

A type is comprised of at least two properties. One property serves as the primary index, usually a timestamp. The other properties are _value properties_, which hold the measurements for each event in a stream of data. Each value property can have a different type. OCS supports a wide variety of property types. 

For example, if you collect three measurements streamed from a device (longitude, latitude, and speed) over a period of time, you can define a type to include properties for longitude, latitude, speed and a timestamp. The timestamp is the primary index. Longitude, latitude, and speed are value properties. Collectively, these properties define the structure of the data OCS stores from the device.

For a list of the supported property types, see [Types](xref:sdsTypes).

After you create a type, you cannot change it (this ensures that no stored data is invalidated). Therefore, before you begin building streams in the SDS, make sure you have your types defined to your satisfaction. If you do have to change an existing type, you must delete the type and create a new one. However, you can only delete a type if no streams, views, or other types reference it.

OCS provides a simple user interface for creating types. 

Alternatively, you can create types using programming tools provided by OSIsoft: 

* For an automated programmatic approach, OSIsoft provides .NET client libraries available in NuGet packages. 
* For a manual approach, OSIsoft provides code samples in different programming languages, including Python, Java, and JavaScript. The JSON file format is used to specify the properties and related information in each type.