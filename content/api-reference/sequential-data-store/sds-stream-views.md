---
uid: sds-stream-views

---

# Stream Views
The API in this section interacts with stream views.

## `List Stream Views`

<a id="opIdView_List Stream Views"></a>

Returns a list of `SdsStreamView`.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews
?query={query}&filter={filter}&skip={skip}&count={count}&orderby={orderby}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string query`
<br/>Parameter representing a string search. See the [Search in SDS](xref:sdsSearching) topic for information about specifying the query parameter.
<br/><br/>`[optional] string filter`
<br/>Filter expression.<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>`[optional] string orderby`
<br/>Parameter representing sorted order of returned objects. A field name is required. The sorting is based on the stored values for the given field.<br/>For example, ``orderby=name`` would sort the returned results by the ``name`` values (ascending by default).<br/>Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending,<br/>by using values ``asc`` or ``desc``, respectively.<br/>For example, ``orderby=name desc`` would sort the returned results by the ``name`` values, descending.<br/>If no value is specified, there is no sorting of results.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsStreamView](#schemasdsstreamview)[]|Returns a list of `SdsStreamView` objects|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 200 Response

```json
HTTP/1.1 200
Content-Type: application/json
[
{
    "Id":"StreamView",
    "Name":"StreamView",
    "SourceTypeId":"Simple",
    "TargetTypeId":"Simple3"
},
{
    "Id":"StreamViewWithProperties",
    "Name":"StreamViewWithProperties",
    "SourceTypeId":"Simple",
    "TargetTypeId":"Simple3",
    "Properties":[
        {
            "SourceId":"Time",
            "TargetId":"Time"
        },
        {
            "SourceId":"State",
            "TargetId":"State"
        },
        {
            "SourceId":"Measurement",
            "TargetId":"Value"
        }
    ]
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

## `Get Stream View`

<a id="opIdView_Get Stream View"></a>

Returns the `SdsStreamView`.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamViewId`
<br/>Stream view identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsStreamView](#schemasdsstreamview)|Returns the `SdsStreamView`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 200 Response

```json
HTTP/1.1 200
Content-Type: application/json
{
    "Id":"StreamView",
    "Name":"StreamView",
    "SourceTypeId":"Simple",
    "TargetTypeId":"Simple3",
    "Properties":[
        {
            "SourceId":"Time",
            "TargetId":"Time"
        },
    {
        "SourceId":"State",
        "TargetId":"State"
    },
    {
        "SourceId":"Measurement",
        "TargetId":"Value"
    }
    ]
}
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

## `Get Or Create Stream View`

<a id="opIdView_Get Or Create Stream View"></a>

If an `SdsStreamView` with a matching identifier already exists, the stream view passed in is compared with the existing stream view. If the stream views are identical, a Found (302) status is returned and the stream view. If the stream views are different, the Conflict (409) error is returned. If no matching identifier is found, the specified stream view is created.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamViewId`
<br/>Stream view identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsStreamView](#schemasdsstreamview)|Returns the `SdsStreamView`|
|302|[SdsStreamView](#schemasdsstreamview)|Found a Stream View|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 200 Response ([SdsStreamView](#schemasdsstreamview))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "SourceTypeId": "string",
  "TargetTypeId": "string",
  "Properties": [
    {
      "SourceId": "string",
      "TargetId": "string",
      "SdsStreamView": "<SdsStreamView>"
    }
  ],
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z"
}
```

---

## `Create Or Update Stream View`

<a id="opIdView_Create Or Update Stream View"></a>

Creates or updates the definition of a `SdsStreamView`.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamViewId`
<br/>Stream view identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsStreamView](#schemasdsstreamview)|Returns the `SdsStreamView`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 200 Response ([SdsStreamView](#schemasdsstreamview))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "SourceTypeId": "string",
  "TargetTypeId": "string",
  "Properties": [
    {
      "SourceId": "string",
      "TargetId": "string",
      "SdsStreamView": "<SdsStreamView>"
    }
  ],
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z"
}
```

---

## `Delete Stream View`

<a id="opIdView_Delete Stream View"></a>

Deletes a stream view from the specified tenant and namespace.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamViewId`
<br/>Stream view identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`SdsStreamView` was successfully deleted.|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

---

## `Get Stream View Map`

<a id="opIdView_Get Stream View Map"></a>

Returns the `SdsStreamViewMap` corresponding to the specified streamViewId.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}/Map
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamViewId`
<br/>Stream view identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsStreamViewMap](#schemasdsstreamviewmap)|Returns the `SdsStreamViewMap`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 200 Response

```json
HTTP/1.1 200
Content-Type: application/json
{
    "SourceTypeId": "Simple",
    "TargetTypeId": "Simple3",
    "Properties": [
        {
            "SourceId": "Time",
            "TargetId": "Time"
        },
        {
            "SourceId": "Measurement",
            "TargetId": "Value",
            "Mode": 20
        },
        {
            "SourceId": "State",
            "Mode": 2
        },
        {
            "TargetId": "State",
            "Mode": 1
        }
    ]
}
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
## Definitions

### SdsStreamView

<a id="schemasdsstreamview"></a>
<a id="schema_SdsStreamView"></a>
<a id="tocSsdsstreamview"></a>
<a id="tocssdsstreamview"></a>

A contract defining the stream view.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|A unique identifier for the SdsStreamView.|
|Name|string|false|true|An optional user-friendly name for the SdsStreamView.|
|Description|string|false|true|A brief description of the SdsStreamView.|
|SourceTypeId|string|false|true|Identifier of the SdsType of the SdsStream.|
|TargetTypeId|string|false|true|Identifier of the SdsType to convert events to.|
|Properties|[[SdsStreamViewProperty](#schemasdsstreamviewproperty)]|false|true|List of SdsStreamViewProperty.|
|CreatedDate|date-time|false|false|The DateTime in ISO 8601 extended format and UTC time standard when the SdsStreamView was created. This value is set upon object creation and is immutable. The default value of the CreatedDate property of existing objects is DateTime.MinValue. This property cannot be modified by users.|
|ModifiedDate|date-time|false|false|The DateTime in ISO 8601 extended format and UTC time standard when the SdsStreamView was last modified. This value is initialized upon object creation and is updated each time an object's properties are successfully modified. The ModifiedDate property of an object will also update if the object's ACL or owner is modified. The default value of the ModifiedDate property of existing objects is DateTime.MinValue. This property cannot be modified by users.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "SourceTypeId": "string",
  "TargetTypeId": "string",
  "Properties": [
    {
      "SourceId": "string",
      "TargetId": "string",
      "SdsStreamView": "<SdsStreamView>"
    }
  ],
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z"
}

```

---

### SdsStreamViewProperty

<a id="schemasdsstreamviewproperty"></a>
<a id="schema_SdsStreamViewProperty"></a>
<a id="tocSsdsstreamviewproperty"></a>
<a id="tocssdsstreamviewproperty"></a>

A contract defining the stream view property.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|SourceId|string|false|true|Identifier of the SdsTypeProperty from the source SdsType Properties list.|
|TargetId|string|false|true|Identifier of the SdsTypeProperty from the target SdsType Properties list.|
|SdsStreamView|[SdsStreamView](#schemasdsstreamview)|false|true|Additional mapping instructions for derived types.|

```json
{
  "SourceId": "string",
  "TargetId": "string",
  "SdsStreamView": {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "SourceTypeId": "string",
    "TargetTypeId": "string",
    "Properties": "[<SdsStreamViewProperty>]",
    "CreatedDate": "2019-08-24T14:15:22Z",
    "ModifiedDate": "2019-08-24T14:15:22Z"
  }
}

```

---

### ErrorResponseBody

<a id="schemaerrorresponsebody"></a>
<a id="schema_ErrorResponseBody"></a>
<a id="tocSerrorresponsebody"></a>
<a id="tocserrorresponsebody"></a>

The error response contains standard details on the cause and resolution of the error.

<h4>Properties</h4>

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

### SdsStreamViewMap

<a id="schemasdsstreamviewmap"></a>
<a id="schema_SdsStreamViewMap"></a>
<a id="tocSsdsstreamviewmap"></a>
<a id="tocssdsstreamviewmap"></a>

A contract defining the stream view map.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|SourceTypeId|string|false|true|Identifier of the SdsType of the SdsStream.|
|TargetTypeId|string|false|true|Identifier of the SdsType to convert events to.|
|Properties|[[SdsStreamViewMapProperty](#schemasdsstreamviewmapproperty)]|false|true|Identifier of the SdsStreamViewMapProperty from the target SdsType Properties list.|

```json
{
  "SourceTypeId": "string",
  "TargetTypeId": "string",
  "Properties": [
    {
      "SourceId": "string",
      "TargetId": "string",
      "Mode": 0,
      "StreamViewMap": "<SdsStreamViewMap>"
    }
  ]
}

```

---

### SdsStreamViewMapProperty

<a id="schemasdsstreamviewmapproperty"></a>
<a id="schema_SdsStreamViewMapProperty"></a>
<a id="tocSsdsstreamviewmapproperty"></a>
<a id="tocssdsstreamviewmapproperty"></a>

A contract defining stream view map property.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|SourceId|string|false|true|Identifier of the SdsType of the SdsStream.|
|TargetId|string|false|true|Identifier of the SdsType to convert events to.|
|Mode|[SdsStreamViewMode](#schemasdsstreamviewmode)|false|false|Aggregate of actions applied to the properties. SdsStreamViewMode are combined via binary arithmetic.|
|StreamViewMap|[SdsStreamViewMap](#schemasdsstreamviewmap)|false|true|Mapping for derived types.|

```json
{
  "SourceId": "string",
  "TargetId": "string",
  "Mode": 0,
  "StreamViewMap": {
    "SourceTypeId": "string",
    "TargetTypeId": "string",
    "Properties": "[<SdsStreamViewMapProperty>]"
  }
}

```

---

### SdsStreamViewMode

<a id="schemasdsstreamviewmode"></a>
<a id="schema_SdsStreamViewMode"></a>
<a id="tocSsdsstreamviewmode"></a>
<a id="tocssdsstreamviewmode"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|None|0|
|FieldAdd|1|
|FieldRemove|2|
|FieldRename|4|
|FieldMove|8|
|FieldConversion|16|
|InvalidFieldConversion|32|

---

