---
uid: sdsReadingDataApi
---
# API calls for reading data

#### Example type, stream, and data

Many of the API methods described below contain example requests and responses in JSON to highlight usage and specific behaviors. The following type, stream, and data are used in the examples.

**Example type**  
``SimpleType`` is an SdsType with a single index. This type is defined below in .NET, Python, and Javascript:

#### [.NET](#tab/tabid-1)
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
#### [Python](#tab/tabid-2)

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
#### [JavaScript](#tab/tabid-3)
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
***

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

## ``Get First Value``

Returns the first value in the stream. If no values exist in the stream, null is returned.

#### Request  
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/First
 ```

##### Parameters
``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

#### Response
The response includes a status code and a response body containing a serialized event.

#### .NET client libraries method
```csharp
   Task<T> GetFirstValueAsync<T>(string streamId, string streamViewId = null);
```
****

## ``Get Last Value``

Returns the last value in the stream. If no values exist in the stream, null is returned.

#### Request  
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Last
 ```

##### Parameters

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier 

``string streamId``  
The stream identifier

#### Response
The response includes a status code and a response body containing a serialized event.

#### .NET client libraries method
```csharp
   Task<T> GetLastValueAsync<T>(string streamId, string streamViewId = null);
```
****

## ``Find Distinct Value``

Returns a stored event based on the specified `index` and `searchMode`. 

#### Request  
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
		?index={index}&searchMode={searchMode}
 ```

##### Parameters
``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string index``  
The index

``string searchMode``  
The [SdsSearchMode](xref:sdsReadingData#sdssearchmode), the default is ``exact``

#### Response
The response includes a status code and a response body containing a serialized collection with one event. 

Depending on the request `index` and `searchMode`, it is possible to have an empty collection returned.

##### Example request 
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data
		?index=2017-11-23T13:00:00Z&searchMode=Next
 ```

The request has an index that matches the index of an existing event, but since a `SdsSearchMode` of ``next`` was specified, the response contains the next event in the stream after the 
specified index:

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T14:00:00Z",
        "State": 0,
        "Measurement": 20
    }
]
```

##### Example request 
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data 
        ?index=2017-11-23T13:30:00Z&searchMode=Next
 ```

The request specifies an index that does not match an index of an existing event. The next event in the stream is retrieved.

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json
   
[
    {
        "Time": "2017-11-23T14:00:00Z",
        "State": 0,
        "Measurement": 20
    }
]
```
#### .NET client libraries methods
```csharp
   Task<T> FindDistinctValueAsync<T>(string streamId, string index, 
      SdsSearchMode searchMode = SdsSearchMode.Exact, string streamViewId = null);
   Task<T> FindDistinctValueAsync<T, T1>(string streamId, Tuple<T1> index, 
      SdsSearchMode searchMode = SdsSearchMode.Exact, string streamViewId = null);
   Task<T> FindDistinctValueAsync<T, T1, T2>(string streamId, Tuple<T1, T2> index, 
      SdsSearchMode searchMode = SdsSearchMode.Exact, string streamViewId = null);
```
****

## ``Get Values``

Returns a collection of *stored* values at indexes based on request parameters. 

SDS supports three ways of specifying which stored events to return:  
* [Filtered](#getvaluesfiltered): A filtered request accepts a [filter expression](xref:sdsFilterExpressions).
* [Range](#getvaluesrange): A range request accepts a start index and a count.
* [Window](#getvalueswindow): A window request accepts a start index and end index. This request has an optional continuation token for large collections of events.

<a name="getvaluesfiltered"></a>
### `Filtered`  

Returns a collection of stored values as determined by a `filter`. The `filter` limits results by applying an expression against event fields. Filter expressions are explained in detail in the [Filter expressions](xref:sdsFilterExpressions) section.

#### Request  
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data 
		?filter={filter}
 ```

##### Parameters 
``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string filter``  
The filter expression (see [Filter expressions](xref:sdsFilterExpressions))

#### Response
The response includes a status code and a response body containing a serialized collection of events.

##### Example request 
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data 
		?filter=Measurement gt 10
 ```

The events in the stream with `Measurement` greater than 10 are returned.

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T14:00:00Z",
        "Measurement": 20
    },
    {
        "Time": "2017-11-23T15:00:00Z",
        "Measurement": 30
    },
    {
        "Time": "2017-11-23T16:00:00Z",
        "Measurement": 40
    }
]
```

Note that `State` is not included in the JSON as its value is the default value.

#### .NET client libraries method
```csharp
   Task<IEnumerable<T>> GetFilteredValuesAsync<T>(string streamId, string filter, 
      string streamViewId = null);
```

<a name="getvaluesrange"></a>
### `Range`

Returns a collection of stored values as determined by a ``startIndex`` and ``count``. Additional optional parameters specify the direction of the range, how to handle events near or at the start index, whether to skip a certain number of events at the start of the range, and how to filter the data.

#### Request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
		?startIndex={startIndex}&count={count}[&skip={skip}&reversed={reversed} 
        &boundaryType={boundaryType}&filter={filter}]
 ```

##### Parameters
``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string startIndex``  
Index identifying the beginning of the series of events to return

``int count``  
The number of events to return

``int skip``  
Optional value specifying the number of events to skip at the beginning of the result

``bool reversed``  
Optional specification of the direction of the request. By default, range requests move forward 
from startIndex, collecting events after startIndex from the stream. A reversed request will 
collect events before startIndex from the stream.

``SdsBoundaryType boundaryType``  
Optional SdsBoundaryType specifies the handling of events at or near startIndex

``string filter``  
Optional filter expression

#### Response
The response includes a status code and a response body containing a serialized collection of events.

##### Example request 
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data 
        ?startIndex=2017-11-23T13:00:00Z&count=100
 ```

This request will return a response with up to 100 events starting at 13:00 and extending forward toward the end of the stream: 

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T13:00:00Z",
        "Measurement": 10
    },
    {
        "Time": "2017-11-23T14:00:00Z",
        "Measurement": 20
    },
    {
        "Time": "2017-11-23T15:00:00Z",
        "Measurement": 30
    },
    {
        "Time": "2017-11-23T16:00:00Z",
        "Measurement": 40
    }
]
```

Note that `State` is not included in the JSON as its value is the default value.

##### Example request  
To reverse the direction of the request, set reversed to true. The following request will 
return up to 100 events starting at 13:00 and extending back toward the start of the stream:
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data 
		?startIndex=2017-11-23T13:00:00Z&count=100&reversed=true
 ```

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T13:00:00Z",
        "Measurement": 10
    },
    {
        "Time": "2017-11-23T12:00:00Z"
    }
]
```

Note that `State` is not included in the JSON as its value is the default value. 

Further, `Measurement` is not included in the second, 12:00:00, event as zero is the default value for numbers.

The following request specifies a boundary type of Outside for a reversed-direction range request. 
The response will contain up to 100 events. The boundary type Outside indicates that up to one 
event outside the boundary will be included in the response. For a reverse direction range request, 
this means one event forward of the specified start index. In a default direction range request, 
it would mean one event before the specified start index.

##### Example request  
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data 
		?startIndex=2017-11-23T13:00:00Z&count=100&reversed=true 
        &boundaryType=2
 ```

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T14:00:00Z",
        "State": 0,
        "Measurement": 20
    },
    {
        "Time": "2017-11-23T13:00:00Z",
        "State": 0,
        "Measurement": 10
    },
    {
        "Time": "2017-11-23T12:00:00Z",
        "State": 0,
        "Measurement": 0
    }
]
```

The event outside of the index is the next event or the event at 14:00 because the 
request operates in reverse.

##### Example request  
Adding a filter to the request means only events that meet the filter criteria are returned:
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data 
        ?startIndex=2017-11-23T13:00:00Z&count=100&reversed=true 
        &boundaryType=2&filter=Measurement gt 10
 ```

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T14:00:00Z",
        "State": 0,
        "Measurement": 20
    }
]
```

#### .NET client libraries methods
```csharp
   Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
      int count, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
      int count, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, Tuple<T1, T2> startIndex, 
      int count, string streamViewId = null);

   Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
      int count, bool reversed, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
      int count, bool reversed, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, 
      Tuple<T1, T2> startIndex, int count, bool reversed, string streamViewId = null);

   Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
      int count, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
      int count, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, 
      Tuple<T1, T2> startIndex, int count, SdsBoundaryType boundaryType, string streamViewId = null);

   Task<IEnumerable<T>> GetRangeValuesAsync<T>(string streamId, string startIndex, 
      int skip, int count, bool reversed, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1>(string streamId, T1 startIndex, 
      int skip, int count, bool reversed, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetRangeValuesAsync<T, T1, T2>(string streamId, Tuple<T1, T2> startIndex, 
      int skip, int count, bool reversed, SdsBoundaryType boundaryType, 
      string streamViewId = null);

   Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T>(string streamId, string startIndex, 
      int skip, int count, bool reversed, SdsBoundaryType boundaryType, string filter, 
      string streamViewId = null);
   Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T, T1>(string streamId, T1 startIndex, 
      int skip, int count, bool reversed, SdsBoundaryType boundaryType, string filter, 
      string streamViewId = null);
   Task<IEnumerable<T>> GetRangeFilteredValuesAsync<T, T1, T2>(string streamId, 
      Tuple<T1, T2> startIndex, int skip, int count, bool reversed, SdsBoundaryType boundaryType, 
      string filter, string streamViewId = null);
```

<a name="getvalueswindow"></a>
### `Window`

Returns a collection of stored events based on the specified `startIndex` and `endIndex`. 

For handling events at and near the boundaries of the window, a single SdsBoundaryType that applies 
to both the start and end indexes can be passed with the request, or separate boundary types may 
be passed for the start and end individually. 

Paging is supported for window requests with a large number of events. 

To retrieve the next page of values, include the `continuationToken` from the results of the previous request. 
For the first request, specify a null or empty string for the `continuationToken`.

#### Requests
 ```text
     GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data 
          ?startIndex={startIndex}&endIndex={endIndex}

     GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data 
          ?startIndex={startIndex}&endIndex={endIndex}&boundaryType={boundaryType}

     GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data 
          ?startIndex={startIndex}&startBoundaryType={startBoundaryType} 
          &endIndex={endIndex}&endBoundaryType={endBoundaryType}

     GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data 
          ?startIndex={startIndex}&endIndex={endIndex}
          &count={count}&continuationToken={continuationToken}

     GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data 
          ?startIndex={startIndex}&startBoundaryType={startBoundaryType} 
          &endIndex={endIndex}&endBoundaryType={endBoundaryType}&filter={filter}&count={count} 
          &continuationToken={continuationToken}
 ```

##### Parameters
``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string startIndex``  
Index bounding the beginning of the series of events to return

``string endIndex``  
Index bounding the end of the series of events to return

``int count``  
Optional maximum number of events to return. If `count` is specified, a `continuationToken` must also be specified.

``SdsBoundaryType boundaryType``  
Optional [SdsBoundaryType](xref:sdsReadingData#sdsboundarytype) specifies handling of events at or near the start and end indexes

``SdsBoundaryType startBoundaryType``  
Optional [SdsBoundaryType](xref:sdsReadingData#sdsboundarytype) specifies the first value in the result in relation to the start index. If `startBoundaryType` is specified, `endBoundaryType` must be specified.

``SdsBoundaryType endBoundaryType``  
Optional [SdsBoundaryType](xref:sdsReadingData#sdsboundarytype) specifies the last value in the result in relation to the end index. If `startBoundaryType` is specified, `endBoundaryType` must be specified.

``string filter``  
Optional [filter expression](xref:sdsFilterExpressions)

``string continuationToken``  
Optional token used to retrieve the next page of data. If `count` is specified, a `continuationToken` must also be specified.

#### Response 
The response includes a status code and a response body containing a serialized collection of events. 

A continuation token can be returned if specified in the request.

##### Example request 
The following requests all stored events between 12:30 and 15:30: 
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data 
        ?startIndex=2017-11-23T12:30:00Z&endIndex=2017-11-23T15:30:00Z
 ```

The response will contain the event stored at the specified index:

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T13:00:00Z",
        "Measurement": 10
    },
    {
        "Time": "2017-11-23T14:00:00Z",
        "Measurement": 20
    },
    {
        "Time": "2017-11-23T15:00:00Z",
        "Measurement": 30
    }
]
```

Note that `State` is not included in the JSON as its value is the default value.

##### Example request  
When the request is modified to specify a boundary type of Outside, the value 
before 13:30 and the value after 15:30 are included:
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data 
        ?startIndex=2017-11-23T12:30:00Z&endIndex=2017-11-23T15:30:00Z 
        &boundaryType=2
 ```

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T12:00:00Z"
    },
    {
        "Time": "2017-11-23T13:00:00Z",
        "Measurement": 10
    },
    {
        "Time": "2017-11-23T14:00:00Z",
        "Measurement": 20
    },
    {
        "Time": "2017-11-23T15:00:00Z",
        "Measurement": 30
    },
    {
        "Time": "2017-11-23T16:00:00Z",
        "Measurement": 40
    }
]
```

Note that `State` is not included in the JSON as its value is the default value. 

Further, `Measurement` is not included in the second event (12:00:00) as zero is the default 
value for numbers.

##### Example request 
With a start boundary of Inside, only values inside the start boundary (after 13:30) 
are included in the result. With an end boundary of Outside, one value outside the end index 
(after 15:30) is included:
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data 
        ?startIndex=2017-11-23T12:30:00Z&&startBoundaryType=1 
        &endIndex=2017-11-23T15:30:00Z&endBoundaryType=2
 ```

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T13:00:00Z",
        "State": 0,
        "Measurement": 10
    },
    {
        "Time": "2017-11-23T14:00:00Z",
        "State": 0,
        "Measurement": 20
    },
    {
        "Time": "2017-11-23T15:00:00Z",
        "State": 0,
        "Measurement": 30
    },
    {
        "Time": "2017-11-23T16:00:00Z",
        "State": 0,
        "Measurement": 40
    }
]
```

##### Example request 
In order to page the results of the request, a continuation token may be specified. 
This requests the first page of the first two stored events between start index and 
end index by indicating count is 2 and continuationToken is an empty string:
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data 
        ?startIndex=2017-11-23T12:30:00Z&endIndex=2017-11-23T15:30:00Z 
        &count=2&continuationToken=
 ```

###### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

{
    "Results": [
        {
            "Time": "2017-11-23T13:00:00Z",
            "State": 0,
            "Measurement": 10
        },
        {
            "Time": "2017-11-23T14:00:00Z",
            "State": 0,
            "Measurement": 20
        }
    ],
    "ContinuationToken": "2017-11-23T14:00:00.0000000Z"
}
```

##### Example request 
This request uses the continuation token from the previous 
page to request the next page of stored events:
 ```text
    GET api/v1/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data 
        ?startIndex=2017-11-23T12:30:00Z&endIndex=2017-11-23T15:30:00Z 
        &count=2&continuationToken=2017-11-23T14:00:00Z
 ```

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

{
    "Results": [
        {
            "Time": "2017-11-23T15:00:00Z",
            "State": 0,
            "Measurement": 30
        }
    ],
    "ContinuationToken": null
}
```

In this case, the results contain the final event. The returned continuation token is null. 

#### .NET client libraries methods
```csharp
   Task<IEnumerable<T>> GetWindowValuesAsync<T>(string streamId, string startIndex, 
      string endIndex, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex,
      T1 endIndex, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
      Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, string streamViewId = null);

   Task<IEnumerable<T>> GetWindowValuesAsync<T>(string streamId, string startIndex, 
      string endIndex, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex, 
      T1 endIndex, SdsBoundaryType boundaryType, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
      Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
      SdsBoundaryType boundaryType, string streamViewId = null);

   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
      string startIndex, string endIndex, SdsBoundaryType boundaryType, 
      string filter, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
      T1 startIndex, T1 endIndex, SdsBoundaryType boundaryType, string filter, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
      Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
      SdsBoundaryType boundaryType, string filter, string streamViewId = null);

   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
      string startIndex, SdsBoundaryType startBoundaryType, string endIndex, 
      SdsBoundaryType endBoundaryType, string filter, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId,
      T1 startIndex, SdsBoundaryType startBoundaryType, 
      T1 endIndex, SdsBoundaryType endBoundaryType, 
      string filter, string streamViewId = null);
   Task<IEnumerable<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
      Tuple<T1, T2> startIndex, SdsBoundaryType startBoundaryType, 
      Tuple<T1, T2> endIndex, SdsBoundaryType endBoundaryType, 
      string filter, string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowValuesAsync<T>(string streamId, string startIndex,
      string endIndex, SdsBoundaryType boundaryType, int count, 
      string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1>(string streamId, T1 startIndex, 
      T1 endIndex, SdsBoundaryType boundaryType, int count, 
      string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
      Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
      SdsBoundaryType boundaryType, int count, string continuationToken, 
      string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
      string startIndex, string endIndex, SdsBoundaryType boundaryType, 
      string filter, int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
      T1 startIndex, T1 endIndex, SdsBoundaryType boundaryType, string filter, 
      int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
      Tuple<T1, T2> startIndex, Tuple<T1, T2> endIndex, 
      SdsBoundaryType boundaryType, string filter, int count, 
      string continuationToken, string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowValuesAsync<T>(string streamId, 
      string startIndex, SdsBoundaryType startBoundaryType, 
      string endIndex, SdsBoundaryType endBoundaryType, 
      int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1>(string streamId, 
      T1 startIndex, SdsBoundaryType startBoundaryType, 
      T1 endIndex, SdsBoundaryType endBoundaryType, 
      int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowValuesAsync<T, T1, T2>(string streamId, 
      Tuple<T1, T2> startIndex, SdsBoundaryType startBoundaryType, 
      Tuple<T1, T2> endIndex, SdsBoundaryType endBoundaryType, 
      int count, string continuationToken, string streamViewId = null);

   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T>(string streamId, 
      string startIndex, SdsBoundaryType startBoundaryType, 
      string endIndex, SdsBoundaryType endBoundaryType, 
      string filter, int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1>(string streamId, 
      T1 startIndex, SdsBoundaryType startBoundaryType, 
      T1 endIndex, SdsBoundaryType endBoundaryType, 
      string filter, int count, string continuationToken, string streamViewId = null);
   Task<SdsResultPage<T>> GetWindowFilteredValuesAsync<T, T1, T2>(string streamId, 
      Tuple<T1, T2> startIndex, SdsBoundaryType startBoundaryType, 
      Tuple<T1, T2> endIndex, SdsBoundaryType endBoundaryType, 
      string filter, int count, string continuationToken, string streamViewId = null);
```

****

## `Get Interpolated Values`

Returns a collection of values based on request parameters. The stream's read characteristics determine how events 
are calculated for indexes at which no stored event exists. For more information, see [Interpolation](xref:sdsReadingData#interpolation) and [Extrapolation](xref:sdsReadingData#extrapolation). Interpolation is not supported for streams with compound indexes.

SDS supports two ways of specifying which interpolated events to return:  
* [Index Collection](#getvaluesindexcollection): One or more indexes can be passed to the request in order to retrieve events at specific indexes. 
* [Interval](#getvaluesinterpolatedinterval): An interval can be specified with a start index, end index, and count. This will return the specified count of events evenly spaced from start index to end index.

<a name="getvaluesindexcollection"></a>
### `Index collection`  

Returns events at the specified indexes. If no stored event exists at a specified index, the stream's read characteristics determine how the returned event is calculated. For more information, see [Interpolation](xref:sdsReadingData#interpolation) and [Extrapolation](xref:sdsReadingData#extrapolation).

#### Request  
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/
        Interpolated?index={index}[&index={index}...]
 ```

##### Parameters
``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string index``  
One or more indexes

#### Response  
The response includes a status code and a response body containing a serialized collection of events.

Depending on the specified indexes and read characteristics of the stream, it is possible to have less events returned than specified indexes. An empty collection can also be returned.

##### Example request 
Consider a stream of type ``Simple`` with the default ``InterpolationMode`` of ``Continuous`` and 
``ExtrapolationMode`` of ``All``. In the following request, the specified index matches an existing stored event:
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/
        Interpolated?index=2017-11-23T13:00:00Z
 ```

The response will contain the event stored at the specified index.

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T13:00:00Z",
        "State": 0,
        "Measurement": 10
    }
]
```
##### Example request 
The following request specifies an index for which no stored event exists:
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/
        Interpolated?index=2017-11-23T13:30:00Z
 ```

Because the index is a valid type for interpolation and the stream has a ``InterpolationMode`` of ``Continuous``, 
this request receives a response with an event interpolated at the specified index:

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T13:30:00Z",
        "State": 0,
        "Measurement": 15
    }
]
```
##### Example request 
Consider a stream of type ``Simple`` with an ``InterpolationMode`` of ``Discrete`` and 
``ExtrapolationMode`` of ``All``. In the following request, the specified indexes only 
match two existing stored events:
 ```text
    GET api/v1/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data 
        Interpolated?index=2017-11-23T12:30:00Z&index=2017-11-23T13:00:00Z&index=2017-11-23T14:00:00Z
 ```

For this request, the response contains events for two of the three specified indexes.

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T13:00:00Z",
        "State": 0,
        "Measurement": 10
    },
    {
        "Time": "2017-11-23T14:00:00Z",
        "State": 0,
        "Measurement": 20
    }
]
```

#### .NET client libraries methods
```csharp
   Task<T> GetValueAsync<T>(string streamId, string index, 
      string streamViewId = null);
   Task<T> GetValueAsync<T, T1>(string streamId, Tuple<T1> index, 
      string streamViewId = null);
   Task<T> GetValueAsync<T, T1, T2>(string streamId, Tuple<T1, T2> index, 
      string streamViewId = null);

   Task<IEnumerable<T>> GetValuesAsync<T>(string streamId, IEnumerable<string> index, 
      string streamViewId = null);
   Task<IEnumerable<T>> GetValuesAsync<T, T1>(string streamId, IEnumerable<T1> index,
      string streamViewId = null);
   Task<IEnumerable<T>> GetValuesAsync<T, T1, T2>(string streamId, 
      IEnumerable<Tuple< T1, T2>> index, string streamViewId = null);
```

<a name="getvaluesinterpolatedinterval"></a>
### `Interval`

Returns events at evenly spaced intervals based on the specified start index, end index, and count. If no stored event exists at an index interval, the stream's read characteristics determine how the returned event is calculated. For more information, see [Interpolation](xref:sdsReadingData#interpolation) and [Extrapolation](xref:sdsReadingData#extrapolation).

#### Request  
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/
        Interpolated?startIndex={startIndex}&endIndex={endIndex}&count={count}
 ```

##### Parameters
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

``int count``  
The number of events to return. Read characteristics of the stream determine how the events are constructed.

#### Response  
The response includes a status code and a response body containing a serialized collection of events. Depending on the read characteristics and input parameters, it is possible for a collection to be returned with less events than specified in the count.

##### Example request 
For a stream, named Simple, of type ``Simple`` for the following request:
 ```text
    GET api/v1/Tenants/{tenantId}}/Namespaces/{namespaceId}/Streams/Simple/Data/
		Interpolated?startIndex=2017-11-23T13:00:00Z&endIndex=2017-11-23T15:00:00Z&count=3
 ```

the start and end fall exactly on event indexes, and the number of events from start to end match the count of three (3).

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T13:00:00Z",
        "State": 0,
        "Measurement": 10
    },
    {
        "Time": "2017-11-23T14:00:00Z",
        "State": 0,
        "Measurement": 20
    },
    {
        "Time": "2017-11-23T15:00:00Z",
        "State": 0,
        "Measurement": 30
    }
]
```

#### .NET client libraries methods
```csharp
   Task<IEnumerable<T>> GetValuesAsync<T>(string streamId, string startIndex, 
      string endIndex, int count, string streamViewId = null);
   Task<IEnumerable<T>> GetValuesAsync<T, T1>(string streamId, T1 startIndex, 
      T1 endIndex, int count, string streamViewId = null);
   Task<IEnumerable<T>> GetValuesAsync<T, T1, T2>(string streamId, Tuple<T1, T2> startIndex, 
      Tuple<T1, T2> endIndex, int count, string streamViewId = null);
```

****

## ``Get Summaries``

Returns summary intervals between a specified start and end index. 

Index types that cannot be interpolated do not support summary requests. Strings are an example of indexes that cannot be interpolated. Summaries are not supported for streams with compound indexes. Interpolating between two indexes 
that consist of multiple properties is not defined and results in non-determinant behavior.

Summary values supported by `SdsSummaryType` enum:

| Summary                            | Enumeration value |
| ---------------------------------- | ----------------- |
| Count                              | 1                 |
| Minimum                            | 2                 |
| Maximum                            | 4                 |
| Range                              | 8                 |
| Mean                               | 16                |
| StandardDeviation                  | 64                |
| Total                              | 128               |
| Skewness                           | 256               |
| Kurtosis                           | 512               |
| WeightedMean                       | 1024              |
| WeightedStandardDeviation          | 2048              |
| WeightedPopulationStandardDeviation | 4096              |

Count, Minimum, Maximum, and Range are based only on stored events and do not include interpolated values.
Mean, Standard Deviation, Skewness, and Kurtosis are event-weighted calculations.
Total, Weighted Mean, WeightedStandardDeviation, and WeightedPopulationStandardDeviation are index-weighted calculations.

Currently, these values can only be calculated for properties of the following types:

| Type           | SdsTypeCode |
|--------------- | ----------- |
| Boolean        | 3           |
| Byte           | 6           |
| Char           | 4           |
| Decimal        | 15          |
| Int16          | 7           |
| Int32          | 9           |
| Int64          | 11          |
| SByte          | 5           |
| Single         | 13          |
| UInt16         | 8           |
| UInt32         | 10          |
| UInt64         | 12          |
| DateTime       | 16          |
| Double         | 14          |
| DateTimeOffset | 20          |
| TimeSpan       | 21          |
| NullableBoolean        | 103           |
| NullableByte           | 106           |
| NullableChar           | 104           |
| NullableDecimal        | 115           |
| NullableInt16          | 107           |
| NullableInt32          | 109           |
| NullableInt64          | 111           |
| NullableSByte          | 105           |
| NullableSingle         | 113           |
| NullableUInt16         | 108           |
| NullableUInt32         | 110           |
| NullableUInt64         | 112           |
| NullableDateTime       | 116           |
| NullableDouble         | 114           |
| NullableDateTimeOffset | 120           |
| NullableTimeSpan       | 121           |

**Note:** Properties marked with an ``InterpolationMode`` of ``Discrete`` do not support summaries.
Unsupported properties will be excluded from the summaries returned.

#### Request  
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/
        Summaries?startIndex={startIndex}&endIndex={endIndex}&count={count}[&filter={filter}]
 ```

##### Parameters
``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string startIndex``  
The start index for the intervals

``string endIndex``  
The end index for the intervals

``int count``  
The number of intervals requested

``string filter``  
Optional filter expression

#### Response
The response includes a status code and a response body containing a serialized collection of SdsIntervals.

Each SdsInterval has a start, end, and collection of summary values.

| Property  | Details                                           |
| --------- | ------------------------------------------------- |
| Start     | The start of the interval                         |
| End       | The end of the interval                           |
| Summaries | The summary values for the interval, keyed by summary type. The nested dictionary contains property name keys and summary calculation result values. |

##### Example request 
The following request calculates two summary intervals between the `startIndex` and `endIndex`: 

 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
        Summaries?startIndex=2017-11-23T12:00:00Z&endIndex=2017-11-23T16:00:00Z&count=2
 ```

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Start": {
            "Time": "2017-11-23T12:00:00Z",
            "State": 0,
            "Measurement": 0
        },
        "End": {
            "Time": "2017-11-23T14:00:00Z",
            "State": 0,
            "Measurement": 20
        },
        "Summaries": {
            "Count": {
                "Time": 3,
                "Measurement": 3
            },
            "Minimum": {
                "Measurement": 0
            },
            "Maximum": {
                "Measurement": 20
            },
            "Range": {
                "Measurement": 20
            },
            "Total": {
                "Measurement": 20
            },
            "Mean": {
                "Measurement": 10
            },
            "StandardDeviation": {
                "Measurement": 7.0710678118654755
            },
            "PopulationStandardDeviation": {
                "Measurement": 5
            },
            "WeightedMean": {
                "Measurement": 10
            },
            "WeightedStandardDeviation": {
                "Measurement": 7.0710678118654755
            },
            "WeightedPopulationStandardDeviation": {
                "Measurement": 5
            },
            "Skewness": {
                "Measurement": 0
            },
            "Kurtosis": {
                "Measurement": -2
            }
        }
    },
    {
        "Start": {
            "Time": "2017-11-23T14:00:00Z",
            "State": 0,
            "Measurement": 20
        },
        "End": {
            "Time": "2017-11-23T16:00:00Z",
            "State": 0,
            "Measurement": 40
        },
        "Summaries": {
            "Count": {
                "Time": 3,
                "Measurement": 3
            },
            "Minimum": {
                "Measurement": 30
            },
            "Maximum": {
                "Measurement": 40
            },
            "Range": {
                "Measurement": 10
            },
            "Total": {
                "Measurement": 60
            },
            "Mean": {
                "Measurement": 30
            },
            "StandardDeviation": {
                "Measurement": 7.0710678118654755
            },
            "PopulationStandardDeviation": {
                "Measurement": 5
            },
            "WeightedMean": {
                "Measurement": 30
            },
            "WeightedStandardDeviation": {
                "Measurement": 7.0710678118654755
            },
            "WeightedPopulationStandardDeviation": {
                "Measurement": 5
            },
            "Skewness": {
                "Measurement": 0
            },
            "Kurtosis": {
                "Measurement": -2
            }
        }
    }
]
```

SDS also supports summary requests for nullable SdsTypes. It means an SdsType has at least a nullable SdsTypeProperty.

##### Example 

The following example contains a nullable double property with interpolation mode set to continuous:

###### .NET
```csharp

public class SimpleType
{
   [SdsMember(IsKey = true, Order = 0) ]
   public DateTime Time { get; set; }
   [SdsMember(Uom = "meter")]
   public double? Measurement { get; set; }
}
```

``Measurement`` has stored values as follows:

      11/23/2017 12:00:01 PM: Measurement 2
      11/23/2017 12:00:02 PM: Measurement 2
      11/23/2017 12:00:03 PM: Measurement null
      11/23/2017 12:00:04 PM: Measurement 1
      11/23/2017 12:00:05 PM: Measurement 2
      11/23/2017 12:00:06 PM: Measurement null
      11/23/2017 12:00:07 PM: Measurement null
      11/23/2017 12:00:08 PM: Measurement 3

While calculating weighted summaries, if we encounter a null value at a given index then we would consider interpolation mode of property to find the interpolated value of the given interval. See the table below for [12:00:02 PM, 12:00:03 PM] interval. The values are 2 and null at 12:00:02 and 12:00:03 PM respectively. 

| Interpolation Mode | Weight in seconds | Value in meter |
| ---------- | ----------------------- | ------------- |
| Continuous | 0 | 0 |
| ContinuousNullableLeading <br> StepwiseContinuousLeading | 1 | 2 |
| ContinuousNullableTrailing <br> StepwiseContinuousTrailing | 0 | 0 |

Similarly, for intervals [12:00:03 PM, 12:00:04 PM] and [12:00:04 PM, 12:00:05 PM] respectively, the table would look like below:

| Interpolation Mode | Weight in seconds | Value in meter |
| ---------- | ----------------------- | ------------- |
| Continuous | 0 | 0 |
| ContinuousNullableLeading <br> StepwiseContinuousLeading | 0 | 0 |
| ContinuousNullableTrailing <br> StepwiseContinuousTrailing | 1 | 1 |

| Interpolation Mode | Weight in seconds | Value in meter |
| ---------- | ----------------------- | ------------- |
| Continuous | 1 | 1.5 |
| ContinuousNullableLeading <br> StepwiseContinuousLeading | 1 | 1 |
| ContinuousNullableTrailing <br> StepwiseContinuousTrailing | 1 | 2 |

**Note:** Non-weighted summaries disregard null values and treat them as non-existent. 
In the example above, non-weighted summaries for Measurement would be calculated based on (2,2,1,2,3) whereas weighted summaries for Measurement consider null values for its calculation. 

For more information see [Interpolation](xref:sdsReadingData#interpolation).
##### Example request
The following request calculates one summary interval between the `startIndex` and `endIndex`: 
 ```text
    GET api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/ 
        Summaries?startIndex=2017-11-23T12:00:01Z&endIndex=2017-11-23T12:00:08Z&count=1
 ```

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Start": {
            "Time": "2017-11-23T12:00:01Z",
            "Measurement": 2
        },
        "End": {
            "Time": "2017-11-23T12:00:08Z",
            "Measurement": 3
        },
        "Summaries": {
            "Count": {
                "Time": 8,
                "Measurement": 5
            },
            "Minimum": {
                "Measurement": 1
            },
            "Maximum": {
                "Measurement": 3
            },
            "Range": {
                "Measurement": 2
            },
            "Total": {
                "Measurement": 7.5
            },
            "Mean": {
                "Measurement": 1.875
            },
            "StandardDeviation": {
                "Measurement": 0.478713553878169
            },
            "PopulationStandardDeviation": {
                "Measurement": 0.41457809879442492
            },
            "WeightedMean": {
                "Measurement": 1.75
            },
            "WeightedStandardDeviation": {
                "Measurement": 0.35355339059327379
            },
            "WeightedPopulationStandardDeviation": {
                "Measurement": 0.25
            },
            "Skewness": {
                "Measurement": 0.49338220021815865
            },
            "Kurtosis": {
                "Measurement": -1.3719008264462809
            }
        }
    }
]
```

#### .NET client libraries methods
```csharp
   Task<IEnumerable<SdsInterval<T>>> GetIntervalsAsync<T>(string streamId, string 
      startIndex, string endIndex, int count, string streamViewId = null);

   Task<IEnumerable<SdsInterval<T>>> GetIntervalsAsync<T, T1>(string streamId, T1 
      startIndex, T1 endIndex, int count, string streamViewId = null);

   Task<IEnumerable<SdsInterval<T>>> GetFilteredIntervalsAsync<T>(string streamId, 
      string startIndex, string endIndex, int count, string filter, 
      string streamViewId = null);

   Task<IEnumerable<SdsInterval<T>>> GetFilteredIntervalsAsync<T, T1>(string streamId, 
      T1 startIndex, T1 endIndex, int count, string filter, 
      string streamViewId = null);
```
****

## ``Get Sampled Values``

Returns representative data sampled by intervals between a specified start and end index. 

Sampling is driven by a specified property or properties of the stream's Sds Type. Property types that cannot be interpolated do not support sampling requests. Strings are an example of a property that cannot be interpolated. For more 
information see [Interpolation](xref:sdsReadingData#interpolation). 

#### Request  
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/
        Sampled?startIndex={startIndex}&endIndex={endIndex}&intervals={intervals}&sampleBy={sampleBy}
        [&sampleBy={sampleBy}&...&boundaryType={boundaryType}&startBoundaryType={startBoundaryType}
        &endBoundaryType={endBoundaryType}&filter={filter}]
 ```

##### Parameters
``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streamId``  
The stream identifier

``string startIndex``  
The start index for the intervals

``string endIndex``  
The end index for the intervals

``int intervals``  
The number of intervals requested

``string sampleBy``  
Property or properties to use when sampling

``SdsBoundaryType boundaryType``  
Optional SdsBoundaryType specifies the handling of events at or near the startIndex and endIndex

``SdsBoundaryType startBoundaryType``  
Optional SdsBoundaryType specifies the handling of events at or near the startIndex

``SdsBoundaryType endBoundaryType``  
Optional SdsBoundaryType specifies the handling of events at or near the endIndex

``string filter``  
Optional filter expression

#### Response
The response includes a status code and a response body containing a serialized collection of events.

##### Example request 
The following request returns two sample intervals between the `startIndex` and `endIndex`: 
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data/
        Sampled?startIndex=2019-01-01T00:00:00Z&endIndex=2019-01-02T00:00:00Z&intervals=2&sampleBy=Measurement
 ```

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2019-01-01T00:00:01Z",
        "State": 1,
        "Measurement": 1
    },
    {
        "Time": "2019-01-01T00:11:50Z",
        "State": 2,
        "Measurement": 0.00006028870675578446
    },
    {
        "Time": "2019-01-01T11:55:33Z",
        "Measurement": 6.277981349066863
    },
    {
        "Time": "2019-01-01T12:00:00Z",
        "Measurement": 3.101013140344655
    },
    {
        "Time": "2019-01-01T12:00:01Z",
        "State": 1,
        "Measurement": 4.101013140344655
    },
    {
        "Time": "2019-01-01T12:01:50Z",
        "State": 2,
        "Measurement": 0.0036776111121028521
    },
    {
        "Time": "2019-01-01T23:57:23Z",
        "State": 2,
        "Measurement": 6.2816589601789659
    },
    {
        "Time": "2019-01-02T00:00:00Z",
        "Measurement": 6.20202628068931
    }
]
```
Note that `State` is not included in the JSON when its value is the default value.

#### .NET client libraries methods
```csharp
   Task<IEnumerable<T>> GetSampledValuesAsync<T>(string streamId, string startIndex, string endIndex,
      int intervals, IEnumerable<string> sampleBy, string streamViewId = null);  
   
   Task<IEnumerable<T>> GetSampledValuesAsync<T>(string streamId, string startIndex, string endIndex,
      int intervals, IEnumerable<string> sampleBy, SdsBoundaryType boundaryType, 
      string streamViewId = null);  
   
   Task<IEnumerable<T>> GetSampledValuesAsync<T>(string streamId, string startIndex, string endIndex,
      int intervals, IEnumerable<string> sampleBy, SdsBoundaryType startBoundaryType, 
      SdsBoundaryType endBoundaryType, string streamViewId = null);

   Task<IEnumerable<T>> GetSampledFilteredValuesAsync<T>(string streamId, string startIndex, string endIndex,
      int intervals, IEnumerable<string> sampleBy, string filter, string streamViewId = null);  
   
   Task<IEnumerable<T>> GetSampledFilteredValuesAsync<T>(string streamId, string startIndex, string endIndex,
      int intervals, IEnumerable<string> sampleBy, SdsBoundaryType boundaryType, string filter, 
      string streamViewId = null);  
   
   Task<IEnumerable<T>> GetSampledFilteredValuesAsync<T>(string streamId, string startIndex, string endIndex,
      int intervals, IEnumerable<string> sampleBy, SdsBoundaryType startBoundaryType, 
      SdsBoundaryType endBoundaryType, string filter, string streamViewId = null);
```
****

## ``Join Values``

Returns data from multiple streams, which are joined based on the request specifications. The streams must be of the same type.

SDS supports the following types of joins:

| SdsJoinMode  | Enumeration value | Operation |
| -------      | ----------------- | --------- |
| Inner        | 0                 | Results include the stored events with common indexes across specified streams. |
| Outer        | 1                 | Results include the stored events for all indexes across all streams. |
| Interpolated | 2                 | Results include events for each index across all streams for the request index boundaries. Some events may be interpolated. |
| MergeLeft    | 3                 | Results include one event for each index across all streams selecting events at the indexes based on left to right order of the streams. |
| MergeRight   | 4                 | Results include one event for each index across all streams selecting events at the indexes based on right to left order of the streams. |


SDS supports GET and POST join requests:
* [GET](#getjoin): The stream, joinMode, start index, and end index are specified in the request URI path.
* [POST](#postjoin): Only the joinMode is specified in the URI. The streams and read specification for each stream are specified in the body of the request.

<a name="getjoin"></a>
### `GET request`
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Streams/Data/Joins
        ?streams={streams}&joinMode={joinMode}&startIndex={startIndex}&endIndex={endIndex}
		[&boundaryType={boundaryType}&startBoundaryType={startBoundaryType}
        &endBoundaryType={endBoundaryType}&filter={filter}&count={count}]
 ```

##### Parameters
``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``string streams``  
Commas separated list of stream identifiers

``SdsJoinMode joinMode``  
Type of join: inner, outer, interpolated, merge left or merge right

``string startIndex``  
Index identifying the beginning of the series of events to return

``string endIndex``  
Index identifying the end of the series of events to return

[Optional] ``int count``  
[Optional] Maximum number of events to return.

[Optional] ``SdsBoundaryType boundaryType``  
[Optional] SdsBoundaryType specifies the handling of events at or near the startIndex and endIndex

[Optional] ``SdsBoundaryType startBoundaryType``  
[Optional] SdsBoundaryType specifies the handling of events at or near the startIndex

[Optional] ``SdsBoundaryType endBoundaryType``  
[Optional] SdsBoundaryType specifies the handling of events at or near the endIndex

[Optional] ``string filter``  
[Optional] Filter expression

##### Response
The response includes a status code and a response body containing multiple serialized events. 

##### Examples
Data from streams `Simple1` and `Simple2` will be used to illustrate how each join operation works.
 
###### Stream data `Simple1` 

```json  
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T11:00:00Z",
        "Measurement": 10
    },
    {
        "Time": "2017-11-23T13:00:00Z",
        "Measurement": 20
    },
    {
        "Time": "2017-11-23T14:00:00Z",
        "Measurement": 30
    },
    {
        "Time": "2017-11-23T16:00:00Z",
        "Measurement": 40
    }
]
```
| Time                	| Measurement 	|
|----------------------	|-------------	|
| 2017-11-23T11:00:00Z 	| 10          	|
| 2017-11-23T13:00:00Z 	| 20          	|
| 2017-11-23T14:00:00Z 	| 30          	|
| 2017-11-23T16:00:00Z 	| 40          	|

###### Stream data `Simple2`

```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T12:00:00Z",
        "Measurement": 50
    },
    {
        "Time": "2017-11-23T14:00:00Z",
        "Measurement": 60
    },
    {
        "Time": "2017-11-23T15:00:00Z",
        "Measurement": 70
    },
    {
        "Time": "2017-11-23T17:00:00Z",
        "Measurement": 80
    }
]
```
| Time                	| Measurement 	|
|----------------------	|-------------	|
| 2017-11-23T12:00:00Z 	| 50          	|
| 2017-11-23T14:00:00Z 	| 60          	|
| 2017-11-23T15:00:00Z 	| 70          	|
| 2017-11-23T17:00:00Z 	| 80          	|

#### `Inner Join` example request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Streams/Data/Joins
        ?streams=Simple1,Simple2&joinMode=inner
        &startIndex=0001-01-01T00:00:00.0000000&endIndex=9999-12-31T23:59:59.9999999
 ```

##### Response
Measurements from both streams with common indexes.

##### Example response body 

```json
HTTP/1.1 200
Content-Type: application/json

[
    [
        {
            "Time": "2017-11-23T14:00:00Z",
            "Measurement": 30
        },
        {
            "Time": "2017-11-23T14:00:00Z",
            "Measurement": 60
        }
    ]
]
```
| Time                	| `Simple 1` Measurement 	| `Simple 2` Measurement 	|
|----------------------	|-------------	|-------------	|
| 2017-11-23T14:00:00Z 	| 30          	| 60          	|

<a name="outer"></a>
#### `Outer Join` example request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Streams/Data/Joins
        ?streams=Simple1,Simple2&joinMode=outer
        &startIndex=0001-01-01T00:00:00.0000000&endIndex=9999-12-31T23:59:59.9999999
 ```

##### Response
All Measurements from both streams, with default values at indexes where a stream does not have a value.

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    [
        {
            "Time": "2017-11-23T11:00:00Z",
            "Measurement": 10
        },
        null
    ],
    [
        null,
        {
            "Time": "2017-11-23T12:00:00Z",
            "Measurement": 50
        }
    ],
    [
        {
            "Time": "2017-11-23T13:00:00Z",
            "Measurement": 20
        },
        null
    ],
    [
        {
            "Time": "2017-11-23T14:00:00Z",
            "Measurement": 30
        },
        {
            "Time": "2017-11-23T14:00:00Z",
            "Measurement": 60
        }
    ],
    [
        null,
        {
            "Time": "2017-11-23T15:00:00Z",
            "Measurement": 70
        }
    ],
    [
        {
            "Time": "2017-11-23T16:00:00Z",
            "Measurement": 40
        },
        null
    ],
    [
        null,
        {
            "Time": "2017-11-23T17:00:00Z",
            "Measurement": 80
        }
    ]
]
```
| Index                	| `Simple 1` Measurement 	| `Simple 2` Measurement  	|
|----------------------	|------------------------	|-------------------------	|
| 2017-11-23T11:00:00Z 	| 10                     	| null                    	|
| 2017-11-23T12:00:00Z 	| null                   	| 50                      	|
| 2017-11-23T13:00:00Z 	| 20                     	| null                    	|
| 2017-11-23T14:00:00Z 	| 30                     	| 60                      	|
| 2017-11-23T15:00:00Z 	| null                   	| 70                      	|
| 2017-11-23T16:00:00Z 	| 40                     	| null                    	|
| 2017-11-23T17:00:00Z 	| null                   	| 80                      	|

Default value is `null` for SdsTypes. 

#### `Interpolated Join` example request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Streams/Data/Joins
        ?streams=Simple1,Simple2&joinMode=interpolated
        &startIndex=0001-01-01T00:00:00.0000000&endIndex=9999-12-31T23:59:59.9999999
 ```

##### Response
All Measurements from both streams with missing values interpolated. 
If the missing values are between valid measurements within a stream, they are interpolated.
For more information, see [Interpolation](xref:sdsReadingData#interpolation).
If the missing values are outside of the boundary values, they are extrapolated.
For more information, see [Extrapolation](xref:sdsReadingData#extrapolation).

**Note:** The Interpolated SdsJoinMode currently does not support SdsInterpolationModes of the streams. All join requests with interpolations will honor the interpolation mode of the stream type or type property. 

##### Example response body

```json
HTTP/1.1 200
Content-Type: application/json

[
    [
        {
            "Time": "2017-11-23T11:00:00Z",
            "Measurement": 10
        },
        {
            "Time": "2017-11-23T11:00:00Z",
            "Measurement": 50
        }
    ],
    [
        {
            "Time": "2017-11-23T12:00:00Z",
            "Measurement": 15
        },
        {
            "Time": "2017-11-23T12:00:00Z",
            "Measurement": 50
        }
    ],
    [
        {
            "Time": "2017-11-23T13:00:00Z",
            "Measurement": 20
        },
        {
            "Time": "2017-11-23T13:00:00Z",
            "Measurement": 55
        }
    ],
    [
        {
            "Time": "2017-11-23T14:00:00Z",
            "Measurement": 30
        },
        {
            "Time": "2017-11-23T14:00:00Z",
            "Measurement": 60
        }
    ],
    [
        {
            "Time": "2017-11-23T15:00:00Z",
            "Measurement": 35
        },
        {
            "Time": "2017-11-23T15:00:00Z",
            "Measurement": 70
        }
    ],
    [
        {
            "Time": "2017-11-23T16:00:00Z",
            "Measurement": 40
        },
        {
            "Time": "2017-11-23T16:00:00Z",
            "Measurement": 75
        }
    ],
    [
        {
            "Time": "2017-11-23T17:00:00Z",
            "Measurement": 40
        },
        {
            "Time": "2017-11-23T17:00:00Z",
            "Measurement": 80
        }
    ]
]
```
| Index                	| `Simple 1` Measurement 	| `Simple 2` Measurement  	|
|----------------------	|------------------------	|-------------------------	|
| 2017-11-23T11:00:00Z 	| 10                     	| _50_                     	|
| 2017-11-23T12:00:00Z 	| **15**                     	| 50                      	|
| 2017-11-23T13:00:00Z 	| 20                     	| **55**                      	|
| 2017-11-23T14:00:00Z 	| 30                     	| 60                      	|
| 2017-11-23T15:00:00Z 	| **35**                    | 70                      	|
| 2017-11-23T16:00:00Z 	| 40                     	| **75**                      	|
| 2017-11-23T17:00:00Z 	| _40_                     	| 80                      	|

Interpolated values are in **bold**. Extrapolated values are in *italics*. 

#### `MergeLeft Join` example request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Streams/Data/Joins
        ?streams=Simple1,Simple2&joinMode=mergeleft
        &startIndex=0001-01-01T00:00:00.0000000&endIndex=9999-12-31T23:59:59.9999999
 ```

##### Response
Similar to [OuterJoin](#outer), but value at each index is the first available value at that index when iterating the given list of streams from left to right.

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T11:00:00Z",
        "Measurement": 10
    },
    {
        "Time": "2017-11-23T12:00:00Z",
        "Measurement": 50
    },
    {
        "Time": "2017-11-23T13:00:00Z",
        "Measurement": 20
    },
    {
        "Time": "2017-11-23T14:00:00Z",
        "Measurement": 30
    },
    {
        "Time": "2017-11-23T15:00:00Z",
        "Measurement": 70
    },
    {
        "Time": "2017-11-23T16:00:00Z",
        "Measurement": 40
    },
    {
        "Time": "2017-11-23T17:00:00Z",
        "Measurement": 80
    }
]
```

| Index                	| `Simple1`  	| `Simple2` 	| Returned `MergeLeft Join` Values    	|
|----------------------	|------------	|-----------	|----	|
| 2017-11-23T11:00:00Z 	| 10         	|           	| 10 	|
| 2017-11-23T12:00:00Z 	|            	| 50        	| 50 	|
| 2017-11-23T13:00:00Z 	| 20         	|           	| 20 	|
| 2017-11-23T14:00:00Z 	| *30*         	| 60        	| 30 	|
| 2017-11-23T15:00:00Z 	|            	| 70        	| 70 	|
| 2017-11-23T16:00:00Z 	| 40         	|           	| 40 	|
| 2017-11-23T17:00:00Z 	|            	| 80        	| 80 	|

Takes the value from the stream on the left (`Simple1`) at "2017-11-23T14:00:00Z". 

#### `MergeRight Join` example request
 ```text
    GET api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Streams/Data/Joins
        ?streams=Simple1,Simple2&joinMode=mergeright
        &startIndex=0001-01-01T00:00:00.0000000&endIndex=9999-12-31T23:59:59.9999999
 ```

##### Response
Similar to [OuterJoin](#outer), but value at each index is the first available value at that index when iterating the given list of streams from right to left.

##### Example response body
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Time": "2017-11-23T11:00:00Z",
        "Measurement": 10
    },
    {
        "Time": "2017-11-23T12:00:00Z",
        "Measurement": 50
    },
    {
        "Time": "2017-11-23T13:00:00Z",
        "Measurement": 20
    },
    {
        "Time": "2017-11-23T14:00:00Z",
        "Measurement": 60
    },
    {
        "Time": "2017-11-23T15:00:00Z",
        "Measurement": 70
    },
    {
        "Time": "2017-11-23T16:00:00Z",
        "Measurement": 40
    },
    {
        "Time": "2017-11-23T17:00:00Z",
        "Measurement": 80
    }
]
```
| Index                	| `Simple1`  	| `Simple2` 	| Returned `MergeRight Join` Values    	|
|----------------------	|------------	|-----------	|----	|
| 2017-11-23T11:00:00Z 	| 10         	|           	| 10 	|
| 2017-11-23T12:00:00Z 	|            	| 50        	| 50 	|
| 2017-11-23T13:00:00Z 	| 20         	|           	| 20 	|
| 2017-11-23T14:00:00Z 	| 30         	| *60*        	| 60 	|
| 2017-11-23T15:00:00Z 	|            	| 70        	| 70 	|
| 2017-11-23T16:00:00Z 	| 40         	|           	| 40 	|
| 2017-11-23T17:00:00Z 	|            	| 80        	| 80 	|

Takes the value from the stream on the right (`Simple2`) at "2017-11-23T14:00:00Z". 

<a name="postjoin"></a>
### `POST request`
 ```text
    POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Streams/Data/Joins?
        joinMode={joinMode}
 ```

##### Parameters

``string tenantId``  
The tenant identifier

``string namespaceId``  
The namespace identifier

``SdsJoinMode joinMode``  
Type of join: inner, outer, interpolated, merge left or merge right

##### Request body  
Read option specific to each stream

##### Response
The response includes a status code and a response body containing multiple serialized events.

#### `Outer Join` example request 
 ```text
    POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Streams/Data/Joins
        ?joinMode=outer
 ```

##### `Outer Join` example request body
Different start indexes and end indexes are specified per stream.

```json
[  
    {  
        "StreamId": "Simple1",
        "Options": 
	{
           "StartIndex": "2017-11-23T11:00:00Z",
	   "EndIndex": "2017-11-23T14:00:00Z",
	   "StartBoundaryType": "Exact",
	   "EndBoundaryType": "Exact",
	   "Count": 100,
	   "Filter": ""
        }
    },
    {
        "StreamId": "Simple2",
        "Options": 
	{
           "StartIndex": "2017-11-23T15:00:00Z",
	   "EndIndex": "2017-11-23T17:00:00Z",
	   "StartBoundaryType": "Exact",
	   "EndBoundaryType": "Exact",
	   "Count": 100,
	   "Filter": ""
        }
    }
] 
```



##### `Outer Join` example response body
Only events within the two streams' specified index boundaries are considered for the outer join operation.

```json
HTTP/1.1 200
Content-Type: application/json

[
    [
        {
            "Time": "2017-11-23T11:00:00Z",
            "Measurement": 10
        },
        null
    ],
    [
        {
            "Time": "2017-11-23T13:00:00Z",
            "Measurement": 20
        },
        null
    ],
    [
        {
            "Time": "2017-11-23T14:00:00Z",
            "Measurement": 30
        },
        null
    ],
    [
        null,
        {
            "Time": "2017-11-23T15:00:00Z",
            "Measurement": 70
        }
    ],
    [
        null,
        {
            "Time": "2017-11-23T17:00:00Z",
            "Measurement": 80
        }
    ]
]
```
| Index                	| `Simple 1` Measurement 	| `Simple 2` Measurement  	|
|----------------------	|------------------------	|-------------------------	|
| 2017-11-23T11:00:00Z 	| 10                     	| null                    	|
| 2017-11-23T13:00:00Z 	| 20                     	| null                    	|
| 2017-11-23T14:00:00Z 	| 30                     	| null                      |
| 2017-11-23T15:00:00Z 	| null                   	| 70                      	|
| 2017-11-23T17:00:00Z 	| null                   	| 80                      	|

Not all values from both streams are included because the query restricts each stream.
See `Outer Join` [GET request](#outer-join-example-request) above to compare.   

### .NET client libraries methods
```csharp
   Task<IEnumerable<IList<T>>> GetJoinValuesAsync<T>(IEnumerable<string> streams, 
      SdsJoinType joinMode, string startIndex, string endIndex);
       
   Task<IEnumerable<IList<T>>> GetJoinValuesAsync<T>(IEnumerable<string> streams, 
      SdsJoinType joinMode, string startIndex, string endIndex, int count);
        
   Task<IEnumerable<IList<T>>> GetJoinValuesAsync<T>(IEnumerable<string> streams, 
      SdsJoinType joinMode, string startIndex, string endIndex, SdsBoundaryType boundaryType, 
      string filter);

   Task<IEnumerable<IList<T>>> GetJoinValuesAsync<T>(IEnumerable<string> streams, 
      SdsJoinType joinMode, string startIndex, string endIndex, SdsBoundaryType boundaryType, 
      string filter, int count);
        
   Task<IEnumerable<IList<T>>> GetJoinValuesAsync<T>(IEnumerable<string> streams, 
      SdsJoinType joinMode, string startIndex, SdsBoundaryType startBoundaryType, string endIndex, 
      SdsBoundaryType endBoundaryType, string filter);
        
   Task<IEnumerable<IList<T>>> GetJoinValuesAsync<T>(IEnumerable<string> streams, 
      SdsJoinType joinMode, string startIndex, SdsBoundaryType startBoundaryType, string endIndex, 
      SdsBoundaryType endBoundaryType, string filter, int count);
        
   Task<IEnumerable<IList<T>>> GetJoinValuesAsync<T>(SdsJoinType joinMode, IList<SdsStreamQuery> 
      sdsStreamsQueryOptions);

   Task<IList<T>> GetMergeValuesAsync<T>(SdsMergeType joinMode, IList<SdsStreamQuery> 
      sdsStreamsQueryOptions);
        
   Task<IList<T>> GetMergeValuesAsync<T>(IEnumerable<string> streams, SdsMergeType joinMode, 
      string startIndex, string endIndex);
        
   Task<IList<T>> GetMergeValuesAsync<T>(IEnumerable<string> streams, SdsMergeType joinMode, 
      string startIndex, string endIndex, int count);
        
   Task<IList<T>> GetMergeValuesAsync<T>(IEnumerable<string> streams, SdsMergeType joinMode, 
      string startIndex, string endIndex, SdsBoundaryType boundaryType, string filter);

   Task<IList<T>> GetMergeValuesAsync<T>(IEnumerable<string> streams, SdsMergeType joinMode, 
      string startIndex, string endIndex, SdsBoundaryType boundaryType, string filter, int count);
        
   Task<IList<T>> GetMergeValuesAsync<T>(IEnumerable<string> streams, SdsMergeType joinMode, 
      string startIndex, SdsBoundaryType startBoundaryType, string endIndex, 
      SdsBoundaryType endBoundaryType, string filter);
        
   Task<IList<T>> GetMergeValuesAsync<T>(IEnumerable<string> streams, SdsMergeType joinMode, 
      string startIndex, SdsBoundaryType startBoundaryType, string endIndex, 
      SdsBoundaryType endBoundaryType, string filter, int count);
```

***********************
