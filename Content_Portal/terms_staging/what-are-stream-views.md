---
uid: WhatAreStreamViews
---

# What are stream views?

<!-- Dave the changes I made here were about making this topic consistent with Ji Won’s topic about configuring stream views. I suggest adding a link to that topic-->
A stream view is essentially a logical overlay that enables you to view streaming data in a way that is most useful to you. Stream views provide flexibility in the use of types, allowing you to expose data as a different type. While you cannot actually change the properties of types themselves, stream views enable you to create a view of a selected stream that appears as if you had changed the type on which it is based. You create a stream view by choosing a source and target type then a set of mappings between properties of those two types.
For example, a process engineer and a maintenance technician might want to see different data that exists in the same stream. You cannot change the structure of data in the stream, but a stream view allows you to show a subset of the data. With stream views you can change the appearance of the data stream to meet the needs of both users without changing the original data.
In addition, stream views can perform other functions, such as converting units of measure and changing names so the terminology that is displayed is more appropriate for a particular audience.
OCS provides a graphical interface for setting up stream views, or you can use REST APIs to define stream views programmatically. If you are using the .NET framework, OSIsoft also offers client libraries to help you create and use stream views.
For more information about types, see [type](xref:WhatAreTypes).
For information about setting up a stream view, see [Configure stream views](xref:task-configureStreamViews).
