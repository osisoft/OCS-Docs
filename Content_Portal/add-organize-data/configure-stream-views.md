---
uid: configure-stream-views
---

# Configure stream views
Stream views provide flexibility in the use of types and allow you to expose data as a different type. 
While you cannot actually change the properties of types themselves, the stream views feature enables you to create a view of a selected stream that appears as if you had changed the type on which it is based. You create a stream view by choosing a source and target type then a set of mappings between properties of those two types.
For more information, see [stream views](xref:WhatOCSdoes#stream-views). To configure stream views, follow this procedure:

1. Create types. 
  - Create the source type.
  - Create the target type. 
2. Create streams.
  - Create a stream based on the source type. 
  - Create another stream based on the target type. 
3. Add data into the streams. 
  - Add data into stream xx
```json
sample data 
```
  - Add data into stream yy
```json
sample data
```
4. Create a stream view. 
5. Check stream view in the API console. 
