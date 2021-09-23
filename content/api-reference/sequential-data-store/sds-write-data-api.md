---
uid: sdsWritingDataApi
---

# Write data

#### Example type, stream, and data

Many of the API methods described below contain example requests and responses in JSON to highlight usage and specific behaviors. The following type, stream, and data are used in the examples.

**Example type**  
``SimpleType`` is an SdsType with a single index and two additional properties. This type is defined below in .NET, Python, and Javascript:

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

**Example stream**  
``Simple`` is an SdsStream of type ``SimpleType``.

**Example data**  
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

#### Request
 ```text
    POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
 ```

##### Parameters 
``string tenantId``  
Tenant identifier.  

``string namespaceId``  
Namespace identifier. 

``string streamId``  
Stream identifier. 

##### Request body  
A serialized list of one or more events of the stream type  

##### Example request  
The following request is used to insert events into stream `Simple` of `SimpleType`:
 ```text
    POST api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
 ```
##### Example request body
The request body specifies the values to insert. 
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
### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Specified values were successfully added|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

#### Note 
This request will return an error if an event already exists for any index in the request. If any individual index encounters a problem, the entire operation is rolled back and no insertions are made. The `streamId` and `index` that caused the issue are included in the error response.


## `Update Values`

Writes one or more events to the specified stream.

#### Request
 ```text
    PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
 ```

##### Parameters 
``string tenantId``  
Tenant identifier.  

``string namespaceId``  
Namespace identifier.  

``string streamId``  
Stream identifier. 

##### Request body  
A serialized list of one or more events of the stream type

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Specified values were successfully updated|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

#### Note 
This request performs an insert or a replace depending on whether an event already exists at the event indexes. If any item fails to write, the entire operation is rolled back and
no events are written to the stream. The index that caused the issue is included in the error response.

---
## ``Replace Values``

Writes one or more events over existing events in the specified stream.

#### Request
 ```text
    PUT api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
		?allowCreate=false
 ```

##### Parameters 
``string tenantId``  
Tenant identifier.  

``string namespaceId``  
Namespace identifier.  

``string streamId``  
Stream identifier. 

##### Request Body
A serialized list of one or more events of the stream type

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Specified values were successfully deleted|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

#### Note 
This request returns an error if the stream does not have an event to be replaced at the specified index. If any individual event fails to be replaced, the entire operation is rolled back and no replaces are performed. The index that caused the issue and the streamId are included in the error response.



---

## `Patch Values`

Modifies the specified stream event(s). Patching affects only the data item parameters that are included in the call.

#### Request
 ```text
    PATCH api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
		 ?select={selectExpression}
 ```

##### Parameters 
``string tenantId``  
Tenant identifier.

``string namespaceId``  
Namespace identifier. 

``string streamId``  
Stream identifier.

``string selectExpression``  
Comma separated list of strings that indicates the event fields that will be changed in stream events  

##### Request body  
A serialized collection of one or more patch property events

#### Response  
The response includes a status code

##### Example request
Let's say that you have a stream `Simple` of `SimpleType`. To change one property(`Measurement`) for one event, you can use the request with the body below:
 ```text        
    PATCH api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/Simple/Data
		?select=measurement
 ```
##### Example request body
```json
[
  {  
    "Time":"2017-11-23T12:00:00Z",
    "Measurement":500.0
  }
]
```

This request will only change the `Measurement` value at the specified event index. 

#### Note 
Patching is used to patch the events of the selected fields for one or more events in the stream. Only the fields indicated in `selectExpression` are modified. The events to be modified are indicated by the index value of each entry in the collection. 

If there is a problem patching any individual event, the entire operation is rolled back and the error will indicate the `streamId` and `index` of the problem.  



## ``Remove Values``

There are two options for specifying which events to remove from a stream:
* [Index Collection](#removeindexcollection): One or more indexes can be specified in the request. 
* [Window](#window): A window can be specified with a start index and end index.

<a name="removeindexcollection"></a>
### `Index Collection`

Removes the event at each index from the specified stream. Different overloads are available to make it easier to indicate the index where you want to remove a data event. 

#### Request  
 ```text
    DELETE api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
		?index={index}[&index={index}…]
 ```

##### Parameters 
``string tenantId``  
Tenant identifier.  

``string namespaceId``  
Namespace identifier.  

``string streamId``  
Stream identifier. 

``string index``  
One or more indexes of events to remove

 
### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Specified values were successfully deleted|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

#### Note 
If any individual event fails to be removed, the entire operation is rolled back and no events are removed. The streamId and index that caused the issue are included in the error response. 

If you attempt to remove events at indexes that have no events, an error is returned. If this occurs, you can use [Window](#removewindow) request format to remove any events from a specified ‘window’ of indexes, which will not return an error if no data is found.

<a name="removewindow"></a>
### `Window`

Removes events at and between the start index and end index.

#### Request
 ```text
    DELETE api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
		?startIndex={startIndex}&endIndex={endIndex}
 ```

##### Parameters 
``string tenantId``  
Tenant identifier.  

``string namespaceId``  
Namespace identifier.  

``string streamId``  
Stream identifier. 

``string startIndex``  
The index defining the beginning of the window

``string endIndex``  
The index defining the end of the window  

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Specified values were successfully deleted|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}
```

#### Note 
If any individual event fails to be removed, the entire operation is rolled back and no removes are done.




---
## Definitions

### ErrorResponseBody

<a id="schemaerrorresponsebody"></a>
<a id="schema_ErrorResponseBody"></a>
<a id="tocSerrorresponsebody"></a>
<a id="tocserrorresponsebody"></a>

Contains the error message format that follows the OCS error standards

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Operation unique identifier of action that caused the error|
|Error|string|false|true|Error description|
|Reason|string|false|true|Reason for the error|
|Resolution|string|false|true|Resolution to resolve the error|
|Parameters|object|false|true|IDs or values that are creating or are affected by the error|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  }
}

```

---
