---
uid: sdsWritingDataApi
---

# API calls for writing data

#### Example Type, Stream, and Data

Many of the API methods described below contain example requests and responses in JSON to highlight usage and specific behaviors. The following type, stream, and data are used in the examples.

**Example Type**  
``SimpleType`` is an SdsType with a single index and two additional properties. This type is defined below in .NET, Python, and Javascript:

###### .NET
```csharp
public enum State
{
   Ok,
   Warning,
   Alarm
}

public class SimpleType
{
   [SdsMember(IsKey = true, Order = 0) ]
   public DateTime Time { get; set; }
   public State State { get; set; }
   [SdsMember(Uom = "meter")]
   public Double Measurement { get; set; }
}
```
###### Python
```python
class State(Enum):
  Ok = 0
  Warning = 1
  Alarm = 2

class SimpleType(object):
  Time = property(getTime, setTime)
  def getTime(self):
    return self.__time
  def setTime(self, time):
    self.__time = time

  State = property(getState, setState)
  def getState(self):
    return self.__state
  def setState(self, state):
    self.__state = state

  Measurement = property(getValue, setValue)
  def getValue(self):
    return self.__measurement
  def setValue(self, measurement):
    self.__measurement = measurement
```
###### JavaScript
```javascript
var State =
{
  Ok: 0,
  Warning: 1,
  Alarm: 2,
}

var SimpleType = function () {
  this.Time = null;
  this.State = null;
  this.Value = null;
}
```

**Example Stream**  
``Simple`` is an SdsStream of type ``SimpleType``.

**Example Data**  
``Simple`` has stored values as follows:

      11/23/2017 12:00:00 PM: Ok  0
      11/23/2017  1:00:00 PM: Ok 10
      11/23/2017  2:00:00 PM: Ok 20
      11/23/2017  3:00:00 PM: Ok 30
      11/23/2017  4:00:00 PM: Ok 40

All times are represented at offset 0, GMT.

*****

## `Insert Values`

Inserts data into the specified stream. Returns an error if data is already present at the index of any event.

**Request**

        POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data

**Parameters**  
``string tenantId``  
The tenant identifier  
  
``string namespaceId``  
The namespace identifier  
  
``string streamId``  
The stream identifier  

**Request Body**  
A serialized list of one or more events of the stream type  

**Response**  
The response includes a status code

**_Notes_**  
This request will return an error if an event already exists for any index in the request. If any individual index encounters a problem, the entire operation is rolled back and no insertions are made. The `streamId` and `index` that caused the issue are included in the error response.

**Example**  
The following request is used to insert events into stream `Simple` of `SimpleType`,

        POST api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data

where the request body specifies the values to insert: 
```json
[
    {
        "Time": "2017-11-23T17:00:00Z",
        "State": 0,
        "Measurement": 50
    },
    {
        "Time": "2017-11-23T18:00:00Z",
        "State": 0,
        "Measurement": 60
    }
]
```

**.NET Library**
```csharp
    Task InsertValueAsync<T>(string streamId, T item);
    Task InsertValuesAsync<T>(string streamId, IList<T> items);
```

**********************

## `Patch Values`

Modifies the specified stream event(s). Patching affects only the data item parameters that are included in the call.

**Request**

       PATCH api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
		    ?select={selectExpression}

**Parameters**  
``string tenantId``  
The tenant identifier
  
``string namespaceId``  
The namespace identifier  
  
``string streamId``  
The stream identifier 
  
``string selectExpression``  
Comma separated list of strings that indicates the event fields that will be changed in stream events  

**Request Body**  
A serialized collection of one or more patch property events

**Response**  
The response includes a status code

Consider you have a stream `Simple` of `SimpleType`, to change one property, `Measurement`, for one event specify the following request
        
       PATCH api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data
		    ?select=measurement

With the following request body,
```json
[
  {  
    "Time":"2017-11-23T12:00:00Z",
    "Measurement":500.0
  }
]
```

This request will only change the `Measurement` value at the specified event index. 

**_Notes_**  
Patching is used to patch the events of the selected fields for one or more events in the stream. Only the fields indicated in `selectExpression` are modified. The events to be modified are indicated by the index value of each entry in the collection. 

If there is a problem patching any individual event, the entire operation is rolled back and the error will indicate the `streamId` and `index` of the problem.  

**.NET Library**
```csharp
    Task PatchValueAsync(string streamId, string selectExpression, T item);
    Task PatchValuesAsync(string streamId, string selectExpression, IList<T> items);
```

**********************

## ``Remove Values``

There are two options for specifying which events to remove from a stream:
* [Index Collection](#removeindexcollection): One or more indexes can be specified in the request. 
* [Window](#removewindow): A window can be specified with a start index and end index.

<a name="removeindexcollection"></a>
### `Index Collection`

Removes the event at each index from the specified stream. Different overloads are available to make it easier to indicate the index where you want to remove a data event. 

**Request**  

        DELETE api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
		    ?index={index}[&index={index}…]

**Parameters**  
``string tenantId``  
The tenant identifier  
  
``string namespaceId``  
The namespace identifier   
  
``string streamId``  
The stream identifier  
  
``string index``  
One or more indexes of events to remove

**Response**  
The response includes a status code

**_Notes_**  
If any individual event fails to be removed, the entire operation is rolled back and no events are removed. The streamId and index that caused the issue are included in the error response. 

If you attempt to remove events at indexes that have no events, an error is returned. If this occurs, you can use [Window](#removewindow) request format to remove any events from a specified ‘window’ of indexes, which will not return an error if no data is found.

**.NET Library**
```csharp
    Task RemoveValueAsync(string streamId, string index);
    Task RemoveValueAsync<T1>(string streamId, T1 index);
    Task RemoveValueAsync<T1, T2>(string streamId, Tuple<T1, T2> index);

    Task RemoveValuesAsync(string streamId, IEnumerable<string> index);
    Task RemoveValuesAsync<T1>(string streamId, IEnumerable<T1> index);
    Task RemoveValuesAsync<T1, T2>(string streamId, IEnumerable<Tuple<T1, T2>> 
```

<a name="removewindow"></a>
### `Window`

Removes events at and between the start index and end index.

**Request**

        DELETE api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
		    ?startIndex={startIndex}&endIndex={endIndex}

**Parameters**  
``string tenantId``  
The tenant identifier  
  
``string namespaceId``  
The namespace identifier   
  
``string streamId``  
The stream identifier  
  
``string startIndex``  
The index defining the beginning of the window

``string endIndex``  
The index defining the end of the window  

**Response**  
The response includes a status code

**_Notes_**  
If any individual event fails to be removed, the entire operation is rolled back and no removes are done.

**.NET Library**
```csharp
    Task RemoveWindowValuesAsync(string streamId, string startIndex, string endIndex);
    Task RemoveWindowValuesAsync<T1>(string streamId, T1 startIndex, T1 endIndex);
    Task RemoveWindowValuesAsync<T1, T2>(string streamId, Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex);
```

***********************  

## ``Replace Values``

Writes one or more events over existing events in the specified stream.

**Request**

        PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
		    ?allowCreate=false

**Parameters**  
``string tenantId``  
The tenant identifier  
  
``string namespaceId``  
The namespace identifier   
  
``string streamId``  
The stream identifier  
 
**Request Body**
A serialized list of one or more events of the stream type

**Response**  
The response includes a status code

**_Notes_**  
This request returns an error if the stream does not have an event to be replaced at the specified index. If any individual event fails to be replaced, the entire operation is rolled back and no replaces are performed. The index that caused the issue and the streamId are included in the error response.

**.NET Library**
```csharp
    Task ReplaceValueAsync<T>(string streamId, T item);
    Task ReplaceValuesAsync<T>(string streamId, IList<T> items);
```

***********************

## `Update Values`

Writes one or more events to the specified stream.

**Request**

        PUT api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data

**Parameters**  
``string tenantId``  
The tenant identifier  
  
``string namespaceId``  
The namespace identifier   
  
``string streamId``  
The stream identifier  

**Request Body**  
A serialized list of one or more events of the stream type

**Response**  
The response includes a status code

**_Notes_**  
This request performs an insert or a replace depending on whether an event already exists at the event indexes. If any item fails to write, the entire operation is rolled back and
no events are written to the stream. The index that caused the issue is included in the error response.

**.NET Library**
```csharp
    Task UpdateValueAsync<T>(string streamId, T item);
    Task UpdateValuesAsync<T>(string streamId, IList<T> items);
```

***********************