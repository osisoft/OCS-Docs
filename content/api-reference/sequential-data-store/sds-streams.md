---
uid: sds-streams

---

# Streams
The API in this section interacts with streams.

## `List Streams`

<a id="opIdStream_List Streams"></a>

Returns a list of streams.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams
?query={query}&filter={filter}&skip={skip}&count={count}&orderby={orderby}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] string query`
<br/>Parameter representing a string search.<br/><br/>`[optional] string filter`
<br/>Parameter representing a filter expression.<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first SdsType to retrieve. If not specified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of SdsTypes to retrieve. If not specified, a default value of 100 is used.<br/><br/>`[optional] string orderby`
<br/>Parameter representing sorted order which SdsTypes will be returned. A field name is required. The sorting is based on the stored values for the given field (of type string). For example, orderby=name would sort the returned results by the name values (ascending by default). Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending, by using values asc or desc, respectively. For example, orderby=name desc would sort the returned results by the name values, descending. If no value is specified, there is no sorting of result.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsStream](#schemasdsstream)[]|Returns a list of `SdsStream` objects|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 200 Response ([SdsStream](#schemasdsstream)[])

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "TypeId": "string",
    "Indexes": [
      {
        "SdsTypePropertyId": "string"
      }
    ],
    "InterpolationMode": 0,
    "ExtrapolationMode": 0,
    "PropertyOverrides": [
      {
        "SdsTypePropertyId": "string",
        "Uom": "string",
        "InterpolationMode": 0
      }
    ],
    "CreatedDate": "2019-08-24T14:15:22Z",
    "ModifiedDate": "2019-08-24T14:15:22Z"
  }
]
```

---

## `Get Stream`

<a id="opIdStream_Get Stream"></a>

Returns the specified stream.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsStream](#schemasdsstream)|Returns the `SdsStream`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 200 Response ([SdsStream](#schemasdsstream))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TypeId": "string",
  "Indexes": [
    {
      "SdsTypePropertyId": "string"
    }
  ],
  "InterpolationMode": 0,
  "ExtrapolationMode": 0,
  "PropertyOverrides": [
    {
      "SdsTypePropertyId": "string",
      "Uom": "string",
      "InterpolationMode": 0
    }
  ],
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z"
}
```

---

## `Get Or Create Stream`

<a id="opIdStream_Get Or Create Stream"></a>

Creates the specified stream. If a stream with a matching identifier already exists, SDS compares the existing stream with the stream that was sent.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsStream](#schemasdsstream)|`SdsStream` was successfully returned|
|201|[SdsStream](#schemasdsstream)|`SdsStream` was successfully created|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 200 Response ([SdsStream](#schemasdsstream))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TypeId": "string",
  "Indexes": [
    {
      "SdsTypePropertyId": "string"
    }
  ],
  "InterpolationMode": 0,
  "ExtrapolationMode": 0,
  "PropertyOverrides": [
    {
      "SdsTypePropertyId": "string",
      "Uom": "string",
      "InterpolationMode": 0
    }
  ],
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z"
}
```

---

## `Create Or Update Stream`

<a id="opIdStream_Create Or Update Stream"></a>

Creates the specified stream. If a stream with the same Id already exists, the definition of the stream is updated.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[SdsStream](#schemasdsstream)|`SdsStream` was successfully created|
|204|None|`SdsStream` was successfully updated|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 201 Response ([SdsStream](#schemasdsstream))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TypeId": "string",
  "Indexes": [
    {
      "SdsTypePropertyId": "string"
    }
  ],
  "InterpolationMode": 0,
  "ExtrapolationMode": 0,
  "PropertyOverrides": [
    {
      "SdsTypePropertyId": "string",
      "Uom": "string",
      "InterpolationMode": 0
    }
  ],
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z"
}
```

---

## `Delete Stream`

<a id="opIdStream_Delete Stream"></a>

Deletes a stream from the specified tenant and namespace.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`SdsStream` was successfully deleted|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

---

## `Get Stream Type`

<a id="opIdStream_Get Stream Type"></a>

Returns the type definition that is associated with a given stream.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Type
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsType](#schemasdstype)|Returns the `SdsType`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 200 Response ([SdsType](#schemasdstype))

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "SdsTypeCode": 0,
  "IsGenericType": true,
  "IsReferenceType": true,
  "GenericArguments": "[<SdsType>]",
  "Properties": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "Order": 0,
      "IsKey": true,
      "FixedSize": 0,
      "SdsType": "<SdsType>",
      "Value": null,
      "Uom": "string",
      "InterpolationMode": 0,
      "IsQuality": true
    }
  ],
  "BaseType": "<SdsType>",
  "DerivedTypes": "[<SdsType>]",
  "InterpolationMode": 0,
  "ExtrapolationMode": 0,
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z"
}
```

---

## `Update Stream Type`

<a id="opIdStream_Update Stream Type"></a>

Returns the type definition that is associated with a given stream.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Type
?streamViewId={streamViewId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/>
`[optional] string streamViewId`
<br/>Stream view identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`SdsType` was successfully updated|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

---

## `Get Resolved Stream`

<a id="opIdStream_Get Resolved Stream"></a>

Returns the resolved stream and type representation that is associated with a given stream.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Resolved
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[SdsResolvedStream](#schemasdsresolvedstream)|`SdsResolvedStream` was successfully retrieved|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 200 Response

```json
{
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "Indexes": [
        {
        "SdsTypePropertyId": "string"
        }
    ],
    "CreatedDate": "2019-08-24T14:15:22Z",
    "ModifiedDate": "2019-08-24T14:15:22Z",
    "Resolved": true,
    "Type": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": "Empty",
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
        {
            "Id": "string",
            "Name": "string",
            "Description": "string",
            "SdsTypeCode": 0,
            "IsGenericType": true,
            "IsReferenceType": true,
            "GenericArguments": "[<SdsType>]",
            "Properties": [
            {
                "Id": "string",
                "Name": "string",
                "Description": "string",
                "Order": 0,
                "IsKey": true,
                "FixedSize": 0,
                "SdsType": "<SdsType>",
                "Value": null,
                "Uom": "string",
                "InterpolationMode": 0,
                "IsQuality": true
            }
            ],
            "InterpolationMode": 0,
            "ExtrapolationMode": 0,
            "CreatedDate": "2019-08-24T14:15:22Z",
            "ModifiedDate": "2019-08-24T14:15:22Z"
        }
        ],
        "Properties": [
        {
            "Id": "string",
            "Name": "string",
            "Description": "string",
            "Order": 0,
            "IsKey": true,
            "FixedSize": 0,
            "SdsType": "<SdsResolvedType>",
            "Value": null,
            "Uom": "string",
            "InterpolationMode": "Default",
            "IsQuality": true
        }
        ],
        "InterpolationMode": "Default",
        "ExtrapolationMode": "All",
        "CreatedDate": "2019-08-24T14:15:22Z",
        "ModifiedDate": "2019-08-24T14:15:22Z"
    }
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

## `Get Resolved Streams`

<a id="opIdStream_Get Resolved Streams"></a>

Returns bulk resolved stream and type representations that are associated with provided streams. The list of stream identifiers to be resolved should be supplied as a list of stream IDs in the request body. HTTP 207 is returned regardless of partial or complete success of stream resolution. Any stream that cannot be resolved with be included in the ChildErrors property of the `SdsResolvedStreamsResponse`.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/Streams/Resolved
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|207|[SdsResolvedStreamsResponse](#schemasdsresolvedstreamsresponse)|`SdsResolvedStreamsResponse` was successfully retrieved|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

<h4>Example response body</h4>

> 207 Response

```json
{
    "Data": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "Indexes": [{ "SdsTypePropertyId": "string" }],
        "CreatedDate": "2019-08-24T14:15:22Z",
        "ModifiedDate": "2019-08-24T14:15:22Z",
        "Resolved": true,
        "Type": {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "SdsTypeCode": "Empty",
          "IsGenericType": true,
          "IsReferenceType": true,
          "GenericArguments": [
            {
              "Id": "string",
              "Name": "string",
              "Description": "string",
              "SdsTypeCode": 0,
              "IsGenericType": true,
              "IsReferenceType": true,
              "GenericArguments": "[<SdsType>]",
              "Properties": [
                {
                  "Id": "string",
                  "Name": "string",
                  "Description": "string",
                  "Order": 0,
                  "IsKey": true,
                  "FixedSize": 0,
                  "SdsType": "<SdsType>",
                  "Value": null,
                  "Uom": "string",
                  "InterpolationMode": "[",
                  "IsQuality": true
                }
              ],
              "InterpolationMode": 0,
              "ExtrapolationMode": 0,
              "CreatedDate": "2019-08-24T14:15:22Z",
              "ModifiedDate": "2019-08-24T14:15:22Z"
            }
          ],
          "Properties": [
            {
              "Id": "string",
              "Name": "string",
              "Description": "string",
              "Order": 0,
              "IsKey": true,
              "FixedSize": 0,
              "SdsType": "<SdsResolvedType>",
              "Value": null,
              "Uom": "string",
              "InterpolationMode": "Default",
              "IsQuality": true
            }
          ],
          "InterpolationMode": "Default",
          "ExtrapolationMode": "All",
          "CreatedDate": "2019-08-24T14:15:22Z",
          "ModifiedDate": "2019-08-24T14:15:22Z"
        }
      }
    ],
    "ChildErrors": [
      {
        "OperationId": "string",
        "Error": "string",
        "Reason": "string",
        "Resolution": "string",
        "Parameters": { "property1": "string", "property2": "string" },
        "StreamId": "string",
        "StatusCode": 100
      }
    ]
  }
```> 400 Response ([ErrorResponseBody](#schemaerrorresponsebody))

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

### SdsStream

<a id="schemasdsstream"></a>
<a id="schema_SdsStream"></a>
<a id="tocSsdsstream"></a>
<a id="tocssdsstream"></a>

A contract defining read and write operations on data of SdsType.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|A unique identifier for the SdsStream object.|
|Name|string|false|true|An optional user-friendly name for the SdsStream object.|
|Description|string|false|true|A brief description of the SdsStream object.|
|TypeId|string|false|true|A unique identifier for the SdsType of the SdsStream object.|
|Indexes|[[SdsStreamIndex](#schemasdsstreamindex)]|false|true|List of SdsStreamIndexs to define secondary indexes for the SdsStream.|
|InterpolationMode|[SdsInterpolationMode](#schemasdsinterpolationmode)|false|true|Defines the SdsInterpolationMode of the SdsStream. Default is null.|
|ExtrapolationMode|[SdsExtrapolationMode](#schemasdsextrapolationmode)|false|true|Defines the SdsExtrapolationMode of the SdsStream. Default is null.|
|PropertyOverrides|[[SdsStreamPropertyOverride](#schemasdsstreampropertyoverride)]|false|true|List of SdsStreamPropertyOverrides to define unit of measure and interpolation mode overrides for the SdsStream.|
|CreatedDate|date-time|false|false|The DateTime in ISO 8601 extended format and UTC time standard when the SdsStream was created. This value is set upon object creation and is immutable. The default value of the CreatedDate property of existing objects is DateTime.MinValue. This property cannot be modified by users.|
|ModifiedDate|date-time|false|false|The DateTime in ISO 8601 extended format and UTC time standard when the SdsStream was last modified. This value is initialized upon object creation and is updated each time an object's properties are successfully modified. The ModifiedDate property of an object will also update if the object's ACL or owner is modified. The default value of the ModifiedDate property of existing objects is DateTime.MinValue. This property cannot be modified by users.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TypeId": "string",
  "Indexes": [
    {
      "SdsTypePropertyId": "string"
    }
  ],
  "InterpolationMode": 0,
  "ExtrapolationMode": 0,
  "PropertyOverrides": [
    {
      "SdsTypePropertyId": "string",
      "Uom": "string",
      "InterpolationMode": 0
    }
  ],
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z"
}

```

---

### SdsStreamIndex

<a id="schemasdsstreamindex"></a>
<a id="schema_SdsStreamIndex"></a>
<a id="tocSsdsstreamindex"></a>
<a id="tocssdsstreamindex"></a>

Indexes speed up and order the results of stream data filtering. SdsStreamIndex or secondary indexes is defined on the stream and is applied to a single property. You can define several secondary indexes. Secondary index values need not be unique.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|SdsTypePropertyId|string|false|true|A unique identifier for the SdsTypeProperty.|

```json
{
  "SdsTypePropertyId": "string"
}

```

---

### SdsInterpolationMode

<a id="schemasdsinterpolationmode"></a>
<a id="schema_SdsInterpolationMode"></a>
<a id="tocSsdsinterpolationmode"></a>
<a id="tocssdsinterpolationmode"></a>

Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Continuous|0|Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects.|
|Default|0|Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects.|
|StepwiseContinuousLeading|1|Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects.|
|StepwiseContinuousTrailing|2|Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects.|
|Discrete|3|Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects.|
|ContinuousNullableLeading|4|Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects.|
|ContinuousNullableTrailing|5|Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects.|

---

### SdsExtrapolationMode

<a id="schemasdsextrapolationmode"></a>
<a id="schema_SdsExtrapolationMode"></a>
<a id="tocSsdsextrapolationmode"></a>
<a id="tocssdsextrapolationmode"></a>

Defines how a stream responds to requests with indexes that precede or follow all data in the stream. Behavior also depends on the SdsInterpolationMode for a stream. If SdsInterpolationMode is set to Discrete, extrapolation won't occur. If SdsInterpolationMode is set to ContinuousNullableLeading or ContinuousNullableTrailing, default values will be returned instead of actual data.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|All|0|Defines how a stream responds to requests with indexes that precede or follow all data in the stream. Behavior also depends on the SdsInterpolationMode for a stream. If SdsInterpolationMode is set to Discrete, extrapolation won't occur. If SdsInterpolationMode is set to ContinuousNullableLeading or ContinuousNullableTrailing, default values will be returned instead of actual data.|
|None|1|Defines how a stream responds to requests with indexes that precede or follow all data in the stream. Behavior also depends on the SdsInterpolationMode for a stream. If SdsInterpolationMode is set to Discrete, extrapolation won't occur. If SdsInterpolationMode is set to ContinuousNullableLeading or ContinuousNullableTrailing, default values will be returned instead of actual data.|
|Forward|2|Defines how a stream responds to requests with indexes that precede or follow all data in the stream. Behavior also depends on the SdsInterpolationMode for a stream. If SdsInterpolationMode is set to Discrete, extrapolation won't occur. If SdsInterpolationMode is set to ContinuousNullableLeading or ContinuousNullableTrailing, default values will be returned instead of actual data.|
|Backward|3|Defines how a stream responds to requests with indexes that precede or follow all data in the stream. Behavior also depends on the SdsInterpolationMode for a stream. If SdsInterpolationMode is set to Discrete, extrapolation won't occur. If SdsInterpolationMode is set to ContinuousNullableLeading or ContinuousNullableTrailing, default values will be returned instead of actual data.|

---

### SdsStreamPropertyOverride

<a id="schemasdsstreampropertyoverride"></a>
<a id="schema_SdsStreamPropertyOverride"></a>
<a id="tocSsdsstreampropertyoverride"></a>
<a id="tocssdsstreampropertyoverride"></a>

SdsStreamPropertyOverride object provides a way to override interpolation behavior and unit of measure for individual SdsType Properties for a specific SdsStream.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|SdsTypePropertyId|string|false|true|A unique identifier for the SdsTypeProperty object that needs to be overridden.|
|Uom|string|false|true|The ID, name, or abbreviation of the unit of measure to be applied to the SdsTypeProperty.|
|InterpolationMode|[SdsInterpolationMode](#schemasdsinterpolationmode)|false|true|Defines the InterpolationMode of the SdsTypeProperty.|

```json
{
  "SdsTypePropertyId": "string",
  "Uom": "string",
  "InterpolationMode": 0
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

### SdsType

<a id="schemasdstype"></a>
<a id="schema_SdsType"></a>
<a id="tocSsdstype"></a>
<a id="tocssdstype"></a>

A contract defining the type of data to read or write in a SdsStream.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|A unique identifier for the SdsType object.|
|Name|string|false|true|An optional user-friendly name for the SdsType object.|
|Description|string|false|true|A brief description of the SdsType object.|
|SdsTypeCode|[SdsTypeCode](#schemasdstypecode)|false|false|The SdsTypeCode of the SdsType object.|
|IsGenericType|boolean|false|false|A boolean value indicating whether the current SdsType is a generic type. This property is only used when using templates or generics. It will be automatically set if the SdsType is generated using SdsTypeBuilder. For further information on generics, please refer, https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/generics/index.|
|IsReferenceType|boolean|false|false|Enabling this property preserves objects as references during serialization/de-serialization of the SdsType data while using the SdsFormatter. This property behaves similar to IsReference property for DataContractSerializer and is only valid for serialization if SdsFormatter is used.|
|GenericArguments|[[SdsType](#schemasdstype)]|false|true|Contains the parameterized SdsTypes of the current generic SdsType. This property is only used when using templates or generics. It will be automatically set if the SdsType is generated using SdsTypeBuilder. For further information on generics, please refer to https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/generics/index.|
|Properties|[[SdsTypeProperty](#schemasdstypeproperty)]|false|true|List of SdsTypePropertys of the SdsType.|
|BaseType|[SdsType](#schemasdstype)|false|true|Defines the base type of the SdsType. Commonly used by SdsTypeBuilder to generate SdsType from contracts not explicitly defined and maintained by the user.|
|DerivedTypes|[[SdsType](#schemasdstype)]|false|true|List of SdsTypes that should be recognized by SdsFormatter during serialization/de-serialization. This property behaves similar to KnownTypeAttribute attribute for DataContractSerializer and only valid for serialization if SdsFormatter is used.|
|InterpolationMode|[SdsInterpolationMode](#schemasdsinterpolationmode)|false|false|Defines the SdsInterpolationMode of the SdsType. This property is only valid for the root SdsType and invalid for SdsTypes of SdsTypePropertys.|
|ExtrapolationMode|[SdsExtrapolationMode](#schemasdsextrapolationmode)|false|false|Defines the SdsExtrapolationMode of the SdsType. This property is only valid for the root SdsType and invalid for SdsTypes of SdsTypePropertys.|
|CreatedDate|date-time|false|false|The DateTime in ISO 8601 extended format and UTC time standard when the SdsType was created. This value is set upon object creation and is immutable. The default value of the CreatedDate property of existing objects is DateTime.MinValue. This property cannot be modified by users.|
|ModifiedDate|date-time|false|false|The DateTime in ISO 8601 extended format and UTC time standard when the SdsType was last modified. This value is initialized upon object creation and is updated each time an object's properties are successfully modified. The ModifiedDate property of an object will also update if the object's ACL or owner is modified. The default value of the ModifiedDate property of existing objects is DateTime.MinValue. This property cannot be modified by users.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "SdsTypeCode": 0,
  "IsGenericType": true,
  "IsReferenceType": true,
  "GenericArguments": "[<SdsType>]",
  "Properties": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "Order": 0,
      "IsKey": true,
      "FixedSize": 0,
      "SdsType": "<SdsType>",
      "Value": null,
      "Uom": "string",
      "InterpolationMode": 0,
      "IsQuality": true
    }
  ],
  "BaseType": "<SdsType>",
  "DerivedTypes": "[<SdsType>]",
  "InterpolationMode": 0,
  "ExtrapolationMode": 0,
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z"
}

```

---

### SdsTypeCode

<a id="schemasdstypecode"></a>
<a id="schema_SdsTypeCode"></a>
<a id="tocSsdstypecode"></a>
<a id="tocssdstypecode"></a>

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Empty|0||
|Object|1||
|Boolean|3||
|Char|4||
|SByte|5||
|Byte|6||
|Int16|7||
|UInt16|8||
|Int32|9||
|UInt32|10||
|Int64|11||
|UInt64|12||
|Single|13||
|Double|14||
|Decimal|15||
|DateTime|16||
|String|18||
|Guid|19||
|DateTimeOffset|20||
|TimeSpan|21||
|Version|22||
|NullableBoolean|103||
|NullableChar|104||
|NullableSByte|105||
|NullableByte|106||
|NullableInt16|107||
|NullableUInt16|108||
|NullableInt32|109||
|NullableUInt32|110||
|NullableInt64|111||
|NullableUInt64|112||
|NullableSingle|113||
|NullableDouble|114||
|NullableDecimal|115||
|NullableDateTime|116||
|NullableGuid|119||
|NullableDateTimeOffset|120||
|NullableTimeSpan|121||
|BooleanArray|203||
|CharArray|204||
|SByteArray|205||
|ByteArray|206||
|Int16Array|207||
|UInt16Array|208||
|Int32Array|209||
|UInt32Array|210||
|Int64Array|211||
|UInt64Array|212||
|SingleArray|213||
|DoubleArray|214||
|DecimalArray|215||
|DateTimeArray|216||
|StringArray|218||
|GuidArray|219||
|DateTimeOffsetArray|220||
|TimeSpanArray|221||
|VersionArray|222||
|Array|400||
|IList|401||
|IDictionary|402||
|IEnumerable|403||
|SdsType|501||
|SdsTypeProperty|502||
|SdsStreamView|503||
|SdsStreamViewProperty|504||
|SdsStreamViewMap|505||
|SdsStreamViewMapProperty|506||
|SdsStream|507||
|SdsStreamIndex|508||
|SdsTable|509||
|SdsColumn|510||
|SdsValues|511||
|SdsObject|512||
|SByteEnum|605||
|ByteEnum|606||
|Int16Enum|607||
|UInt16Enum|608||
|Int32Enum|609||
|UInt32Enum|610||
|Int64Enum|611||
|UInt64Enum|612||
|NullableSByteEnum|705||
|NullableByteEnum|706||
|NullableInt16Enum|707||
|NullableUInt16Enum|708||
|NullableInt32Enum|709||
|NullableUInt32Enum|710||
|NullableInt64Enum|711||
|NullableUInt64Enum|712||

---

### SdsTypeProperty

<a id="schemasdstypeproperty"></a>
<a id="schema_SdsTypeProperty"></a>
<a id="tocSsdstypeproperty"></a>
<a id="tocssdstypeproperty"></a>

A contract defining a property of a SdsType.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|A unique identifier for the SdsTypeProperty object.|
|Name|string|false|true|An optional user-friendly name for the SdsTypeProperty object.|
|Description|string|false|true|A brief description of the SdsTypeProperty object.|
|Order|int32|false|false|The order used for comparison among SdsTypePropertys if a compound index is specified for SdsType.|
|IsKey|boolean|false|false|A boolean value indicating whether the current SdsTypeProperty must be used for indexing.|
|FixedSize|int32|false|false|An optional property specifying the length of string.|
|SdsType|[SdsType](#schemasdstype)|false|true|SdsType of the current SdsTypeProperty.|
|Value|any|false|true|An enum value of the current SdsTypeProperty.|
|Uom|string|false|true|Indicates the Unit of Measure of the current SdsTypeProperty.|
|InterpolationMode|[SdsInterpolationMode](#schemasdsinterpolationmode)|false|true|An InterpolationMode that overrides the root SdsType's InterpolationMode for this SdsTypeProperty.|
|IsQuality|boolean|false|false|Indicates whether this property marks data quality.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "Order": 0,
  "IsKey": true,
  "FixedSize": 0,
  "SdsType": {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "SdsTypeCode": 0,
    "IsGenericType": true,
    "IsReferenceType": true,
    "GenericArguments": "[<SdsType>]",
    "Properties": "[<SdsTypeProperty>]",
    "BaseType": "<SdsType>",
    "DerivedTypes": "[<SdsType>]",
    "InterpolationMode": 0,
    "ExtrapolationMode": 0,
    "CreatedDate": "2019-08-24T14:15:22Z",
    "ModifiedDate": "2019-08-24T14:15:22Z"
  },
  "Value": null,
  "Uom": "string",
  "InterpolationMode": 0,
  "IsQuality": true
}

```

---

### SdsResolvedStream

<a id="schemasdsresolvedstream"></a>
<a id="schema_SdsResolvedStream"></a>
<a id="tocSsdsresolvedstream"></a>
<a id="tocssdsresolvedstream"></a>

A contract defining resolution of SdsStream.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|A unique identifier for the SdsStream object.|
|Name|string|false|true|An optional user-friendly name for the SdsStream object.|
|Description|string|false|true|A brief description of the SdsStream object.|
|TypeId|string|false|true|A unique identifier for the SdsType of the SdsStream object|
|Indexes|[[SdsStreamIndex](#schemasdsstreamindex)]|false|true|List of SdsStreamIndexs to define secondary indexes for the SdsStream.|
|InterpolationMode|[SdsInterpolationMode](#schemasdsinterpolationmode)|false|true|Defines the SdsInterpolationMode of the SdsStream. Default is null.|
|ExtrapolationMode|[SdsExtrapolationMode](#schemasdsextrapolationmode)|false|true|Defines the SdsExtrapolationMode of the SdsStream. Default is null.|
|PropertyOverrides|[[SdsStreamPropertyOverride](#schemasdsstreampropertyoverride)]|false|true|List of SdsStreamPropertyOverrides to define unit of measure and interpolation mode overrides for the SdsStream|
|CreatedDate|date-time|false|false|The DateTime in ISO 8601 extended format and UTC time standard when the SdsStream was created. This value is set upon object creation and is immutable. The default value of the CreatedDate property of existing objects is DateTime.MinValue. This property cannot be modified by users.|
|ModifiedDate|date-time|false|false|The DateTime in ISO 8601 extended format and UTC time standard when the SdsStream was last modified. This value is initialized upon object creation and is updated each time an object's properties are successfully modified. The ModifiedDate property of an object will also update if the object's ACL or owner is modified. The default value of the ModifiedDate property of existing objects is DateTime.MinValue. This property cannot be modified by users.|
|Resolved|boolean|false|false|None|
|Type|[SdsResolvedType](#schemasdsresolvedtype)|false|true|A contract defining the type of data to read or write in a SdsResolvedStream.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "TypeId": "string",
  "Indexes": [
    {
      "SdsTypePropertyId": "string"
    }
  ],
  "InterpolationMode": 0,
  "ExtrapolationMode": 0,
  "PropertyOverrides": [
    {
      "SdsTypePropertyId": "string",
      "Uom": "string",
      "InterpolationMode": 0
    }
  ],
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "Resolved": true,
  "Type": {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "SdsTypeCode": "Empty",
    "IsGenericType": true,
    "IsReferenceType": true,
    "GenericArguments": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": 0,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": "[<SdsType>]",
        "Properties": [
          {
            "Id": "string",
            "Name": "string",
            "Description": "string",
            "Order": 0,
            "IsKey": true,
            "FixedSize": 0,
            "SdsType": "<SdsType>",
            "Value": null,
            "Uom": "string",
            "InterpolationMode": 0,
            "IsQuality": true
          }
        ],
        "BaseType": "<SdsType>",
        "DerivedTypes": "[<SdsType>]",
        "InterpolationMode": 0,
        "ExtrapolationMode": 0,
        "CreatedDate": "2019-08-24T14:15:22Z",
        "ModifiedDate": "2019-08-24T14:15:22Z"
      }
    ],
    "Properties": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "Order": 0,
        "IsKey": true,
        "FixedSize": 0,
        "SdsType": "<SdsResolvedType>",
        "Value": null,
        "Uom": "string",
        "InterpolationMode": "Default",
        "IsQuality": true
      }
    ],
    "BaseType": {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "SdsTypeCode": 0,
      "IsGenericType": true,
      "IsReferenceType": true,
      "GenericArguments": "[<SdsType>]",
      "Properties": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "Order": 0,
          "IsKey": true,
          "FixedSize": 0,
          "SdsType": "<SdsType>",
          "Value": null,
          "Uom": "string",
          "InterpolationMode": 0,
          "IsQuality": true
        }
      ],
      "BaseType": "<SdsType>",
      "DerivedTypes": "[<SdsType>]",
      "InterpolationMode": 0,
      "ExtrapolationMode": 0,
      "CreatedDate": "2019-08-24T14:15:22Z",
      "ModifiedDate": "2019-08-24T14:15:22Z"
    },
    "DerivedTypes": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": 0,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": "[<SdsType>]",
        "Properties": [
          {
            "Id": "string",
            "Name": "string",
            "Description": "string",
            "Order": 0,
            "IsKey": true,
            "FixedSize": 0,
            "SdsType": "<SdsType>",
            "Value": null,
            "Uom": "string",
            "InterpolationMode": 0,
            "IsQuality": true
          }
        ],
        "BaseType": "<SdsType>",
        "DerivedTypes": "[<SdsType>]",
        "InterpolationMode": 0,
        "ExtrapolationMode": 0,
        "CreatedDate": "2019-08-24T14:15:22Z",
        "ModifiedDate": "2019-08-24T14:15:22Z"
      }
    ],
    "InterpolationMode": "Default",
    "ExtrapolationMode": "All",
    "CreatedDate": "2019-08-24T14:15:22Z",
    "ModifiedDate": "2019-08-24T14:15:22Z"
  }
}

```

---

### SdsResolvedType

<a id="schemasdsresolvedtype"></a>
<a id="schema_SdsResolvedType"></a>
<a id="tocSsdsresolvedtype"></a>
<a id="tocssdsresolvedtype"></a>

A contract defining the type of data to read or write in a SdsResolvedStream.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|A unique identifier for the SdsType object.|
|Name|string|false|true|An optional user-friendly name for the SdsType object.|
|Description|string|false|true|A brief description of the SdsType object.|
|SdsTypeCode|[SdsTypeCode2](#schemasdstypecode2)|false|false|None|
|IsGenericType|boolean|false|false|A boolean value indicating whether the current SdsType is a generic type. This property is only used when using templates or generics. It will be automatically set if the SdsType is generated using SdsTypeBuilder. For further information on generics, please refer, https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/generics/index.|
|IsReferenceType|boolean|false|false|Enabling this property preserves objects as references during serialization/de-serialization of the SdsType data while using the SdsFormatter. This property behaves similar to IsReference property for DataContractSerializer and is only valid for serialization if SdsFormatter is used.|
|GenericArguments|[[SdsType](#schemasdstype)]|false|true|Contains the parameterized SdsTypes of the current generic SdsType. This property is only used when using templates or generics. It will be automatically set if the SdsType is generated using SdsTypeBuilder. For further information on generics, please refer to https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/generics/index.|
|Properties|[[SdsResolvedTypeProperty](#schemasdsresolvedtypeproperty)]|false|true|[A contract defining the type of data to read or write in a SdsResolvedType.]|
|BaseType|[SdsType](#schemasdstype)|false|true|A contract defining the type of data to read or write in a SdsStream.|
|DerivedTypes|[[SdsType](#schemasdstype)]|false|true|[A contract defining the type of data to read or write in a SdsStream.]|
|InterpolationMode|[SdsInterpolationMode2](#schemasdsinterpolationmode2)|false|false|Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects.|
|ExtrapolationMode|[SdsExtrapolationMode2](#schemasdsextrapolationmode2)|false|false|Defines how a stream responds to requests with indexes that precede or follow all data in the stream. Behavior also depends on the SdsInterpolationMode for a stream. If SdsInterpolationMode is set to Discrete, extrapolation won't occur. If SdsInterpolationMode is set to ContinuousNullableLeading or ContinuousNullableTrailing, default values will be returned instead of actual data.|
|CreatedDate|date-time|false|false|The DateTime in ISO 8601 extended format and UTC time standard when the SdsType was created. This value is set upon object creation and is immutable. The default value of the CreatedDate property of existing objects is DateTime.MinValue. This property cannot be modified by users.|
|ModifiedDate|date-time|false|false|The DateTime in ISO 8601 extended format and UTC time standard when the SdsType was last modified. This value is initialized upon object creation and is updated each time an object's properties are successfully modified. The ModifiedDate property of an object will also update if the object's ACL or owner is modified. The default value of the ModifiedDate property of existing objects is DateTime.MinValue. This property cannot be modified by users.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "SdsTypeCode": "Empty",
  "IsGenericType": true,
  "IsReferenceType": true,
  "GenericArguments": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "SdsTypeCode": 0,
      "IsGenericType": true,
      "IsReferenceType": true,
      "GenericArguments": "[<SdsType>]",
      "Properties": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "Order": 0,
          "IsKey": true,
          "FixedSize": 0,
          "SdsType": "<SdsType>",
          "Value": null,
          "Uom": "string",
          "InterpolationMode": 0,
          "IsQuality": true
        }
      ],
      "BaseType": "<SdsType>",
      "DerivedTypes": "[<SdsType>]",
      "InterpolationMode": 0,
      "ExtrapolationMode": 0,
      "CreatedDate": "2019-08-24T14:15:22Z",
      "ModifiedDate": "2019-08-24T14:15:22Z"
    }
  ],
  "Properties": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "Order": 0,
      "IsKey": true,
      "FixedSize": 0,
      "SdsType": "<SdsResolvedType>",
      "Value": null,
      "Uom": "string",
      "InterpolationMode": "Default",
      "IsQuality": true
    }
  ],
  "BaseType": {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "SdsTypeCode": 0,
    "IsGenericType": true,
    "IsReferenceType": true,
    "GenericArguments": "[<SdsType>]",
    "Properties": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "Order": 0,
        "IsKey": true,
        "FixedSize": 0,
        "SdsType": "<SdsType>",
        "Value": null,
        "Uom": "string",
        "InterpolationMode": 0,
        "IsQuality": true
      }
    ],
    "BaseType": "<SdsType>",
    "DerivedTypes": "[<SdsType>]",
    "InterpolationMode": 0,
    "ExtrapolationMode": 0,
    "CreatedDate": "2019-08-24T14:15:22Z",
    "ModifiedDate": "2019-08-24T14:15:22Z"
  },
  "DerivedTypes": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "SdsTypeCode": 0,
      "IsGenericType": true,
      "IsReferenceType": true,
      "GenericArguments": "[<SdsType>]",
      "Properties": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "Order": 0,
          "IsKey": true,
          "FixedSize": 0,
          "SdsType": "<SdsType>",
          "Value": null,
          "Uom": "string",
          "InterpolationMode": 0,
          "IsQuality": true
        }
      ],
      "BaseType": "<SdsType>",
      "DerivedTypes": "[<SdsType>]",
      "InterpolationMode": 0,
      "ExtrapolationMode": 0,
      "CreatedDate": "2019-08-24T14:15:22Z",
      "ModifiedDate": "2019-08-24T14:15:22Z"
    }
  ],
  "InterpolationMode": "Default",
  "ExtrapolationMode": "All",
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z"
}

```

---

### SdsResolvedTypeProperty

<a id="schemasdsresolvedtypeproperty"></a>
<a id="schema_SdsResolvedTypeProperty"></a>
<a id="tocSsdsresolvedtypeproperty"></a>
<a id="tocssdsresolvedtypeproperty"></a>

A contract defining the type of data to read or write in a SdsResolvedType.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|A unique identifier for the SdsTypeProperty object.|
|Name|string|false|true|An optional user-friendly name for the SdsTypeProperty object.|
|Description|string|false|true|A brief description of the SdsTypeProperty object.|
|Order|int32|false|false|The order used for comparison among SdsTypePropertys if a compound index is specified for SdsType.|
|IsKey|boolean|false|false|A boolean value indicating whether the current SdsTypeProperty must be used for indexing.|
|FixedSize|int32|false|false|An optional property specifying the length of string.|
|SdsType|[SdsResolvedType](#schemasdsresolvedtype)|false|true|A contract defining the type of data to read or write in a SdsResolvedStream.|
|Value|any|false|true|An enum value of the current SdsTypeProperty.|
|Uom|string|false|true|Indicates the Unit of Measure of the current SdsTypeProperty.|
|InterpolationMode|[SdsInterpolationMode2](#schemasdsinterpolationmode2)|false|true|Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects.|
|IsQuality|boolean|false|false|Indicates whether this property marks data quality.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "Order": 0,
  "IsKey": true,
  "FixedSize": 0,
  "SdsType": {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "SdsTypeCode": "Empty",
    "IsGenericType": true,
    "IsReferenceType": true,
    "GenericArguments": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": 0,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": "[<SdsType>]",
        "Properties": [
          {
            "Id": "string",
            "Name": "string",
            "Description": "string",
            "Order": 0,
            "IsKey": true,
            "FixedSize": 0,
            "SdsType": "<SdsType>",
            "Value": null,
            "Uom": "string",
            "InterpolationMode": 0,
            "IsQuality": true
          }
        ],
        "BaseType": "<SdsType>",
        "DerivedTypes": "[<SdsType>]",
        "InterpolationMode": 0,
        "ExtrapolationMode": 0,
        "CreatedDate": "2019-08-24T14:15:22Z",
        "ModifiedDate": "2019-08-24T14:15:22Z"
      }
    ],
    "Properties": "[<SdsResolvedTypeProperty>]",
    "BaseType": {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "SdsTypeCode": 0,
      "IsGenericType": true,
      "IsReferenceType": true,
      "GenericArguments": "[<SdsType>]",
      "Properties": [
        {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "Order": 0,
          "IsKey": true,
          "FixedSize": 0,
          "SdsType": "<SdsType>",
          "Value": null,
          "Uom": "string",
          "InterpolationMode": 0,
          "IsQuality": true
        }
      ],
      "BaseType": "<SdsType>",
      "DerivedTypes": "[<SdsType>]",
      "InterpolationMode": 0,
      "ExtrapolationMode": 0,
      "CreatedDate": "2019-08-24T14:15:22Z",
      "ModifiedDate": "2019-08-24T14:15:22Z"
    },
    "DerivedTypes": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": 0,
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": "[<SdsType>]",
        "Properties": [
          {
            "Id": "string",
            "Name": "string",
            "Description": "string",
            "Order": 0,
            "IsKey": true,
            "FixedSize": 0,
            "SdsType": "<SdsType>",
            "Value": null,
            "Uom": "string",
            "InterpolationMode": 0,
            "IsQuality": true
          }
        ],
        "BaseType": "<SdsType>",
        "DerivedTypes": "[<SdsType>]",
        "InterpolationMode": 0,
        "ExtrapolationMode": 0,
        "CreatedDate": "2019-08-24T14:15:22Z",
        "ModifiedDate": "2019-08-24T14:15:22Z"
      }
    ],
    "InterpolationMode": "Default",
    "ExtrapolationMode": "All",
    "CreatedDate": "2019-08-24T14:15:22Z",
    "ModifiedDate": "2019-08-24T14:15:22Z"
  },
  "Value": null,
  "Uom": "string",
  "InterpolationMode": "Default",
  "IsQuality": true
}

```

---

### SdsInterpolationMode2

<a id="schemasdsinterpolationmode2"></a>
<a id="schema_SdsInterpolationMode2"></a>
<a id="tocSsdsinterpolationmode2"></a>
<a id="tocssdsinterpolationmode2"></a>

Interpolation modes that can be applied to SdsType, SdsTypeProperty, SdsStream, and SdsStreamPropertyOverride objects.

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Continuous|Default|
|Default|Default|
|StepwiseContinuousLeading|StepwiseContinuousLeading|
|StepwiseContinuousTrailing|StepwiseContinuousTrailing|
|Discrete|Discrete|
|ContinuousNullableLeading|ContinuousNullableLeading|
|ContinuousNullableTrailing|ContinuousNullableTrailing|

---

### SdsTypeCode2

<a id="schemasdstypecode2"></a>
<a id="schema_SdsTypeCode2"></a>
<a id="tocSsdstypecode2"></a>
<a id="tocssdstypecode2"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Empty|Empty|
|Object|Object|
|Boolean|Boolean|
|Char|Char|
|SByte|SByte|
|Byte|Byte|
|Int16|Int16|
|UInt16|UInt16|
|Int32|Int32|
|UInt32|UInt32|
|Int64|Int64|
|UInt64|UInt64|
|Single|Single|
|Double|Double|
|Decimal|Decimal|
|DateTime|DateTime|
|String|String|
|Guid|Guid|
|DateTimeOffset|DateTimeOffset|
|TimeSpan|TimeSpan|
|Version|Version|
|NullableBoolean|NullableBoolean|
|NullableChar|NullableChar|
|NullableSByte|NullableSByte|
|NullableByte|NullableByte|
|NullableInt16|NullableInt16|
|NullableUInt16|NullableUInt16|
|NullableInt32|NullableInt32|
|NullableUInt32|NullableUInt32|
|NullableInt64|NullableInt64|
|NullableUInt64|NullableUInt64|
|NullableSingle|NullableSingle|
|NullableDouble|NullableDouble|
|NullableDecimal|NullableDecimal|
|NullableDateTime|NullableDateTime|
|NullableGuid|NullableGuid|
|NullableDateTimeOffset|NullableDateTimeOffset|
|NullableTimeSpan|NullableTimeSpan|
|BooleanArray|BooleanArray|
|CharArray|CharArray|
|SByteArray|SByteArray|
|ByteArray|ByteArray|
|Int16Array|Int16Array|
|UInt16Array|UInt16Array|
|Int32Array|Int32Array|
|UInt32Array|UInt32Array|
|Int64Array|Int64Array|
|UInt64Array|UInt64Array|
|SingleArray|SingleArray|
|DoubleArray|DoubleArray|
|DecimalArray|DecimalArray|
|DateTimeArray|DateTimeArray|
|StringArray|StringArray|
|GuidArray|GuidArray|
|DateTimeOffsetArray|DateTimeOffsetArray|
|TimeSpanArray|TimeSpanArray|
|VersionArray|VersionArray|
|Array|Array|
|IList|IList|
|IDictionary|IDictionary|
|IEnumerable|IEnumerable|
|SdsType|SdsType|
|SdsTypeProperty|SdsTypeProperty|
|SdsStreamView|SdsStreamView|
|SdsStreamViewProperty|SdsStreamViewProperty|
|SdsStreamViewMap|SdsStreamViewMap|
|SdsStreamViewMapProperty|SdsStreamViewMapProperty|
|SdsStream|SdsStream|
|SdsStreamIndex|SdsStreamIndex|
|SdsTable|SdsTable|
|SdsColumn|SdsColumn|
|SdsValues|SdsValues|
|SdsObject|SdsObject|
|SByteEnum|SByteEnum|
|ByteEnum|ByteEnum|
|Int16Enum|Int16Enum|
|UInt16Enum|UInt16Enum|
|Int32Enum|Int32Enum|
|UInt32Enum|UInt32Enum|
|Int64Enum|Int64Enum|
|UInt64Enum|UInt64Enum|
|NullableSByteEnum|NullableSByteEnum|
|NullableByteEnum|NullableByteEnum|
|NullableInt16Enum|NullableInt16Enum|
|NullableUInt16Enum|NullableUInt16Enum|
|NullableInt32Enum|NullableInt32Enum|
|NullableUInt32Enum|NullableUInt32Enum|
|NullableInt64Enum|NullableInt64Enum|
|NullableUInt64Enum|NullableUInt64Enum|

---

### SdsExtrapolationMode2

<a id="schemasdsextrapolationmode2"></a>
<a id="schema_SdsExtrapolationMode2"></a>
<a id="tocSsdsextrapolationmode2"></a>
<a id="tocssdsextrapolationmode2"></a>

Defines how a stream responds to requests with indexes that precede or follow all data in the stream. Behavior also depends on the SdsInterpolationMode for a stream. If SdsInterpolationMode is set to Discrete, extrapolation won't occur. If SdsInterpolationMode is set to ContinuousNullableLeading or ContinuousNullableTrailing, default values will be returned instead of actual data.

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|All|All|
|None|None|
|Forward|Forward|
|Backward|Backward|

---

### SdsResolvedStreamsResponse

<a id="schemasdsresolvedstreamsresponse"></a>
<a id="schema_SdsResolvedStreamsResponse"></a>
<a id="tocSsdsresolvedstreamsresponse"></a>
<a id="tocssdsresolvedstreamsresponse"></a>

A contract defining bulk response of SdsResolvedStream

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Data|[[SdsResolvedStream](#schemasdsresolvedstream)]|false|true|[A contract defining resolution of SdsStream.]|
|ChildErrors|[[SdsResolvedStreamErrorResponseBody](#schemasdsresolvedstreamerrorresponsebody)]|false|true|[The error response contains details on the cause of stream resolution failure and resolution of the error.]|

```json
{
  "Data": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "TypeId": "string",
      "Indexes": [
        {
          "SdsTypePropertyId": "string"
        }
      ],
      "InterpolationMode": 0,
      "ExtrapolationMode": 0,
      "PropertyOverrides": [
        {
          "SdsTypePropertyId": "string",
          "Uom": "string",
          "InterpolationMode": 0
        }
      ],
      "CreatedDate": "2019-08-24T14:15:22Z",
      "ModifiedDate": "2019-08-24T14:15:22Z",
      "Resolved": true,
      "Type": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "SdsTypeCode": "Empty",
        "IsGenericType": true,
        "IsReferenceType": true,
        "GenericArguments": [
          {
            "Id": "string",
            "Name": "string",
            "Description": "string",
            "SdsTypeCode": 0,
            "IsGenericType": true,
            "IsReferenceType": true,
            "GenericArguments": "[<SdsType>]",
            "Properties": [
              {
                "Id": "string",
                "Name": "string",
                "Description": "string",
                "Order": 0,
                "IsKey": true,
                "FixedSize": 0,
                "SdsType": "<SdsType>",
                "Value": null,
                "Uom": "string",
                "InterpolationMode": "[",
                "IsQuality": true
              }
            ],
            "BaseType": "<SdsType>",
            "DerivedTypes": "[<SdsType>]",
            "InterpolationMode": 0,
            "ExtrapolationMode": 0,
            "CreatedDate": "2019-08-24T14:15:22Z",
            "ModifiedDate": "2019-08-24T14:15:22Z"
          }
        ],
        "Properties": [
          {
            "Id": "string",
            "Name": "string",
            "Description": "string",
            "Order": 0,
            "IsKey": true,
            "FixedSize": 0,
            "SdsType": "<SdsResolvedType>",
            "Value": null,
            "Uom": "string",
            "InterpolationMode": "Default",
            "IsQuality": true
          }
        ],
        "BaseType": {
          "Id": "string",
          "Name": "string",
          "Description": "string",
          "SdsTypeCode": 0,
          "IsGenericType": true,
          "IsReferenceType": true,
          "GenericArguments": "[<SdsType>]",
          "Properties": [
            {
              "Id": "string",
              "Name": "string",
              "Description": "string",
              "Order": 0,
              "IsKey": true,
              "FixedSize": 0,
              "SdsType": null,
              "Value": null,
              "Uom": "string",
              "InterpolationMode": null,
              "IsQuality": true
            }
          ],
          "BaseType": "<SdsType>",
          "DerivedTypes": "[<SdsType>]",
          "InterpolationMode": 0,
          "ExtrapolationMode": 0,
          "CreatedDate": "2019-08-24T14:15:22Z",
          "ModifiedDate": "2019-08-24T14:15:22Z"
        },
        "DerivedTypes": [
          {
            "Id": "string",
            "Name": "string",
            "Description": "string",
            "SdsTypeCode": 0,
            "IsGenericType": true,
            "IsReferenceType": true,
            "GenericArguments": "[<SdsType>]",
            "Properties": [
              {
                "Id": "string",
                "Name": "string",
                "Description": "string",
                "Order": 0,
                "IsKey": true,
                "FixedSize": 0,
                "SdsType": "<SdsType>",
                "Value": null,
                "Uom": "string",
                "InterpolationMode": "[",
                "IsQuality": true
              }
            ],
            "BaseType": "<SdsType>",
            "DerivedTypes": "[<SdsType>]",
            "InterpolationMode": 0,
            "ExtrapolationMode": 0,
            "CreatedDate": "2019-08-24T14:15:22Z",
            "ModifiedDate": "2019-08-24T14:15:22Z"
          }
        ],
        "InterpolationMode": "Default",
        "ExtrapolationMode": "All",
        "CreatedDate": "2019-08-24T14:15:22Z",
        "ModifiedDate": "2019-08-24T14:15:22Z"
      }
    }
  ],
  "ChildErrors": [
    {
      "OperationId": "string",
      "Error": "string",
      "Reason": "string",
      "Resolution": "string",
      "Parameters": {
        "property1": "string",
        "property2": "string"
      },
      "StreamId": "string",
      "StatusCode": 100
    }
  ]
}

```

---

### SdsResolvedStreamErrorResponseBody

<a id="schemasdsresolvedstreamerrorresponsebody"></a>
<a id="schema_SdsResolvedStreamErrorResponseBody"></a>
<a id="tocSsdsresolvedstreamerrorresponsebody"></a>
<a id="tocssdsresolvedstreamerrorresponsebody"></a>

The error response contains details on the cause of stream resolution failure and resolution of the error.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|Operation unique identifier of action that caused the error|
|Error|string|false|true|Error description|
|Reason|string|false|true|Reason for the error|
|Resolution|string|false|true|Resolution to resolve the error|
|Parameters|object|false|true|IDs or values that are creating or are affected by the error|
|StreamId|string|false|true|None|
|StatusCode|[HttpStatusCode](#schemahttpstatuscode)|false|false|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "Parameters": {
    "property1": "string",
    "property2": "string"
  },
  "StreamId": "string",
  "StatusCode": 100
}

```

---

### HttpStatusCode

<a id="schemahttpstatuscode"></a>
<a id="schema_HttpStatusCode"></a>
<a id="tocShttpstatuscode"></a>
<a id="tocshttpstatuscode"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Continue|100|
|SwitchingProtocols|101|
|Processing|102|
|EarlyHints|103|
|OK|200|
|Created|201|
|Accepted|202|
|NonAuthoritativeInformation|203|
|NoContent|204|
|ResetContent|205|
|PartialContent|206|
|MultiStatus|207|
|AlreadyReported|208|
|IMUsed|226|
|MultipleChoices|300|
|Ambiguous|300|
|MovedPermanently|301|
|Moved|301|
|Found|302|
|Redirect|302|
|SeeOther|303|
|RedirectMethod|303|
|NotModified|304|
|UseProxy|305|
|Unused|306|
|TemporaryRedirect|307|
|RedirectKeepVerb|307|
|PermanentRedirect|308|
|BadRequest|400|
|Unauthorized|401|
|PaymentRequired|402|
|Forbidden|403|
|NotFound|404|
|MethodNotAllowed|405|
|NotAcceptable|406|
|ProxyAuthenticationRequired|407|
|RequestTimeout|408|
|Conflict|409|
|Gone|410|
|LengthRequired|411|
|PreconditionFailed|412|
|RequestEntityTooLarge|413|
|RequestUriTooLong|414|
|UnsupportedMediaType|415|
|RequestedRangeNotSatisfiable|416|
|ExpectationFailed|417|
|MisdirectedRequest|421|
|UnprocessableEntity|422|
|Locked|423|
|FailedDependency|424|
|UpgradeRequired|426|
|PreconditionRequired|428|
|TooManyRequests|429|
|RequestHeaderFieldsTooLarge|431|
|UnavailableForLegalReasons|451|
|InternalServerError|500|
|NotImplemented|501|
|BadGateway|502|
|ServiceUnavailable|503|
|GatewayTimeout|504|
|HttpVersionNotSupported|505|
|VariantAlsoNegotiates|506|
|InsufficientStorage|507|
|LoopDetected|508|
|NotExtended|510|
|NetworkAuthenticationRequired|511|

---

