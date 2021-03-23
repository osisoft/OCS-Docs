---
uid: task-configureStreamViews
---

# Configure stream views
Stream views provide flexibility in the use of types and allow you to expose data as a different type. 
While you cannot actually change the properties of types themselves, the stream views feature enables you to create a view of a selected stream that appears as if you had changed the type on which it is based. You create a stream view by choosing a source and target type then a set of mappings between properties of those two types.
For more information, see [stream views](xref:WhatOCSdoes#stream-views). To configure stream views, follow this procedure:

1. Create types. Go to **Data Management** > **Sequential Data Store**.
  - Click **Types**.
  - Create the source type. 
      - Click **+ Add Type**.
      - Enter *source-type* in **Id**.
      - Select base type *none*.
      - Add property.
        - Add *timestamp*, check **Key Id** and select *DateTime* as **Type**.
        - Add *value*, select *Double* as **Type**.
  - Create the target type and name it *target-type*.
      - Click **+ Add Type**.
      - Enter *target-type* in **Id**.
      - Select base type *none*.
      - Add property.
        - Add *timestamp-target*, check **Key Id** and select *DateTime* as **Type**.
        - Add *measurement*, select *Int16* as **Type**. 
2. Create streams.
  - Click **Streams**.
  - Create a stream based on the source type.
    - Click **+ Add Stream**. 
    - Add *source-stream* as **Stream Id**.
    - Select *source-type* from **Type Id**.
  - Create another stream based on the target type. 
    - Click **+ Add Stream**.
    - Add *target-stream* as **Stream Id**.
    - Select *target-type* from **Type Id**
3. Add data into the streams. 
  - Check the box next to *source-stream*.
    - Click **Data**.
    - Add data into *source-stream*.
      - Click **+ Add Event**.
      - Add data. 
  - Click **Streams** again. 
  - Check the box next to *target-stream*.  
    - Click **Data**.  
    - Add data into *target-stream*.
      - Click **+ Add Event**.
      - Add data. 
4. Create a stream view.
   - Click **Stream Views**.
   - Click **+ Add Stream View**.
     - Enter *stream-view* as **Id**.
     - Select *source-type* as the source type.
     - Select *target-type* as the target type.
   - Click **Next**. 
   - Specify property mapping. 
     - Click **+ Property Mapping**.
     - On the left of the arrow, select **value** from the list.  
     - On the right of the arrow, select **measurement** from the list.
   - Click **Save**.
5. Check how stream view transformed your data in the API console. 
   - Go to **Developer Tools** > **API Console**.
   - In **URI**, enter the following endpoint in the URI and click **Get**.
```text
/Namespaces/{yourNamespace}/Streams/source-stream/Data/Transform/?startIndex={earliestDateWithData}&count=100&streamViewId=stream-view
```