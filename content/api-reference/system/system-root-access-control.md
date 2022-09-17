---
uid: system-root-access-control

---

# Root Access Control
APIs to manage default access to entities governed by an AccessControlList.

## `Get Root Namespace Acl`

<a id="opIdRootAccessControl_Get Root Namespace Acl"></a>

Retrieves the `AccessControlList` that is used to authorize access to a `Namespace` if none is specified during creation.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/AccessControl/Namespaces
```

<h4>Parameters</h4>

`string tenantId`
<br/>The identifier of the `Tenant`.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The root `AccessControlList` for `Namespace`.|
|400|None|Could not retrieve the `AccessControlList` due to missing or invalid input.|
|403|None|Forbidden.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "a4e06a18-9a0e-4721-9772-524c937bdb5c"
      },
      "AccessRights": 1
    },
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "a9a3b01b-e0d3-49c9-b931-72433152c192"
      },
      "AccessRights": 3
    },
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "e1aaf6ac-3416-4db2-bd5d-d62b13340f4d"
      },
      "AccessRights": 31
    }
  ]
}
```

---

## `Set Root Namespace Acl`

<a id="opIdRootAccessControl_Set Root Namespace Acl"></a>

Modifies the `AccessControlList` that is used to authorize access to a `Namespace` if none is specified during creation.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/AccessControl/Namespaces
```

<h4>Parameters</h4>

`string tenantId`
<br/>The identifier of the `Tenant`.<br/><br/>

<h4>Request Body</h4>

The new root AccessControlList for Namespaces.<br/>

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
|200|[AccessControlList](#schemaaccesscontrollist)|The new `AccessControlList` for `Namespace`.|
|400|None|Could not update the `AccessControlList` due to missing or invalid input.|
|403|None|Forbidden.|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "a4e06a18-9a0e-4721-9772-524c937bdb5c"
      },
      "AccessRights": 1
    },
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "a9a3b01b-e0d3-49c9-b931-72433152c192"
      },
      "AccessRights": 3
    },
    {
      "Trustee": {
        "Type": 3,
        "ObjectId": "e1aaf6ac-3416-4db2-bd5d-d62b13340f4d"
      },
      "AccessRights": 31
    }
  ]
}
```

---
## Definitions

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

