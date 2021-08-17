---
uid: sds-stream-data-transform

---

# Transform data
API that transforms the stream data.  
The Transform route is for SdsStreamView and unit conversion of stream data.
- [Reading with SdsStreamViews](xref:sdsReadingData#reading-with-sdsstreamviews):Changing the shape of the returned data.
When transforming data with an SdsStreamView, the data read is converted to the target type specified in the SdsStreamView. 
All stream view transformations are HTTP GET requests. 
Specify the stream view ID `(streamViewId={streamViewId})` at the end of the transformation endpoint.
When data is requested with an SdsStreamView, the read characteristics defined by the target type of the SdsStreamView determine what is returned. 
- [Unit of measure conversions](xref:sdsReadingData#unit-conversion-of-data): Converting the unit of measure of the data. 
SDS supports assigning Units of Measure (UOM) to stream data.
If stream data has UOM information associated, SDS supports reading data with unit conversions applied.
On each read data request, unit conversions are specified by a user defined collection of SdsStreamPropertyOverride objects in read requests. 
All unit conversions of data are HTTP POST requests with a request body containing a collection of SdsStreamPropertyOverride objects. 

## `Get First Value (GET method)`

<a id="opIdStreamDataTransform_Get First"></a>

Returns the first value in the stream. If no values exist in the stream, null is returned.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/First
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

## `Get First Value (POST method)`

<a id="opIdStreamDataTransform_Get First2"></a>

Returns the first value in the stream. If no values exist in the stream, null is returned.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/First
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

## `Get Last Value (GET method)`

<a id="opIdStreamDataTransform_Get Last"></a>

Returns the last value in the stream. If no values exist in the stream, null is returned.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Last
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

## `Get Last Value (POST method)`

<a id="opIdStreamDataTransform_Get Last2"></a>

Returns the last value in the stream. If no values exist in the stream, null is returned.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Last
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

## `List Data (GET method)`

<a id="opIdStreamDataTransform_List Data"></a>

Returns a collection of stored values at indexes based on request parameters.
  
SDS supports four ways of specifying which stored events to return:
- [Find Distinct Value](xref:sdsReadingDataApi#find-distinct-value): Returns a stored event based on the specified index and searchMode. 
    
    **Parameters**: Accepts ``index`` and ``searchMode``.
- [Filtered](xref:sdsReadingDataApi#getvaluesfiltered): Returns a collection of stored values as determined by a filter.The filter limits results by applying an expression against event fields. 
    
    **Parameters**: Accepts a ``filter`` expression. 
- [Range](xref:sdsReadingDataApi#getvaluesrange): Returns a collection of stored values as determined by a ``startIndex`` and ``count``. 
    Additional optional parameters specify the direction of the range, how to handle events near or at the start index, whether to skip a certain number of events at the start of the range, and how to filter the data.
    
    **Parameters**: Accepts ``startIndex`` and ``count``.
- [Window](xref:sdsReadingDataApi#getvalueswindow): Returns a collection of stored events based on the specified ``startIndex`` and ``endIndex``. 
    
    **Parameters**: Accepts ``startIndex`` and ``endIndex``. This request has an optional continuation token for large collections of events.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform
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

## `Get Data (POST method)`

<a id="opIdStreamDataTransform_Get Data2"></a>

Returns a collection of stored values at indexes based on request parameters.
  
SDS supports four ways of specifying which stored events to return:
- [Find Distinct Value](xref:sdsReadingDataApi#find-distinct-value): Returns a stored event based on the specified index and searchMode. 
    
    **Parameters**: Accepts ``index`` and ``searchMode``.
- [Filtered](xref:sdsReadingDataApi#getvaluesfiltered): Returns a collection of stored values as determined by a filter.The filter limits results by applying an expression against event fields. 
    
    **Parameters**: Accepts a ``filter`` expression. 
- [Range](xref:sdsReadingDataApi#getvaluesrange): Returns a collection of stored values as determined by a ``startIndex`` and ``count``. 
    Additional optional parameters specify the direction of the range, how to handle events near or at the start index, whether to skip a certain number of events at the start of the range, and how to filter the data.
    
    **Parameters**: Accepts ``startIndex`` and ``count``.
- [Window](xref:sdsReadingDataApi#getvalueswindow): Returns a collection of stored events based on the specified ``startIndex`` and ``endIndex``. 
    
    **Parameters**: Accepts ``startIndex`` and ``endIndex``. This request has an optional continuation token for large collections of events.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform
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

## `List Interpolated Data (GET method)`

<a id="opIdStreamDataTransform_List Data Interpolated"></a>

Returns a collection of values based on request parameters.
The stream's read characteristics determine how events are calculated for indexes at which no stored event exists.
Interpolation is not supported for streams with compound indexes.

SDS supports two ways of specifying which stored events to return: index collection and interval.

[Index collection](xref:sdsReadingDataApi#index-collection): Returns events at the specified indexes.
If no stored event exists at a specified index, the stream's read characteristics determine how the returned event is calculated.

**Parameters**: Accepts ``index``.

[Interval](xref:sdsReadingDataApi#getvaluesinterpolatedinterval): Returns events at evenly spaced intervals based on the specified ``startIndex``, ``endIndex``, and ``count``. 
If no stored event exists at an index interval, the stream's read characteristics determine how the returned event is calculated. 

**Parameters**: Accepts ``startIndex``, ``endIndex`` and ``count``.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Interpolated
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

## `Get Interpolated Data (POST method)`

<a id="opIdStreamDataTransform_Get Data Interpolated2"></a>

Returns a collection of values based on request parameters.
The stream's read characteristics determine how events are calculated for indexes at which no stored event exists.
Interpolation is not supported for streams with compound indexes.

SDS supports two ways of specifying which stored events to return: index collection and interval.

[Index collection](xref:sdsReadingDataApi#index-collection): Returns events at the specified indexes.
If no stored event exists at a specified index, the stream's read characteristics determine how the returned event is calculated.

**Parameters**: Accepts ``index``.

[Interval](xref:sdsReadingDataApi#getvaluesinterpolatedinterval): Returns events at evenly spaced intervals based on the specified ``startIndex``, ``endIndex``, and ``count``. 
If no stored event exists at an index interval, the stream's read characteristics determine how the returned event is calculated. 

**Parameters**: Accepts ``startIndex``, ``endIndex`` and ``count``.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Interpolated
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

## `List Data Summaries (GET method)`

<a id="opIdStreamDataTransform_List Data Summaries"></a>

Returns summary intervals between a specified start and end index. Index types that cannot be interpolated do not support summary requests. Strings are an example of indexes that cannot be interpolated. Summaries are not supported for streams with compound indexes. Interpolating between two indexes that consist of multiple properties is not defined and results in non-determinant behavior.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Summaries
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

## `Get Data Summaries (POST method)`

<a id="opIdStreamDataTransform_Get Data Summaries2"></a>

Returns summary intervals between a specified start and end index. Index types that cannot be interpolated do not support summary requests. Strings are an example of indexes that cannot be interpolated. Summaries are not supported for streams with compound indexes. Interpolating between two indexes that consist of multiple properties is not defined and results in non-determinant behavior.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Summaries
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

## `List Data Samples (GET method)`

<a id="opIdStreamDataTransform_List Data Samples"></a>

Returns representative data sampled by intervals between a specified start and end index. Sampling is driven by a specified property or properties of the stream's Sds Type. Property types that cannot be interpolated do not support sampling requests. Strings are an example of a property that cannot be interpolated.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Sampled
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

## `Get Data Samples (POST method)`

<a id="opIdStreamDataTransform_Get Data Samples2"></a>

Returns representative data sampled by intervals between a specified start and end index. Sampling is driven by a specified property or properties of the stream's Sds Type. Property types that cannot be interpolated do not support sampling requests. Strings are an example of a property that cannot be interpolated.

### Request
```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Sampled
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

