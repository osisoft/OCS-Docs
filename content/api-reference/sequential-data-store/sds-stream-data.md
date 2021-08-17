---
uid: sds-stream-data

---

# Streams data
Controller for methods hosted at {streamId}/Data/

## `Get First Value`

<a id="opIdStreamData_Get First Value"></a>

Returns the first value in the stream. If no values exist in the stream, null is returned.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/First
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns a serialized event|
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

---

## `Get Last Value`

<a id="opIdStreamData_Get Last Value"></a>

Returns the last value in the stream. If no values exist in the stream, null is returned.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Last
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns a serialized event|
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

---

## `List Values`

<a id="opIdStreamData_List Values"></a>

Returns a collection of stored values at indexes based on request parameters.
  
SDS supports four ways of specifying which stored events to return:
- [Find Distinct Value](xref:sdsReadingDataApi#find-distinct-value): Returns a stored event based on the specified index and searchMode. 
    
    **Parameters**: Accepts ``index`` and ``searchMode``.
- [Filtered](xref:sdsReadingDataApi#filtered): Returns a collection of stored values as determined by a filter.The filter limits results by applying an expression against event fields. 
    
    **Parameters**: Accepts a ``filter`` expression. 
- [Range](xref:sdsReadingDataApi#range): Returns a collection of stored values as determined by a ``startIndex`` and ``count``. 
    Additional optional parameters specify the direction of the range, how to handle events near or at the start index, whether to skip a certain number of events at the start of the range, and how to filter the data.
    
    **Parameters**: Accepts ``startIndex`` and ``count``.
- [Window](xref:sdsReadingDataApi#window): Returns a collection of stored events based on the specified ``startIndex`` and ``endIndex``. 
    
    **Parameters**: Accepts ``startIndex`` and ``endIndex``. This request has an optional continuation token for large collections of events.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns a serialized collection of events|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response

```json
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

---

## `Insert Values`

<a id="opIdStreamData_Insert Values"></a>

Inserts data into the specified stream. Returns an error if data is already present at the index of any event.

**Notes**: This request will return an error if an event already exists for any index in the request.
If any individual index encounters a problem, the entire operation is rolled back and no insertions are made.
The streamId and index that caused the issue are included in the error response.  

### Request
```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

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

---

## `Update Values`

<a id="opIdStreamData_Update Values"></a>

Writes one or more events to or over existing events the specified stream. 

**Notes**: This request performs an insert or a replace depending on whether an event already exists at the event indexes.
If any item fails to write, the entire operation is rolled back and no events are written to the stream.
The index that caused the issue is included in the error response.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

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

---

## `Patch Values`

<a id="opIdStreamData_Patch Values"></a>

Modifies the specified stream event(s). 
Patching affects only the data item parameters that are included in the call.

**Notes**: Patching is used to patch the events of the selected fields for one or more events in the stream.
Only the fields indicated in ``selectExpression`` are modified.
The events to be modified are indicated by the index value of each entry in the collection. 
If there is a problem patching any individual event, the entire operation is rolled back and the error will indicate the ``streamId`` and ``index`` of the problem.

### Request
```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Specified values were successfully corrected|
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

---

## `Remove Values`

<a id="opIdStreamData_Remove Values"></a>

There are two options for specifying which events to remove from a stream: index collection and windows

[Index Collection](xref:sdsWritingDataApi#index-collection): Removes the event at each index from the specified stream. 
Different overloads are available to make it easier to indicate the index where you want to remove a data event. 
One or more indexes can be specified in the request.

[Window](xref:sdsWritingDataApi#window): Removes events at and between the start index and end index.
A window can be specified with a start index and end index.

**Notes**: If any individual event fails to be removed, the entire operation is rolled back and no events are removed.
The ``streamId`` and ``index`` that caused the issue are included in the error response.
If you attempt to remove events at indexes that have no events, an error is returned.
If this occurs, use the [Window](xref:sdsWritingDataApi#window) request format to remove any events from a specified window of indexes, which will not return an error if no data is found.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

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

---

## `List Interpolated Values`

<a id="opIdStreamData_List Interpolated Values"></a>

Returns a collection of values based on request parameters.
The stream's read characteristics determine how events are calculated for indexes at which no stored event exists.
Interpolation is not supported for streams with compound indexes.

SDS supports two ways of specifying which stored events to return: index collection and interval.

[Index collection](xref:sdsReadingDataApi#index-collection): Returns events at the specified indexes.
If no stored event exists at a specified index, the stream's read characteristics determine how the returned event is calculated.

**Parameters**: Accepts ``index``.

[Interval](xref:sdsReadingDataApi#interval): Returns events at evenly spaced intervals based on the specified ``startIndex``, ``endIndex``, and ``count``. 
If no stored event exists at an index interval, the stream's read characteristics determine how the returned event is calculated. 

**Parameters**: Accepts ``startIndex``, ``endIndex`` and ``count``.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Interpolated
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns a serialized collection of events. Depending on the specified indexes and read characteristics of the stream, it is possible to have less events returned than specified indexes. An empty collection can also be returned.|
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

---

## `List Summaries`

<a id="opIdStreamData_List Summaries"></a>

Returns summary intervals between a specified start and end index. Index types that cannot be interpolated do not support summary requests. Strings are an example of indexes that cannot be interpolated. Summaries are not supported for streams with compound indexes. Interpolating between two indexes that consist of multiple properties is not defined and results in non-determinant behavior.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Summaries
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns a serialized collection of SdsIntervals. Each SdsInterval has a start, end, and collection of summary values.|
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

---

## `List Sampled Values`

<a id="opIdStreamData_List Sampled Values"></a>

Returns representative data sampled by intervals between a specified start and end index. Sampling is driven by a specified property or properties of the stream's Sds Type. Property types that cannot be interpolated do not support sampling requests. Strings are an example of a property that cannot be interpolated.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Sampled
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns a serialized collection of events|
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

