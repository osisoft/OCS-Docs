---
uid: event-type-store-event-types

---

# Event Types

## `List Event Types`

<a id="opIdEventTypes_List Event Types"></a>

Returns an array of EventTypes in a given namespace and the version ETag in the HTTP response header. The If-Match and If-None-Match headers are supported.

<h3>Request</h3>

```text 
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/EventTypes
?skip={skip}&count={count}&includeDeleted={includeDeleted}&filter={filter}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>
`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>`[optional] boolean includeDeleted`
<br/>Parameter indicating whether to include soft-deleted EventTypes. If unspecified, a default value of false is used.<br/><br/>`[optional] string filter`
<br/>Parameter representing the condition for results to be filtered by. If unspecified, results are not filtered.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[EventType](#schemaeventtype)[]|Success.|
|304|None|Not modified.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|412|[AdhErrorResponse](#schemaadherrorresponse)|Precondition failed.|

<h4>Example response body</h4>

> 200 Response ([EventType](#schemaeventtype)[])

```json
[
  {
    "Name": "string",
    "GraphQLName": "string",
    "Version": 0,
    "Id": "string",
    "State": 0,
    "CreatedDate": "2019-08-24T14:15:22Z",
    "ModifiedDate": "2019-08-24T14:15:22Z",
    "Description": "string",
    "Properties": [
      {
        "PropertyTypeCode": 0,
        "Id": "string",
        "Name": "string",
        "GraphQLName": "string",
        "Flags": 0,
        "State": 0,
        "PropertyTypeId": "string",
        "RemoteReferenceName": "string",
        "Description": "string"
      }
    ],
    "DefaultAuthorizationTag": "string"
  }
]
```

---

## `Create Event Type With Server Generated Id`

<a id="opIdEventTypes_Create Event Type With Server Generated Id"></a>

Creates a new EventType. Response includes ETag header.

<h3>Request</h3>

```text 
POST /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/EventTypes
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>

<h4>Request Body</h4>

An EventType.<br/>

```json
{
  "Name": "SimpleEvent",
  "Properties": [
    {
      "Id": "eventStartTime",
      "PropertyTypeCode": "DateTime"
    },
    {
      "Id": "eventEndTime",
      "PropertyTypeCode": "DateTime"
    },
    {
      "Id": "eventDuration",
      "PropertyTypeCode": "TimeSpan"
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[EventType](#schemaeventtype)|Created.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|409|[AdhErrorResponse](#schemaadherrorresponse)|Conflict.|

<h4>Example response body</h4>

> 201 Response ([EventType](#schemaeventtype))

```json
{
  "Name": "string",
  "GraphQLName": "string",
  "Version": 0,
  "Id": "string",
  "State": 0,
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Properties": [
    {
      "PropertyTypeCode": 0,
      "Id": "string",
      "Name": "string",
      "GraphQLName": "string",
      "Flags": 0,
      "State": 0,
      "PropertyTypeId": "string",
      "RemoteReferenceName": "string",
      "Description": "string"
    }
  ],
  "DefaultAuthorizationTag": "string"
}
```

---

## `Get Event Type By Id`

<a id="opIdEventTypes_Get Event Type By Id"></a>

Returns the specified EventType and the version ETag in the HTTP response header. The If-Match and If-None-Match headers are supported.

<h3>Request</h3>

```text 
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/EventTypes/{id}
?includeDeleted={includeDeleted}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the EventType.<br/><br/>
`[optional] boolean includeDeleted`
<br/>Parameter indicating whether to include soft-deleted EventTypes. If unspecified, a default value of false is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[EventType](#schemaeventtype)|Success.|
|304|None|Not modified.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|EventType not found.|
|412|[AdhErrorResponse](#schemaadherrorresponse)|Precondition failed.|

<h4>Example response body</h4>

> 200 Response ([EventType](#schemaeventtype))

```json
{
  "Name": "string",
  "GraphQLName": "string",
  "Version": 0,
  "Id": "string",
  "State": 0,
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Properties": [
    {
      "PropertyTypeCode": 0,
      "Id": "string",
      "Name": "string",
      "GraphQLName": "string",
      "Flags": 0,
      "State": 0,
      "PropertyTypeId": "string",
      "RemoteReferenceName": "string",
      "Description": "string"
    }
  ],
  "DefaultAuthorizationTag": "string"
}
```

---

## `Get Or Create Event Type`

<a id="opIdEventTypes_Get Or Create Event Type"></a>

Creates a new EventType or returns the current one if the body is equivalent to what is stored. Response includes ETag header.

<h3>Request</h3>

```text 
POST /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/EventTypes/{id}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the EventType.<br/><br/>

<h4>Request Body</h4>

An EventType.<br/>

```json
{
  "Id": "SimpleEvent",
  "Name": "SimpleEvent",
  "Properties": [
    {
      "Id": "eventStartTime",
      "PropertyTypeCode": "DateTime"
    },
    {
      "Id": "eventEndTime",
      "PropertyTypeCode": "DateTime"
    },
    {
      "Id": "eventDuration",
      "PropertyTypeCode": "TimeSpan"
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[EventType](#schemaeventtype)|Success.|
|201|[EventType](#schemaeventtype)|Created.|
|302|None|Found.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|409|[AdhErrorResponse](#schemaadherrorresponse)|Conflict|

<h4>Example response body</h4>

> 200 Response ([EventType](#schemaeventtype))

```json
{
  "Name": "string",
  "GraphQLName": "string",
  "Version": 0,
  "Id": "string",
  "State": 0,
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Properties": [
    {
      "PropertyTypeCode": 0,
      "Id": "string",
      "Name": "string",
      "GraphQLName": "string",
      "Flags": 0,
      "State": 0,
      "PropertyTypeId": "string",
      "RemoteReferenceName": "string",
      "Description": "string"
    }
  ],
  "DefaultAuthorizationTag": "string"
}
```

---

## `Create Or Update Event Type`

<a id="opIdEventTypes_Create Or Update Event Type"></a>

Creates a new EventType or updates an existing and adds its Etag in the HTTP response header. The If-Match header is supported.

<h3>Request</h3>

```text 
PUT /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/EventTypes/{id}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the EventType.<br/><br/>

<h4>Request Body</h4>

An EventType.<br/>

```json
{
  "Id": "SimpleEvent",
  "Name": "SimpleEvent",
  "Properties": [
    {
      "Id": "eventStartTime",
      "PropertyTypeCode": "DateTime"
    },
    {
      "Id": "eventEndTime",
      "PropertyTypeCode": "DateTime"
    },
    {
      "Id": "eventDuration",
      "PropertyTypeCode": "TimeSpan"
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[EventType](#schemaeventtype)|Success.|
|201|[EventType](#schemaeventtype)|Created.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|409|[AdhErrorResponse](#schemaadherrorresponse)|None|
|412|[AdhErrorResponse](#schemaadherrorresponse)|Precondition failed.|

<h4>Example response body</h4>

> 200 Response ([EventType](#schemaeventtype))

```json
{
  "Name": "string",
  "GraphQLName": "string",
  "Version": 0,
  "Id": "string",
  "State": 0,
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Properties": [
    {
      "PropertyTypeCode": 0,
      "Id": "string",
      "Name": "string",
      "GraphQLName": "string",
      "Flags": 0,
      "State": 0,
      "PropertyTypeId": "string",
      "RemoteReferenceName": "string",
      "Description": "string"
    }
  ],
  "DefaultAuthorizationTag": "string"
}
```

---

## `Delete Event Type By Id`

<a id="opIdEventTypes_Delete Event Type By Id"></a>

Deletes the EventType.

<h3>Request</h3>

```text 
DELETE /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/EventTypes/{id}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the EventType.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Deleted.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|EventType not found.|
|409|[AdhErrorResponse](#schemaadherrorresponse)|Conflict.|

---

## `Bulk Create Event Type`

<a id="opIdEventTypes_Bulk Create Event Type"></a>

Creates multiple new EventType and returns a list of any errors along with the created objects. Response includes ETag header.

<h3>Request</h3>

```text 
POST /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/EventTypes
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>

<h4>Request Body</h4>

A list of EventType objects.<br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[EventType](#schemaeventtype)|Success.|
|207|[AdhErrorResponse](#schemaadherrorresponse)|Partial.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|409|[AdhErrorResponse](#schemaadherrorresponse)|Conflict.|

<h4>Example response body</h4>

> 200 Response ([EventType](#schemaeventtype))

```json
{
  "Name": "string",
  "GraphQLName": "string",
  "Version": 0,
  "Id": "string",
  "State": 0,
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Properties": [
    {
      "PropertyTypeCode": 0,
      "Id": "string",
      "Name": "string",
      "GraphQLName": "string",
      "Flags": 0,
      "State": 0,
      "PropertyTypeId": "string",
      "RemoteReferenceName": "string",
      "Description": "string"
    }
  ],
  "DefaultAuthorizationTag": "string"
}
```

---

## `Get Event Type Acl By Id`

<a id="opIdEventTypes_Get Event Type Acl By Id"></a>

Returns the `AccessControlList` for the specified EventType.

<h3>Request</h3>

```text 
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/EventTypes/{id}/AccessControl
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the EventType.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Success.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|EventType not found.|

<h4>Example response body</h4>

> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": 1,
        "ObjectId": "string",
        "TenantId": "string"
      },
      "AccessType": 0,
      "AccessRights": 0
    }
  ]
}
```

---

## `Update Event Type Acl By Id`

<a id="opIdEventTypes_Update Event Type Acl By Id"></a>

Updates and returns the `AccessControlList` for the specified EventType.

<h3>Request</h3>

```text 
PUT /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/EventTypes/{id}/AccessControl
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the EventType.<br/><br/>

<h4>Request Body</h4>

An AccessControlList.<br/>

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "11111111-1111-1111-1111-111111111111"
      },
      "AccessType": 0,
      "AccessRights": 3
    },
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "22222222-2222-2222-1111-111111111111"
      },
      "AccessType": 0,
      "AccessRights": 15
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Success.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|EventType not found.|

<h4>Example response body</h4>

> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": 1,
        "ObjectId": "string",
        "TenantId": "string"
      },
      "AccessType": 0,
      "AccessRights": 0
    }
  ]
}
```

---

## `Get Event Type Owner By Id`

<a id="opIdEventTypes_Get Event Type Owner By Id"></a>

Returns the `Trustee` for the specified EventType.

<h3>Request</h3>

```text 
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/EventTypes/{id}/Owner
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the EventType.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|Success.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|EventType not found.|

<h4>Example response body</h4>

> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

---

## `Update Event Type Owner By Id`

<a id="opIdEventTypes_Update Event Type Owner By Id"></a>

Updates and returns the `Trustee` for the specified EventType.

<h3>Request</h3>

```text 
PUT /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/EventTypes/{id}/Owner
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the EventType.<br/><br/>

<h4>Request Body</h4>

A Trustee.<br/>

```json
{
  "Type": 1,
  "TenantId": "55555555-5555-5555-5555-555555555555",
  "ObjectId": "44444444-4444-4444-4444-444444444444"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|Success.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|EventType not found.|

<h4>Example response body</h4>

> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

---

## `List Event Type Access Rights By Id`

<a id="opIdEventTypes_List Event Type Access Rights By Id"></a>

Returns a list of `CommonAccessRights` for the specified EventType.

<h3>Request</h3>

```text 
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/EventTypes/{id}/AccessRights
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the EventType.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Success.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|EventType not found.|

---
## Definitions

### EventType

<a id="schemaeventtype"></a>
<a id="schema_EventType"></a>
<a id="tocSeventtype"></a>
<a id="tocseventtype"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|None|
|GraphQLName|string|false|true|None|
|Version|int32|false|false|None|
|Id|string|false|true|None|
|State|[LifeCycleState](#schemalifecyclestate)|false|false|None|
|CreatedDate|date-time|false|true|None|
|ModifiedDate|date-time|false|true|None|
|Description|string|false|true|None|
|Properties|[[TypeProperty](#schematypeproperty)]|false|true|None|
|DefaultAuthorizationTag|string|false|true|None|

```json
{
  "Name": "string",
  "GraphQLName": "string",
  "Version": 0,
  "Id": "string",
  "State": 0,
  "CreatedDate": "2019-08-24T14:15:22Z",
  "ModifiedDate": "2019-08-24T14:15:22Z",
  "Description": "string",
  "Properties": [
    {
      "PropertyTypeCode": 0,
      "Id": "string",
      "Name": "string",
      "GraphQLName": "string",
      "Flags": 0,
      "State": 0,
      "PropertyTypeId": "string",
      "RemoteReferenceName": "string",
      "Description": "string"
    }
  ],
  "DefaultAuthorizationTag": "string"
}

```

---

### LifeCycleState

<a id="schemalifecyclestate"></a>
<a id="schema_LifeCycleState"></a>
<a id="tocSlifecyclestate"></a>
<a id="tocslifecyclestate"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Active|0|
|Deprecated|1|
|Deleted|2|

---

### TypeProperty

<a id="schematypeproperty"></a>
<a id="schema_TypeProperty"></a>
<a id="tocStypeproperty"></a>
<a id="tocstypeproperty"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|PropertyTypeCode|[PropertyTypeCode](#schemapropertytypecode)|false|false|None|
|Id|string|false|true|None|
|Name|string|false|true|None|
|GraphQLName|string|false|true|None|
|Flags|[PropertyTypeFlags](#schemapropertytypeflags)|false|false|None|
|State|[LifeCycleState](#schemalifecyclestate)|false|false|None|
|PropertyTypeId|string|false|true|None|
|RemoteReferenceName|string|false|true|None|
|Description|string|false|true|None|

```json
{
  "PropertyTypeCode": 0,
  "Id": "string",
  "Name": "string",
  "GraphQLName": "string",
  "Flags": 0,
  "State": 0,
  "PropertyTypeId": "string",
  "RemoteReferenceName": "string",
  "Description": "string"
}

```

---

### PropertyTypeCode

<a id="schemapropertytypecode"></a>
<a id="schema_PropertyTypeCode"></a>
<a id="tocSpropertytypecode"></a>
<a id="tocspropertytypecode"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Empty|0|
|Boolean|3|
|Int32|9|
|Int64|11|
|Double|14|
|DateTime|16|
|String|18|
|TimeSpan|21|
|Event|10000|
|Enumeration|10001|
|ReferenceData|10002|
|Asset|10003|

---

### PropertyTypeFlags

<a id="schemapropertytypeflags"></a>
<a id="schema_PropertyTypeFlags"></a>
<a id="tocSpropertytypeflags"></a>
<a id="tocspropertytypeflags"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|None|0|
|Indexed|2|
|Required|4|
|IsCollection|8|
|ReverseLookup|16|

---

### AdhErrorResponse

<a id="schemaadherrorresponse"></a>
<a id="schema_AdhErrorResponse"></a>
<a id="tocSadherrorresponse"></a>
<a id="tocsadherrorresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|None|
|Error|string|false|true|None|
|Reason|string|false|true|None|
|Resolution|string|false|true|None|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "property1": null,
  "property2": null
}

```

---

### AccessControlList

<a id="schemaaccesscontrollist"></a>
<a id="schema_AccessControlList"></a>
<a id="tocSaccesscontrollist"></a>
<a id="tocsaccesscontrollist"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|RoleTrusteeAccessControlEntries|[[AccessControlEntry](#schemaaccesscontrolentry)]|false|true|None|

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": 1,
        "ObjectId": "string",
        "TenantId": "string"
      },
      "AccessType": 0,
      "AccessRights": 0
    }
  ]
}

```

---

### AccessControlEntry

<a id="schemaaccesscontrolentry"></a>
<a id="schema_AccessControlEntry"></a>
<a id="tocSaccesscontrolentry"></a>
<a id="tocsaccesscontrolentry"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Trustee|[Trustee](#schematrustee)|false|true|None|
|AccessType|[AccessType](#schemaaccesstype)|false|false|None|
|AccessRights|int64|false|false|None|

```json
{
  "Trustee": {
    "Type": 1,
    "ObjectId": "string",
    "TenantId": "string"
  },
  "AccessType": 0,
  "AccessRights": 0
}

```

---

### Trustee

<a id="schematrustee"></a>
<a id="schema_Trustee"></a>
<a id="tocStrustee"></a>
<a id="tocstrustee"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Type|[TrusteeType](#schematrusteetype)|false|false|None|
|ObjectId|string|false|true|None|
|TenantId|string|false|true|None|

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}

```

---

### TrusteeType

<a id="schematrusteetype"></a>
<a id="schema_TrusteeType"></a>
<a id="tocStrusteetype"></a>
<a id="tocstrusteetype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|User|1|
|Client|2|
|Role|3|

---

### AccessType

<a id="schemaaccesstype"></a>
<a id="schema_AccessType"></a>
<a id="tocSaccesstype"></a>
<a id="tocsaccesstype"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Allowed|0|
|Denied|1|

---

