---
uid: event-type-store-reference-data-types

---

# Reference Data Types

## `List Reference Data Types`

<a id="opIdReferenceDataTypes_List Reference Data Types"></a>

Returns an array of ReferenceDataTypes in a given namespace and the version ETag in the HTTP response header. The If-Match and If-None-Match headers are supported.

<h3>Request</h3>

```text 
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/ReferenceDataTypes
?skip={skip}&count={count}&filter={filter}&includeDeleted={includeDeleted}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>
`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>`[optional] string filter`
<br/>Parameter representing the condition for results to be filtered by. If unspecified, results are not filtered.<br/><br/>`[optional] boolean includeDeleted`
<br/>Parameter indicating whether to include soft-deleted ReferenceDataTypes. If unspecified, a default value of false is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ReferenceDataType](#schemareferencedatatype)[]|Success.|
|304|None|Not modified.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|412|[AdhErrorResponse](#schemaadherrorresponse)|Precondition failed.|

<h4>Example response body</h4>

> 200 Response ([ReferenceDataType](#schemareferencedatatype)[])

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
    "Category": 0,
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

## `Create Reference Data Type With Server Generated Id`

<a id="opIdReferenceDataTypes_Create Reference Data Type With Server Generated Id"></a>

Creates a new ReferenceDataType. Response includes ETag header.

<h3>Request</h3>

```text 
POST /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/ReferenceDataTypes
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>

<h4>Request Body</h4>

A ReferenceDataType.<br/>

```json
{
  "Name": "SimpleReferenceData",
  "Properties": [
    {
      "Id": "SourceId",
      "PropertyTypeCode": "String"
    },
    {
      "Id": "ResourceId",
      "PropertyTypeCode": "String"
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[ReferenceDataType](#schemareferencedatatype)|Created.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|409|[AdhErrorResponse](#schemaadherrorresponse)|Conflict.|

<h4>Example response body</h4>

> 201 Response ([ReferenceDataType](#schemareferencedatatype))

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
  "Category": 0,
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

## `Get Reference Data Type By Id`

<a id="opIdReferenceDataTypes_Get Reference Data Type By Id"></a>

Returns the specified ReferenceDataType and the version ETag in the HTTP response header. The If-Match and If-None-Match headers are supported.

<h3>Request</h3>

```text 
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/ReferenceDataTypes/{id}
?includeDeleted={includeDeleted}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the ReferenceDataType.<br/><br/>
`[optional] boolean includeDeleted`
<br/>Parameter indicating whether to include soft-deleted ReferenceDataTypes. If unspecified, a default value of false is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ReferenceDataType](#schemareferencedatatype)|Success.|
|304|None|Not modified.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|ReferenceDataType not found.|
|412|[AdhErrorResponse](#schemaadherrorresponse)|Precondition failed.|

<h4>Example response body</h4>

> 200 Response ([ReferenceDataType](#schemareferencedatatype))

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
  "Category": 0,
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

## `Get Or Create Reference Data Type`

<a id="opIdReferenceDataTypes_Get Or Create Reference Data Type"></a>

Creates a new ReferenceDataType or returns the current one if the body is equivalent to what is stored. Response includes ETag header.

<h3>Request</h3>

```text 
POST /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/ReferenceDataTypes/{id}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the ReferenceDataType.<br/><br/>

<h4>Request Body</h4>

A ReferenceDataType.<br/>

```json
{
  "Id": "SimpleReferenceData",
  "Name": "SimpleReferenceData",
  "Properties": [
    {
      "Id": "SourceId",
      "PropertyTypeCode": "String"
    },
    {
      "Id": "ResourceId",
      "PropertyTypeCode": "String"
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ReferenceDataType](#schemareferencedatatype)|Success.|
|201|[ReferenceDataType](#schemareferencedatatype)|Created.|
|302|None|Found.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|409|[AdhErrorResponse](#schemaadherrorresponse)|Conflict|

<h4>Example response body</h4>

> 200 Response ([ReferenceDataType](#schemareferencedatatype))

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
  "Category": 0,
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

## `Create Or Update Reference Data Type`

<a id="opIdReferenceDataTypes_Create Or Update Reference Data Type"></a>

Creates a new ReferenceDataType or updates an existing and adds its Etag in the HTTP response header. The If-Match header is supported.

<h3>Request</h3>

```text 
PUT /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/ReferenceDataTypes/{id}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the ReferenceDataType.<br/><br/>

<h4>Request Body</h4>

A ReferenceDataType.<br/>

```json
{
  "Id": "SimpleReferenceData",
  "Name": "SimpleReferenceData",
  "Properties": [
    {
      "Id": "SourceId",
      "PropertyTypeCode": "String"
    },
    {
      "Id": "ResourceId",
      "PropertyTypeCode": "String"
    }
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ReferenceDataType](#schemareferencedatatype)|Success.|
|201|[ReferenceDataType](#schemareferencedatatype)|Created.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|409|[AdhErrorResponse](#schemaadherrorresponse)|Conflict.|
|412|[AdhErrorResponse](#schemaadherrorresponse)|Precondition failed.|

<h4>Example response body</h4>

> 200 Response ([ReferenceDataType](#schemareferencedatatype))

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
  "Category": 0,
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

## `Delete Reference Data Type By Id`

<a id="opIdReferenceDataTypes_Delete Reference Data Type By Id"></a>

Deletes the ReferenceDataType.

<h3>Request</h3>

```text 
DELETE /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/ReferenceDataTypes/{id}
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the ReferenceDataType.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Deleted.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|ReferenceDataType not found.|
|409|[AdhErrorResponse](#schemaadherrorresponse)|Conflict.|

---

## `Bulk Create Reference Data Type`

<a id="opIdReferenceDataTypes_Bulk Create Reference Data Type"></a>

Creates multiple new ReferenceDataTypes and returns a list of any errors along with the created objects. Response includes ETag header.

<h3>Request</h3>

```text 
POST /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/Bulk/ReferenceDataTypes
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>

<h4>Request Body</h4>

A list of ReferenceDataType objects.<br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[ReferenceDataType](#schemareferencedatatype)|Success.|
|207|[AdhErrorResponse](#schemaadherrorresponse)|Partial.|
|400|[AdhErrorResponse](#schemaadherrorresponse)|Missing or invalid inputs.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|409|[AdhErrorResponse](#schemaadherrorresponse)|Conflict.|

<h4>Example response body</h4>

> 200 Response ([ReferenceDataType](#schemareferencedatatype))

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
  "Category": 0,
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

## `Get Reference Data Type Acl By Id`

<a id="opIdReferenceDataTypes_Get Reference Data Type Acl By Id"></a>

Returns the `AccessControlList` for the specified ReferenceDataType.

<h3>Request</h3>

```text 
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/ReferenceDataTypes/{id}/AccessControl
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the ReferenceDataType.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Success.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|ReferenceDataType not found.|

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

## `Update Reference Data Type Acl By Id`

<a id="opIdReferenceDataTypes_Update Reference Data Type Acl By Id"></a>

Updates and returns the `AccessControlList` for the specified ReferenceDataType.

<h3>Request</h3>

```text 
PUT /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/ReferenceDataTypes/{id}/AccessControl
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the ReferenceDataType.<br/><br/>

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
|404|[AdhErrorResponse](#schemaadherrorresponse)|ReferenceDataType not found.|

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

## `Get Reference Data Type Owner By Id`

<a id="opIdReferenceDataTypes_Get Reference Data Type Owner By Id"></a>

Returns the `Trustee` for the specified ReferenceDataType.

<h3>Request</h3>

```text 
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/ReferenceDataTypes/{id}/Owner
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the ReferenceDataType.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|Success.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|ReferenceDataType not found.|

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

## `Update Reference Data Type Owner By Id`

<a id="opIdReferenceDataTypes_Update Reference Data Type Owner By Id"></a>

Updates and returns the `Trustee` for the specified ReferenceDataType.

<h3>Request</h3>

```text 
PUT /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/ReferenceDataTypes/{id}/Owner
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the ReferenceDataType.<br/><br/>

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
|404|[AdhErrorResponse](#schemaadherrorresponse)|ReferenceDataType not found.|

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

## `List Reference Data Type Access Rights By Id`

<a id="opIdReferenceDataTypes_List Reference Data Type Access Rights By Id"></a>

Returns a list of `CommonAccessRights` for the specified ReferenceDataType.

<h3>Request</h3>

```text 
GET /api/v1-preview/Tenants/{tenantId}/Namespaces/{namespaceId}/ReferenceDataTypes/{id}/AccessRights
```

<h4>Parameters</h4>

`string tenantId`
<br/><br/>`string namespaceId`
<br/><br/>`string id`
<br/>The id of the ReferenceDataType.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Success.|
|403|[AdhErrorResponse](#schemaadherrorresponse)|Forbidden.|
|404|[AdhErrorResponse](#schemaadherrorresponse)|ReferenceDataType not found.|

---
## Definitions

### ReferenceDataType

<a id="schemareferencedatatype"></a>
<a id="schema_ReferenceDataType"></a>
<a id="tocSreferencedatatype"></a>
<a id="tocsreferencedatatype"></a>

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
|Category|[ReferenceDataCategory](#schemareferencedatacategory)|false|false|None|
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
  "Category": 0,
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

### ReferenceDataCategory

<a id="schemareferencedatacategory"></a>
<a id="schema_ReferenceDataCategory"></a>
<a id="tocSreferencedatacategory"></a>
<a id="tocsreferencedatacategory"></a>

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|ReferenceData|0|
|ExternalReference|1|

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

