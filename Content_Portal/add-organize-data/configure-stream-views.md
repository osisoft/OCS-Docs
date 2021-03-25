---
uid: task-configureStreamViews
---

# Configure stream views
Stream views provide flexibility in the use of types and allow you to expose data as a different type. 
While you cannot actually change the properties of types themselves, the stream views feature enables you to create a view of a selected stream that appears as if you had changed the type on which it is based.
You can use stream views to change the appearance of the data stream while keeping the archived events intact. 
You create a stream view by choosing a source and target type and mapping properties of the two types.
Note that you can only map properties of the same data type (double with int16, for example).

For more information, see [stream views](xref:WhatOCSdoes#stream-views).
If you already have types and streams configured with data, go directly to step 4:

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

2. Create a stream based on the source type.
  - Click **Streams**.
  - Create a stream based on the source type.
    - Click **+ Add Stream**. 
    - In **Stream Id**, add *source-stream*.
    - From **Type Id**, select *source-type*.
 
3. Add data into the stream. 
  - Check the box next to *source-stream*.
    - Click **Data**.
    - Add data into *source-stream*.
      - Click **+ Add Event**.
      - Add data. 
   ```json
 { "timestamp": "2021-01-01T00:00:00Z", "value": 113.1 },
 { "timestamp": "2021-01-18T02:00:00Z", "value": 15  }, 
 { "timestamp": "2021-02-3T04:00:00Z", "value": -24.9, }, 
 { "timestamp": "2021-02-208T06:00:00Z", "value": 0.4 }, 
 { "timestamp": "2021-03-8T08:00:00Z", "value": 2001.2}
  ```
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
   
        **Note:** Mapped properties must be of the same data type. 
   - Click **Save**.
5. Check how stream view transformed your data in the API console. 
   - Go to **Developer Tools** > **API Console**.
   - In **URI**, enter the following endpoint in the URI and click **Get**.
```text
/Namespaces/{yourNamespace}/Streams/source-stream/Data/Transform?startIndex=2021-01-01&count=100&streamViewId=stream-view
```
  - Note changes in the displayed data.
  
```json
 { "timestamp-target": "2021-01-01T00:00:00Z", "measurement": 113 },
 { "timestamp-target": "2021-01-18T02:00:00Z", "measurement": 15  }, 
 { "timestamp-target": "2021-02-3T04:00:00Z", "measurement": -24, }, 
 { "timestamp-target": "2021-02-208T06:00:00Z", "measurement": 0 }, 
 { "timestamp-target": "2021-03-8T08:00:00Z", "measurement": 2001}
``` 