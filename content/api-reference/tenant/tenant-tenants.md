---
uid: tenant-tenants

---

# Tenants
APIs to manage an OCS Customer Tenant. A tenant represents the set of services, applications, data, and configuration state available to a customer. Users are associated with a tenant via at least one configured identity provider and access to resources can be managed for those users via the assignment of roles. Data and services provided by a tenant may also span geographical regions. A tenant has APIs to manage an OCS customer tenant. Unlike namespaces, tenants are not scoped to a region. Tenant level information, such as users and clients, is stored in all supported regions for read-only purposes. Write operations for tenant management and identity and access management are only supported through the global base URL, such as https://dat-b.osisoft.com/Tenants/{tenantId}. Requests to local URLs will return a status of Method Not Allowed (405). Tenant level information, such as users and clients, is stored in all supported regions for read-only purposes.

## `Get Tenant`

<a id="opIdTenant_Get Tenant"></a>

Returns a specific `Tenant` by the identifier.

### Request
```text 
GET /api/v1/Tenants/{tenantId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[TenantWithProperties](#schematenantwithproperties)|The `Tenant` with Id `tenantId`.|
|400|None|Missing or invalid inputs.<br/>|
|403|None|Forbidden.<br/>|

#### Example response body
> 200 Response ([TenantWithProperties](#schematenantwithproperties))

```json
{
  "Id": "string",
  "CompanyName": "string",
  "State": 0,
  "Created": "2019-08-24T14:15:22Z",
  "LastUpdated": "2019-08-24T14:15:22Z",
  "Alias": "string",
  "Features": [
    {
      "Feature": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "DefaultState": 0
      },
      "CurrentState": 0
    }
  ],
  "ExternalAccountId": "string",
  "Entitlements": [
    {
      "EntitlementDefinitionId": "string",
      "EntitlementType": 0,
      "LimitType": 0,
      "Value": 0,
      "ManualBlockStatus": true
    }
  ]
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Tenant Exists`

<a id="opIdTenant_Tenant Exists"></a>

Checks if a `Tenant` with a specific identifier exists.

### Request
```text 
HEAD /api/v1/Tenants/{tenantId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|HTTP 200 status code if a `Tenant` with `tenantId` exists.|
|400|None|Missing or invalid inputs.<br/>|
|404|None|Client or tenant not found.<br/>|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Update Tenant`

<a id="opIdTenant_Update Tenant"></a>

Updates a specified `Tenant` object.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>

### Request Body

The updated details of the Tenant.<br/>

```json
{
  "Id": "string",
  "CompanyName": "string",
  "State": 0,
  "Created": "2019-08-24T14:15:22Z",
  "LastUpdated": "2019-08-24T14:15:22Z",
  "Alias": "string",
  "Features": [
    {
      "Feature": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "DefaultState": 0
      },
      "CurrentState": 0
    }
  ],
  "ExternalAccountId": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Tenant](#schematenant)|The updated `Tenant` with Id `tenantId`.|
|400|None|Missing or invalid inputs.<br/>|
|403|None|Forbidden.<br/>|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|

#### Example response body
> 200 Response ([Tenant](#schematenant))

```json
{
  "Id": "string",
  "CompanyName": "string",
  "State": 0,
  "Created": "2019-08-24T14:15:22Z",
  "LastUpdated": "2019-08-24T14:15:22Z",
  "Alias": "string",
  "Features": [
    {
      "Feature": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "DefaultState": 0
      },
      "CurrentState": 0
    }
  ],
  "ExternalAccountId": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Tenant Icon`

<a id="opIdTenant_Get Tenant Icon"></a>

Returns an icon specified by its `Tenant` identifier.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Icon
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|string|The icon associated with the `Tenant`.|
|400|None|Missing or invalid inputs.<br/>|
|403|None|Forbidden.<br/>|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Create Or Update Tenant Icon`

<a id="opIdTenant_Create Or Update Tenant Icon"></a>

Creates or updates the icon for a `Tenant`. Note that the icon size must be less than `65536`.

### Request
```text 
PUT /api/v1/Tenants/{tenantId}/Icon
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>

### Request Body

The Base64 encoded PNG icon for the Tenant.<br/>

```json
"string"
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|string|The updated icon associated with the `Tenant`.|
|400|None|Missing or invalid inputs.<br/>|
|403|None|Forbidden.<br/>|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete Tenant Icon`

<a id="opIdTenant_Delete Tenant Icon"></a>

Deletes the icon for a `Tenant`.

### Request
```text 
DELETE /api/v1/Tenants/{tenantId}/Icon
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|string|HTTP status code: 200 on successful deletion or another HTTP status codes on failure.|
|400|None|Missing or invalid inputs.<br/>|
|403|None|Forbidden.<br/>|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Regions`

<a id="opIdTenant_Get Regions"></a>

Returns the `RegionBase` list for the specified `Tenant`.

### Request
```text 
GET /api/v1/Tenants/{tenantId}/Regions
```

#### Parameters

`string tenantId`
<br/>Tenant identifier.<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[RegionBase](#schemaregionbase)|The `RegionBase` list associated with the `Tenant`.|
|403|None|Forbidden.<br/>|
|404|None|Client or tenant not found.<br/>|

#### Example response body
> 200 Response ([RegionBase](#schemaregionbase))

```json
{
  "Id": "string",
  "Name": "string",
  "AdministrativeEndpointsWritable": true,
  "BaseAddress": "string"
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---
## Definitions

### TenantWithProperties

<a id="schematenantwithproperties"></a>
<a id="schema_TenantWithProperties"></a>
<a id="tocStenantwithproperties"></a>
<a id="tocstenantwithproperties"></a>

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Identifier of this tenant.|
|CompanyName|string|false|true|Company name of this tenant.|
|State|[TenantProvisioningState](#schematenantprovisioningstate)|false|false|Current tenant provisioning state for this tenant.|
|Created|date-time|false|false|Date and time this tenant was added to the system.|
|LastUpdated|date-time|false|false|Date this tenant was last updated.|
|Alias|string|false|true|Specifies a unique alias for this tenant.|
|Features|[[FeatureState](#schemafeaturestate)]|false|true|List of feature states for this tenant. Returned during GET methods.|
|ExternalAccountId|string|false|true|External account identifier for this tenant.|
|Entitlements|[[TenantEntitlementInstance](#schematenantentitlementinstance)]|false|true|[An instance of an entitlement.]|

```json
{
  "Id": "string",
  "CompanyName": "string",
  "State": 0,
  "Created": "2019-08-24T14:15:22Z",
  "LastUpdated": "2019-08-24T14:15:22Z",
  "Alias": "string",
  "Features": [
    {
      "Feature": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "DefaultState": 0
      },
      "CurrentState": 0
    }
  ],
  "ExternalAccountId": "string",
  "Entitlements": [
    {
      "EntitlementDefinitionId": "string",
      "EntitlementType": 0,
      "LimitType": 0,
      "Value": 0,
      "ManualBlockStatus": true
    }
  ]
}

```

---

### TenantProvisioningState

<a id="schematenantprovisioningstate"></a>
<a id="schema_TenantProvisioningState"></a>
<a id="tocStenantprovisioningstate"></a>
<a id="tocstenantprovisioningstate"></a>

Status codes describing a tenant's current provisioning state.

#### Enumerated Values

|Property|Value|
|---|---|
|Creating|0|
|Active|1|
|Deactivating|2|
|Deactivated|3|
|Reactivating|4|
|Deleting|5|
|Deleted|6|
|Purging|7|
|IsHomeTenant|8|

---

### FeatureState

<a id="schemafeaturestate"></a>
<a id="schema_FeatureState"></a>
<a id="tocSfeaturestate"></a>
<a id="tocsfeaturestate"></a>

Representation of a server-side database interpretation of a feature state.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Feature|[Feature](#schemafeature)|false|true|The feature to which the feature state corresponds.|
|CurrentState|int32|false|false|Current state of the feature.|

```json
{
  "Feature": {
    "Id": "string",
    "Name": "string",
    "Description": "string",
    "DefaultState": 0
  },
  "CurrentState": 0
}

```

---

### Feature

<a id="schemafeature"></a>
<a id="schema_Feature"></a>
<a id="tocSfeature"></a>
<a id="tocsfeature"></a>

Representation of a server-side database interpretation of a feature.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Identifier of this feature.|
|Name|string|false|true|Name of the feature.|
|Description|string|false|true|Description of the feature.|
|DefaultState|int32|false|false|Default state of the feature.|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "DefaultState": 0
}

```

---

### TenantEntitlementInstance

<a id="schematenantentitlementinstance"></a>
<a id="schema_TenantEntitlementInstance"></a>
<a id="tocStenantentitlementinstance"></a>
<a id="tocstenantentitlementinstance"></a>

An instance of an entitlement.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|EntitlementDefinitionId|string|false|true|Gets or sets the identifier of the corresponding entitlement definition.|
|EntitlementType|[EntitlementType](#schemaentitlementtype)|false|false|Gets or sets the EntitlementType.|
|LimitType|[LimitType](#schemalimittype)|false|false|Gets or sets the Limit type.|
|Value|int32|false|false|Gets or sets the value.|
|ManualBlockStatus|boolean|false|false|Gets or sets the status.|

```json
{
  "EntitlementDefinitionId": "string",
  "EntitlementType": 0,
  "LimitType": 0,
  "Value": 0,
  "ManualBlockStatus": true
}

```

---

### EntitlementType

<a id="schemaentitlementtype"></a>
<a id="schema_EntitlementType"></a>
<a id="tocSentitlementtype"></a>
<a id="tocsentitlementtype"></a>

The type of entitlement.

#### Enumerated Values

|Property|Value|
|---|---|
|Feature|0|
|Resource|1|
|Usage|2|

---

### LimitType

<a id="schemalimittype"></a>
<a id="schema_LimitType"></a>
<a id="tocSlimittype"></a>
<a id="tocslimittype"></a>

The limit type of entitlement.

#### Enumerated Values

|Property|Value|
|---|---|
|Hard|0|
|Soft|1|

---

### Tenant

<a id="schematenant"></a>
<a id="schema_Tenant"></a>
<a id="tocStenant"></a>
<a id="tocstenant"></a>

Representation of a server-side database interpretation of a tenant.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Identifier of this tenant.|
|CompanyName|string|false|true|Company name of this tenant.|
|State|[TenantProvisioningState](#schematenantprovisioningstate)|false|false|Current tenant provisioning state for this tenant.|
|Created|date-time|false|false|Date and time this tenant was added to the system.|
|LastUpdated|date-time|false|false|Date this tenant was last updated.|
|Alias|string|false|true|Specifies a unique alias for this tenant.|
|Features|[[FeatureState](#schemafeaturestate)]|false|true|List of feature states for this tenant. Returned during GET methods.|
|ExternalAccountId|string|false|true|External account identifier for this tenant.|

```json
{
  "Id": "string",
  "CompanyName": "string",
  "State": 0,
  "Created": "2019-08-24T14:15:22Z",
  "LastUpdated": "2019-08-24T14:15:22Z",
  "Alias": "string",
  "Features": [
    {
      "Feature": {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "DefaultState": 0
      },
      "CurrentState": 0
    }
  ],
  "ExternalAccountId": "string"
}

```

---

### RegionBase

<a id="schemaregionbase"></a>
<a id="schema_RegionBase"></a>
<a id="tocSregionbase"></a>
<a id="tocsregionbase"></a>

Represents a region within an OCS environment for OCS customers to see.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Identifier for the region.|
|Name|string|false|true|Name associated with the region.|
|AdministrativeEndpointsWritable|boolean|false|false|Value indicating whether value indicating whether administrative endpoints are writable in the region.|
|BaseAddress|string|false|true|Base address for the region.|

```json
{
  "Id": "string",
  "Name": "string",
  "AdministrativeEndpointsWritable": true,
  "BaseAddress": "string"
}

```

---

