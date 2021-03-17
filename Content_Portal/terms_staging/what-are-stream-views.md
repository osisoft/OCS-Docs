---
uid: WhatAreStreamViews
---

# What are stream views?

Stream views provide a flexible mechanism for viewing streaming data. A stream view is essentially a logical overlay that allows you to create arbitrary mappings to streaming data. With stream views, you are not constrained by the [type](xref:WhatAreTypes), which cannot be modified. 

You create a stream view by choosing a source type and a target type. Then you create a set of mappings between the properties of those two types.

For example, a process engineer and a maintenance technician might want to see different data that exists in the same stream. You cannot change the structure of data in the stream, but a stream view allows you to show a subset of the data. With stream views you can change the appearance of the data stream to meet the needs of both users without changing the original data.

In addition, stream views can perform other functions, such as converting units of measure and changing names so the terminology that is displayed is more appropriate for a particular audience.

OCS provides a graphical interface for setting up stream views, or you can use REST APIs to define stream views programmatically. If you are using the .NET framework, OSIsoft also offers client libraries to help you create and use stream views.
