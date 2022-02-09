---
uid: tenant-namespaces

---

# Namespaces
A Namespace is a logical unit of organization for data within a tenant. It is a collection of types, streams, and stream views. Each tenant may contain more than one namespace. Before you can put any data into the system for a given tenant, a namespace must be created within the scope of that tenant. Namespace identifiers are unique within an account. A namespace is a collection of SDS types, streams, and stream views. Namespace identifiers are unique within a tenant. Requirements for namespace identifiers must meet the following critieria: contain 100 characters or fewer, contain only alphanumeric characters, underscores, dashes, spaces, and periods; not contain two consecutive periods, not start or end with a period, not start with two consecutive underscores. In practice, namespaces may correspond to a specific set of infrastructure assets, but more commonly correspond to virtual partitions within a single set of assets. You can create one or more namespaces within a tenant. Each namespace is effectively an instance of SDS, within which you create types and streams, stream views, data views, and metadata.

## `List All`

<a id="opIdNamespace_List All"></a>

Returns all `Namespace`s owned by the specified `Tenant` to which the caller has access.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces
?region={region}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>
`[optional] string region`
<br/>The region identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Namespace](#schemanamespace)[]|An array of `Namespace` objects for the namespaces that belong to a tenant with `tenantId`.|
|400|None|Missing or invalid inputs.|
|403|None|Forbidden.|

<h4>Example response body</h4>

> 200 Response ([Namespace](#schemanamespace)[])

```json
[
  {
    "Id": "string",
    "Region": "string",
    "Self": "string",
    "Description": "string",
    "State": 0,
    "Owner": {
      "Type": 1,
      "ObjectId": "string",
      "TenantId": "string"
    },
    "AccessControl": {
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
    },
    "RegionId": "string",
    "InstanceId": "string"
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Get Namespace By Id`

<a id="opIdNamespace_Get Namespace By Id"></a>

Returns a `Namespace` with the specified identifier.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Namespace](#schemanamespace)|The `Namespace` with identifier `namespaceId`.|
|400|None|Missing or invalid inputs.|
|403|None|Forbidden.|
|404|None|`Namespace` not found in the specified tenant.|

<h4>Example response body</h4>

> 200 Response ([Namespace](#schemanamespace))

```json
{
  "Id": "string",
  "Region": "string",
  "Self": "string",
  "Description": "string",
  "State": 0,
  "Owner": {
    "Type": 1,
    "ObjectId": "string",
    "TenantId": "string"
  },
  "AccessControl": {
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
  },
  "RegionId": "string",
  "InstanceId": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Create`

<a id="opIdNamespace_Create"></a>

Creates a new `Namespace` in the specified `Tenant`.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}
?isServerTest={isServerTest}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] boolean isServerTest`
<br/>This parameter is unused and will be removed in the next API version.<br/><br/>

<h4>Request Body</h4>

The new Namespace to be created.<br/>

```json
{
  "Id": "string",
  "Region": "string",
  "Self": "string",
  "Description": "string",
  "State": 0,
  "Owner": {
    "Type": 1,
    "ObjectId": "string",
    "TenantId": "string"
  },
  "AccessControl": {
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
  },
  "RegionId": "string",
  "InstanceId": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[Namespace](#schemanamespace)|The created `Namespace`.|
|302|None|Returns the location of the existing `Namespace` object.|
|400|None|Missing or invalid inputs.|
|403|None|Forbidden.|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|
|409|None|A `Namespace` already exists with different values.|

<h4>Example response body</h4>

> 201 Response ([Namespace](#schemanamespace))

```json
{
  "Id": "string",
  "Region": "string",
  "Self": "string",
  "Description": "string",
  "State": 0,
  "Owner": {
    "Type": 1,
    "ObjectId": "string",
    "TenantId": "string"
  },
  "AccessControl": {
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
  },
  "RegionId": "string",
  "InstanceId": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Update`

<a id="opIdNamespace_Update"></a>

Updates the `Namespace` information: description; the `AccessControlList` and owner's `Trustee` can only be updated through their own routes.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

The new details to store for the Namespace.<br/>

```json
{
  "Id": "string",
  "Region": "string",
  "Self": "string",
  "Description": "string",
  "State": 0,
  "Owner": {
    "Type": 1,
    "ObjectId": "string",
    "TenantId": "string"
  },
  "AccessControl": {
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
  },
  "RegionId": "string",
  "InstanceId": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Namespace](#schemanamespace)|The updated `Namespace` with identifier `namespaceId`.|
|400|None|Missing or invalid inputs.|
|403|None|Forbidden.|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|

<h4>Example response body</h4>

> 200 Response ([Namespace](#schemanamespace))

```json
{
  "Id": "string",
  "Region": "string",
  "Self": "string",
  "Description": "string",
  "State": 0,
  "Owner": {
    "Type": 1,
    "ObjectId": "string",
    "TenantId": "string"
  },
  "AccessControl": {
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
  },
  "RegionId": "string",
  "InstanceId": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Delete`

<a id="opIdNamespace_Delete"></a>

Deletes a `Namespace` in the specified `Tenant`.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}
?isServerTest={isServerTest}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>
`[optional] boolean isServerTest`
<br/>This parameter is unused and will be removed in the next API version.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|HTTP status code: 200 on successful deletion or another HTTP status codes on failure.|
|400|None|Missing or invalid inputs.|
|403|None|#403.|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Get Access Control`

<a id="opIdNamespace_Get Access Control"></a>

Returns the `AccessControlList` that is used to authorize access to a `Namespace`.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The `AccessControlList` for the namespace with identifier `namespaceId`.|
|400|None|Missing or invalid inputs.|
|403|None|Forbidden.|

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

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Set Access Control`

<a id="opIdNamespace_Set Access Control"></a>

Updates the `AccessControlList` that is used to authorize access to a `Namespace`.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

The updated AccessControlList for the Namespace.<br/>

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
|200|[AccessControlList](#schemaaccesscontrollist)|The updated `AccessControlList` for the namespace with identifier `namespaceId`.|
|400|None|Missing or invalid inputs.|
|403|None|Forbidden.|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|

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

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Get Owner`

<a id="opIdNamespace_Get Owner"></a>

Returns the owner's `Trustee` for a given `Namespace`.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|The `Trustee` for the namespace with identifier `namespaceId`.|
|400|None|Missing or invalid inputs.|
|403|None|Forbidden.|

<h4>Example response body</h4>

> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Set Owner`

<a id="opIdNamespace_Set Owner"></a>

Changes the owner's `Trustee` for a given `Namespace`.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Namespaces/{namespaceId}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

The new owner's Trustee of the Namespace.<br/>

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
|200|[Trustee](#schematrustee)|The updated `Trustee` for the namespace with identifier `namespaceId`.|
|400|None|Missing or invalid inputs.|
|403|None|Forbidden.|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|

<h4>Example response body</h4>

> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---
## Definitions

### Namespace

<a id="schemanamespace"></a>
<a id="schema_Namespace"></a>
<a id="tocSnamespace"></a>
<a id="tocsnamespace"></a>

Representation of a server-side database interpretation of a namespace.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Name of this namespace; unique within a tenant's namespaces.|
|Region|string|false|true|Region in which the namespace is provisioned.|
|Self|string|false|true|Namespace's URI.|
|Description|string|false|true|Description of this namespace.|
|State|[NamespaceProvisioningState](#schemanamespaceprovisioningstate)|false|false|Current state of this namespace.|
|Owner|[Trustee](#schematrustee)|false|true|Owner Trustee of this namespace.|
|AccessControl|[AccessControlList](#schemaaccesscontrollist)|false|true|AccessControlList that defines access control for this Namespace.|
|RegionId|string|false|true|Geographic region of deployment in which the namespace is provisioned.|
|InstanceId|string|false|true|Instance ID for this Namespace.|

```json
{
  "Id": "string",
  "Region": "string",
  "Self": "string",
  "Description": "string",
  "State": 0,
  "Owner": {
    "Type": 1,
    "ObjectId": "string",
    "TenantId": "string"
  },
  "AccessControl": {
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
  },
  "RegionId": "string",
  "InstanceId": "string"
}

```

---

### NamespaceProvisioningState

<a id="schemanamespaceprovisioningstate"></a>
<a id="schema_NamespaceProvisioningState"></a>
<a id="tocSnamespaceprovisioningstate"></a>
<a id="tocsnamespaceprovisioningstate"></a>

Status codes describing a namespace's current provisioning state.

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|Creating|0|
|Active|1|
|Deleting|2|
|Deleted|3|
|Suspended|4|
|Deactivated|4|
|Deactivating|5|
|Reactivating|6|
|Locking|7|
|Locked|8|
|Unlocking|9|

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

