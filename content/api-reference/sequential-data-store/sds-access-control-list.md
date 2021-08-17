---
uid: sds-access-control-list

---

# Access control list

## `Get Streams Access Control List`

<a id="opIdNamespaceAccessControl_Get Streams Access Control List"></a>

Gets the default ACL for the Streams collection. An ETag header is returned, which can be used to prevent modification of the ACL, during a later call to modify the ACL, if the object has already been modified.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Streams
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Returns the default `AccessControlList` for Streams|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": "[",
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

## `Update Streams Access Control List`

<a id="opIdNamespaceAccessControl_Update Streams Access Control List"></a>

Updates the default ACL for the Streams collection.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Streams
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
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

## `Patch Streams Access Control List`

<a id="opIdNamespaceAccessControl_Patch Streams Access Control List"></a>

Updates the default ACL for the Streams collection using an RFC 6902 compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List.

### Request
```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Streams
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|412|[ErrorResponseBody](#schemaerrorresponsebody)|Precondition failed|
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

## `Get Types Access Control List`

<a id="opIdNamespaceAccessControl_Get Types Access Control List"></a>

Gets the default ACL for the Types collection. An ETag header is returned, which can be used to prevent modification of the ACL, during a later call to modify the ACL, if the object has already been modified.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Types
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Returns the default `AccessControlList` for Types|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": "[",
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

## `Update Types Access Control List`

<a id="opIdNamespaceAccessControl_Update Types Access Control List"></a>

Updates the default ACL for the Types collection.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Types
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
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

## `Patch Types Access Control List`

<a id="opIdNamespaceAccessControl_Patch Types Access Control List"></a>

Updates the default ACL for the Types collection using an RFC 6902 compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List.

### Request
```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Types
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|412|[ErrorResponseBody](#schemaerrorresponsebody)|Precondition failed|
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

## `Get Stream Views Access Control List`

<a id="opIdNamespaceAccessControl_Get Stream Views Access Control List"></a>

Gets the default ACL for the Stream Views collection. An ETag header is returned, which can be used to prevent modification of the ACL, during a later call to modify the ACL, if the object has already been modified.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/StreamViews
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Returns the default `AccessControlList` for Stream Views|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": "[",
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

## `Update Stream Views Access Control List`

<a id="opIdNamespaceAccessControl_Update Stream Views Access Control List"></a>

Updates the default ACL for the Stream Views collection.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/StreamViews
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
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

## `Patch Stream Views Access Control List`

<a id="opIdNamespaceAccessControl_Patch Stream Views Access Control List"></a>

Updates the default ACL for the Stream Views collection using an RFC 6902 compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List.

### Request
```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/StreamViews
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|412|[ErrorResponseBody](#schemaerrorresponsebody)|Precondition failed|
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

## `Get Quantities Access Control List`

<a id="opIdNamespaceAccessControl_Get Quantities Access Control List"></a>

Gets the default ACL for the Quantities collection. An ETag header is returned, which can be used to prevent modification of the ACL, during a later call to modify the ACL, if the object has already been modified.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Quantities
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Returns the default `AccessControlList` for Quantities|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": "[",
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

## `Update Quantities Access Control List`

<a id="opIdNamespaceAccessControl_Update Quantities Access Control List"></a>

Updates the default ACL for the Quantities collection.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Quantities
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
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

## `Patch Quantities Access Control List`

<a id="opIdNamespaceAccessControl_Patch Quantities Access Control List"></a>

Updates the default ACL for the Quantities collection using an RFC 6902 compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List.

### Request
```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/AccessControl/Quantities
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|You are not authorized for this operation|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|412|[ErrorResponseBody](#schemaerrorresponsebody)|Precondition failed|
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

# Access Control List

## `Get Type Access Control List`

<a id="opIdTypeAccessControl_Get Type Access Control List"></a>

Gets the ACL of the specified type

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string typeId`
<br/>Type identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Returns the `AccessControlList`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": "[",
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

## `Update Type Access Control List`

<a id="opIdTypeAccessControl_Update Type Access Control List"></a>

Updates the ACL of the specified type

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string typeId`
<br/>Type identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The `SdsType`'s ACL was successfully updated|
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

## `Patch Type Access Control List`

<a id="opIdTypeAccessControl_Patch Type Access Control List"></a>

Updates the ACL for the specified type using an RFC 6902 compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List.

### Request
```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string typeId`
<br/>Type identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The `SdsType`'s ACL was successfully updated|
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

## `Get Type Owner`

<a id="opIdTypeAccessControl_Get Type Owner"></a>

Gets the Owner of the specified type

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}/Owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string typeId`
<br/>Type identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|Returns the `Trustee`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

---

## `Update Type Owner`

<a id="opIdTypeAccessControl_Update Type Owner"></a>

Updates the Owner of the specified type

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}/Owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string typeId`
<br/>Type identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|The `SdsType`'s owner was updated|
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

## `List Type Access Rights`

<a id="opIdTypeAccessControl_List Type Access Rights"></a>

Gets the Access Rights associated with the specified type for the requesting identity

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Types/{typeId}/AccessRights
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string typeId`
<br/>Type identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns the `CommonAccessRights`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response

```json
HTTP/1.1 200
Content-Type: application/json

["Read", "Write"]
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

# Access Control List

## `Get Stream Access Control List`

<a id="opIdStreamAccessControl_Get Stream Access Control List"></a>

Returns the ACL of the specified stream.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Returns the `AccessControlList`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": "[",
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

## `Update Stream Access Control List`

<a id="opIdStreamAccessControl_Update Stream Access Control List"></a>

Updates the ACL of the specified stream.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`AccessControlList` was successfully updated|
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

## `Patch Stream Access Control List`

<a id="opIdStreamAccessControl_Patch Stream Access Control List"></a>

Updates the ACL of the specified stream using an RFC 6902 compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List.

### Request
```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`AccessControlList` was successfully updated|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict|
|412|[ErrorResponseBody](#schemaerrorresponsebody)|Precondition Failed|
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

## `Get Stream Owner`

<a id="opIdStreamAccessControl_Get Stream Owner"></a>

Returns the Owner of the specified stream.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|Returns the `Trustee`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

---

## `Update Stream Owner`

<a id="opIdStreamAccessControl_Update Stream Owner"></a>

Updates the Owner of the specified stream.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/Owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`Trustee` was successfully returned|
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

## `List Stream Access Rights`

<a id="opIdStreamAccessControl_List Stream Access Rights"></a>

Returns the access rights associated with the specified stream for the requesting identity.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Streams/{streamId}/AccessRights
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamId`
<br/>Stream identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns the `CommonAccessRights`|
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

# Access Control List

## `Get Stream View Access Control List`

<a id="opIdViewAccessControl_Get Stream View Access Control List"></a>

Gets the ACL of the specified stream view

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamViewId`
<br/>Stream view identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Returns the `AccessControlList`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": "[",
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

## `Update Stream View Access Control List`

<a id="opIdViewAccessControl_Update Stream View Access Control List"></a>

Updates the ACL of the specified stream view

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamViewId`
<br/>Stream view identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`AccessControlList` was successfully updated|
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

## `Patch Stream View Access Control List`

<a id="opIdViewAccessControl_Patch Stream View Access Control List"></a>

Updates the ACL of the specified stream view using an RFC 6902 compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List.

### Request
```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamViewId`
<br/>Stream view identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`AccessControlList` was successfully updated|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|412|[ErrorResponseBody](#schemaerrorresponsebody)|Precondition Failed|
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

## `Get Stream View Owner`

<a id="opIdViewAccessControl_Get Stream View Owner"></a>

Gets the Owner of the specified stream view

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}/Owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamViewId`
<br/>Stream view identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|Returns the `Trustee`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

---

## `Update Stream View Owner`

<a id="opIdViewAccessControl_Update Stream View Owner"></a>

Updates the Owner of the specified stream view

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}/Owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamViewId`
<br/>Stream view identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`Trustee` was successfully returned|
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

## `List Stream View Access Rights`

<a id="opIdViewAccessControl_List Stream View Access Rights"></a>

Gets the Access Rights associated with the specified stream view for the requesting identity

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/StreamViews/{streamViewId}/AccessRights
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string streamViewId`
<br/>Stream view identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns the `CommonAccessRights`|
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

# Access Control List

## `Get Quantity Access Control List`

<a id="opIdQuantityAccessControl_Get Quantity Access Control List"></a>

Gets the ACL of the specified quantity

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Returns the `AccessControlList`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": "[",
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

## `Update Quantity Access Control List`

<a id="opIdQuantityAccessControl_Update Quantity Access Control List"></a>

Updates the ACL of the specified quantity

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`AccessControlList` was successfully updated|
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

## `Patch Quantity Access Control List`

<a id="opIdQuantityAccessControl_Patch Quantity Access Control List"></a>

Updates the ACL for the specified quantity using an RFC 6902 compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List.

### Request
```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Returns the `AccessControlList`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict|
|412|[ErrorResponseBody](#schemaerrorresponsebody)|Precondition Failed|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": "[",
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

## `Get Quantity Owner`

<a id="opIdQuantityAccessControl_Get Quantity Owner"></a>

Gets the Owner of the specified quantity

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|Returns the `Trustee`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

---

## `Update Quantity Owner`

<a id="opIdQuantityAccessControl_Update Quantity Owner"></a>

Updates the Owner of the specified quantity

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`Trustee` was successfully updated|
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

## `List Quantity Access Rights`

<a id="opIdQuantityAccessControl_List Quantity Access Rights"></a>

Gets the Access Rights associated with the specified quantity for the requesting identity

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/AccessRights
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns the `CommonAccessRights`|
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

## `Get Quantity Unit of Measure Access Control List`

<a id="opIdQuantityAccessControl_Get Quantity Unit of Measure Access Control List"></a>

Gets the ACL of the specified unit of measure

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>`string uomId`
<br/>The unit of measure identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|Returns the `AccessControlList`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([AccessControlList](#schemaaccesscontrollist))

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": "[",
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

## `Update Quantity Unit of Measure Access Control List`

<a id="opIdQuantityAccessControl_Update Quantity Unit of Measure Access Control List"></a>

Updates the ACL of the specified unit of measure

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>`string uomId`
<br/>The unit of measure identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|`AccessControlList` was successfully updated|
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

## `Patch Quantity Unit of Measure Access Control List`

<a id="opIdQuantityAccessControl_Patch Quantity Unit of Measure Access Control List"></a>

Updates the ACL for the specified unit of measure using an RFC 6902 compliant JSON Patch document. This allows the ACL to be modified without submitting the entire Access Control List.

### Request
```text 
PATCH /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}/AccessControl
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>`string uomId`
<br/>The unit of measure identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Returns the `AccessControlList`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|409|[ErrorResponseBody](#schemaerrorresponsebody)|Conflict|
|412|[ErrorResponseBody](#schemaerrorresponsebody)|Precondition Failed|
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

## `Get Quantity Unit of Measure Owner`

<a id="opIdQuantityAccessControl_Get Quantity Unit of Measure Owner"></a>

Gets the Owner of the specified unit of measure

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}/Owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>`string uomId`
<br/>The unit of measure identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|Returns the `Trustee`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Missing or invalid inputs|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|One of the resources specified was not found|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|An error occurred while processing the request|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service Unavailable|

#### Example response body
> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

---

## `Update Quantity Unit of Measure Owner`

<a id="opIdQuantityAccessControl_Update Quantity Unit of Measure Owner"></a>

Updates the Owner of the specified unit of measure

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}/Owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>`string uomId`
<br/>The unit of measure identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Returns the `Trustee`|
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

## `List Quantity Unit of Measure Access Rights`

<a id="opIdQuantityAccessControl_List Quantity Unit of Measure Access Rights"></a>

Gets the Access Rights associated with the specified unit of measure for the requesting identity

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}/AccessRights
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/><br/>`string quantityId`
<br/>The quantity identifier<br/><br/>`string uomId`
<br/>The unit of measure identifier<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|Returns the `CommonAccessRights`|
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

### AccessControlList

<a id="schemaaccesscontrollist"></a>
<a id="schema_AccessControlList"></a>
<a id="tocSaccesscontrollist"></a>
<a id="tocsaccesscontrollist"></a>

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|RoleTrusteeAccessControlEntries|[[AccessControlEntry](#schemaaccesscontrolentry)]|false|true|None|

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": "[",
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

#### Properties

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

#### Properties

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

#### Enumerated Values

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

#### Enumerated Values

|Property|Value|
|---|---|
|Allowed|0|
|Denied|1|

---

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

