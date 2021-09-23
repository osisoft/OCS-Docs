---
uid: data-views-access-control

---

# Access Control
This portion of the [overall data views API](xref:DataViewsAPIOverview) focuses on [securing data views](xref:DataViewsSecuringDataViews) by setting their ownership and permissions.

## `List Data Views Access Rights`

<a id="opIdCollectionAccessRights_List Data Views Access Rights"></a>

Returns the access rights to the data views collection for the calling user or client.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accessrights/dataviews
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of access rights to the data views collection.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized to view the requested data view collection's access control list.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Example response body</h4>

> 200 Response

```json
HTTP 200 OK
[
  "Read",
  "Write",
  "Delete",
  "ManageAccessControl"
]
```
> 403 Response ([ErrorResponse](#schemaerrorresponse))

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
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

# Access Control
This portion of the [overall data views API](xref:accessControl#access-control-lists) focuses on [securing data views](xref:DataViewsSecuringDataViews) by setting their ownership and permissions.

## `Get Data Views Access Control List`

<a id="opIdCollectionAcl_Get Data Views Access Control List"></a>

Returns the default [`AccessControlList`](xref:accessControl#access-control-lists) for the DataViews collection.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/dataviews
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The default access control list of the data views collection.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized to view the requested data view collection's access control list.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Example response body</h4>

> 200 Response

```json
HTTP 200 OK
{
  "RoleTrusteeAccessControlEntries": 
  [
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "11111111-1111-1111-1111-111111111111"
      },
      "AccessType": Allowed,
      "AccessRights": 1
    },
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "22222222-2222-2222-2222-222222222222"
      },
      "AccessType": Allowed,
      "AccessRights": 15
    },
    {
      "Trustee": {
        "Type": User,
        "RoleId": "33333333-3333-3333-3333-333333333333"
      },
      "AccessType": Denied,
      "AccessRights": 8
    }
  ]
}
```
> 403 Response ([ErrorResponse](#schemaerrorresponse))

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
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Update Data Views Access Control List`

<a id="opIdCollectionAcl_Update Data Views Access Control List"></a>

Updates the default [`AccessControlList`](xref:accessControl#access-control-lists) for the DataViews collection.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/dataviews
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

An [`AccessControlList`](xref:accessControl#access-control-lists).<br/>

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

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Successfully updated the default access control list of the data views collection.|
|400|string|The request is not valid. See the response body for details.|
|403|string|You are not authorized to update the data views collection's default access control list.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

# Access Control
This portion of the [overall data views API](DataViewsAPIOverview) focuses on [securing data views](DataViewsSecuringDataViews) by setting their ownership and permissions.

## `Get Data View Access Control List`

<a id="opIdDataViewsPermissions_Get Data View Access Control List"></a>

Returns the default [`AccessControlList`](xref:accessControl#access-control-lists) for the DataViews collection.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string id`
<br/>Data view identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The access control list of the requested data view.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized to view the requested data view's access control list.|
|404|[ErrorResponse](#schemaerrorresponse)|The requested data view was not found.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Example response body</h4>

> 200 Response

```json
HTTP 200 OK
{
  "RoleTrusteeAccessControlEntries": 
  [
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "11111111-1111-1111-1111-111111111111"
      },
      "AccessType": Allowed,
      "AccessRights": 1
    },
    {
      "Trustee": {
        "Type": Role,
        "RoleId": "22222222-2222-2222-2222-222222222222"
      },
      "AccessType": Allowed,
      "AccessRights": 15
    },
    {
      "Trustee": {
        "Type": User,
        "RoleId": "33333333-3333-3333-3333-333333333333"
      },
      "AccessType": Denied,
      "AccessRights": 8
    }
  ]
}
```
> 403 Response ([ErrorResponse](#schemaerrorresponse))

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
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Update Data View Access Control List`

<a id="opIdDataViewsPermissions_Update Data View Access Control List"></a>

Updates the default [`AccessControlList`](xref:accessControl#access-control-lists) for the DataViews collection.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string id`
<br/>Data view identifier.<br/><br/>

<h4>Request Body</h4>

An [`AccessControlList`](xref:accessControl#access-control-lists).<br/>

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

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Successfully updated the data view access control list.|
|400|[ErrorResponse](#schemaerrorresponse)|The request is not valid. See the response body for details.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized to update the requested data view's access control list.|
|404|[ErrorResponse](#schemaerrorresponse)|The requested data view was not found.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

---

## `Get Data View Owner`

<a id="opIdDataViewsPermissions_Get Data View Owner"></a>

Returns the owner [`Trustee`](xref:accessControl#owner) of the specified data view.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string id`
<br/>Data view identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|The owner of the requested data view.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized to view the requested data view's owner.|
|404|[ErrorResponse](#schemaerrorresponse)|The requested data view was not found.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Example response body</h4>

> 200 Response

```json
{
    "Type": User,
    "TenantId": "55555555-5555-5555-5555-555555555555",
    "ObjectId": "44444444-4444-4444-4444-444444444444"
}
```
> 403 Response ([ErrorResponse](#schemaerrorresponse))

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
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---

## `Update Data View Owner`

<a id="opIdDataViewsPermissions_Update Data View Owner"></a>

Updates the owner [`Trustee`](xref:accessControl#owner) of the specified data view.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string id`
<br/>Data view identifier.<br/><br/>

<h4>Request Body</h4>

A [`Trustee`](xref:accessControl#owner).<br/>

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Successfully updated the data view owner.|
|400|[ErrorResponse](#schemaerrorresponse)|The request is not valid. See the response body for details.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized to update the requested data view's owner.|
|404|[ErrorResponse](#schemaerrorresponse)|The requested data view was not found.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

---

## `List Data View Access Rights`

<a id="opIdDataViewsPermissions_List Data View Access Rights"></a>

Returns the access rights to the requested data view for the calling user or client.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/accessrights
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string id`
<br/>Data view identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of access rights to the requested data view.|
|403|[ErrorResponse](#schemaerrorresponse)|You are not authorized for this operation.|
|404|[ErrorResponse](#schemaerrorresponse)|The requested data view was not found.|
|500|[ErrorResponse](#schemaerrorresponse)|An error occurred while processing the request. See the response body for details.|

<h4>Example response body</h4>

> 200 Response

```json
HTTP 200 OK
[
  "Read",
  "Write",
  "Delete",
  "ManageAccessControl"
]
```
> 403 Response ([ErrorResponse](#schemaerrorresponse))

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
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
}
```

---
## Definitions

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|None|
|Error|string|false|true|None|
|Reason|string|false|true|None|
|Resolution|string|false|true|None|
|Parameters|object|false|true|None|
|ChildErrors|object|false|true|None|

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
  "ChildErrors": {
    "property1": null,
    "property2": null
  }
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

