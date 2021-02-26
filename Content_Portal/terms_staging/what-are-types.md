---
uid: WhatAreTypes
---

# What are types?

A type, also called an SDS type, defines the structure of data to be collected in OCS. A type is analogous to a template that defines each instance, or event, in a stream of data. 

A type is comprised of at least two properties. One property serves as the primary index, commonly a timestamp. In addition, the type can have multiple other properties, called value properties. Those properties describe each event in a stream of data. Each value property can have a different property type. 

For example, if you want to collect three measurements streamed from a device (longitude, latitude, and speed) and you want to collect those measurements over a period of time, you can define a type to include properties for longitude, latitude, speed and a timestamp. The timestamp is the primary index. Longitude, latitude, and speed are value properties. Collectively, these properties define the structure of the data OCS stores from the device.

Before you begin building streams in the Sequential Data Store, make sure you have your types correctly defined. After you create a type, you cannot change it. If you want to change an existing type, you must delete the type and create a new one to ensure that no stored data is invalidated. However, you can only delete a type if no streams, views, or other types reference it.

OCS provides a simple user interface for creating types. Alternatively, you can create types using programming tools provided by OSIsoft. For an automated programmatic approach, OSIsoft offers .NET client libraries available in NuGet packages. For a manual approach, OSIsoft provides code samples in different programming languages, including Python, Java, and JavaScript. The JSON file format is used to specify the properties and related information in each type. 

OCS supports a wide variety of property types. For a list of the supported property types, see (Supported Types|link to Types in API section). 

