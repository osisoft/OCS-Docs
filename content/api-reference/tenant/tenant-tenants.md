---
uid: tenant-tenants

---

# Tenants
APIs to manage a Customer Tenant. A tenant represents the set of services, applications, data, and configuration state available to a customer. Users are associated with a tenant via at least one configured identity provider and access to resources can be managed for those users via the assignment of roles. Data and services provided by a tenant may also span geographical regions. A tenant has APIs to manage a customer tenant. Unlike namespaces, tenants are not scoped to a region. Tenant level information, such as users and clients, is stored in all supported regions for read-only purposes. Write operations for tenant management and identity and access management are only supported through the global base URL, such as https://dat-b.osisoft.com/Tenants/{tenantId}. Requests to local URLs will return a status of Method Not Allowed (405). Tenant level information, such as users and clients, is stored in all supported regions for read-only purposes.

## `Get Tenant`

<a id="opIdTenant_Get Tenant"></a>

Returns a specific `Tenant` by the identifier.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>The identifier of the `Tenant`.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[TenantWithProperties](#schematenantwithproperties)|The `Tenant` with Id `tenantId`.|
|400|None|Could not retrieve the specified `TenantWithProperties`s due to missing or invalid input.|
|403|None|Forbidden.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Id": "7fc97c8b-8f60-4f29-af71-3178c414e7a0",
  "CompanyName": "CompanyName",
  "State": 1,
  "Created": "2021-07-23T15:54:07.523Z",
  "LastUpdated": "2021-07-23T15:54:10.873Z",
  "Alias": "CompanyAlias",
  "Features": [
    {
      "Feature": {
        "Id": "95c2b5fe-355d-4b33-a748-b738707e0648",
        "Name": "FeatureName",
        "Description": "Feature Description"
      },
      "CurrentState": 1
    }
  ],
  "Entitlements": [
    {
      "EntitlementDefinitionId": "NamespaceCount",
      "EntitlementType": 1,
      "Value": 5
    },
    {
      "EntitlementDefinitionId": "Region-NA",
      "Value": 1
    },
    {
      "EntitlementDefinitionId": "StreamAccessCount",
      "EntitlementType": 2,
      "LimitType": 1,
      "Value": 1000
    },
    {
      "EntitlementDefinitionId": "StreamCount",
      "EntitlementType": 1,
      "LimitType": 1,
      "Value": 1000
    }
  ],
  "TenantType": "Unlinked"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Tenant Exists`

<a id="opIdTenant_Tenant Exists"></a>

Checks if a `Tenant` with a specific identifier exists.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>The identifier of the `Tenant`.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|HTTP 204 status code if a `Tenant` with `tenantId` exists.|
|400|None|Could not check the `Tenant` due to missing or invalid input.|
|404|None|Not Found.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Update Tenant`

<a id="opIdTenant_Update Tenant"></a>

Updates a specified `Tenant` object.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>The identifier of the `Tenant`.<br/><br/>

<h4>Request Body</h4>

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
  "ExternalAccountId": "string",
  "TenantType": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Tenant](#schematenant)|The updated `Tenant` with Id `tenantId`.|
|400|None|Could not return the `Tenant` due to missing or invalid input.|
|403|None|Forbidden.|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|

<h4>Example response body</h4>

> 200 Response

```json
{
  "Id": "7fc97c8b-8f60-4f29-af71-3178c414e7a0",
  "CompanyName": "CompanyName",
  "State": 1,
  "Created": "2021-07-23T15:54:07.523Z",
  "LastUpdated": "2021-07-23T15:54:10.873Z",
  "Alias": "CompanyAlias",
  "Features": [
    {
      "Feature": {
        "Id": "95c2b5fe-355d-4b33-a748-b738707e0648",
        "Name": "FeatureName",
        "Description": "Feature Description"
      },
      "CurrentState": 1
    }
  ],
  "TenantType": "Unlinked"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Tenant Icon`

<a id="opIdTenant_Get Tenant Icon"></a>

Returns an icon specified by its `Tenant` identifier.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Icon
```

<h4>Parameters</h4>

`string tenantId`
<br/>The identifier of the `Tenant`.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|string|The icon associated with the `Tenant`.|
|400|None|Could not return the icon for the `Tenant` due to missing or invalid input.|
|403|None|Forbidden.|

<h4>Example response body</h4>

> 200 Response

```json
"IconImageString"
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Create Or Update Tenant Icon`

<a id="opIdTenant_Create Or Update Tenant Icon"></a>

Creates or updates the icon for a `Tenant`. Note that the icon size must be less than ExtendedSystemController.MaxIconSizeInBytes bytes in size.

<h3>Request</h3>

```text 
PUT /api/v1/Tenants/{tenantId}/Icon
```

<h4>Parameters</h4>

`string tenantId`
<br/>The identifier of the `Tenant`.<br/><br/>

<h4>Request Body</h4>

The Base64 encoded PNG icon for the Tenant.<br/>

```json
"string"
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|string|The updated icon associated with the `Tenant`.|
|400|None|Could not return the icon for the `Tenant` due to missing or invalid input.|
|403|None|Forbidden.|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|

<h4>Example response body</h4>

> 200 Response

```json
"IconImageString"
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Delete Tenant Icon`

<a id="opIdTenant_Delete Tenant Icon"></a>

Deletes the icon for a `Tenant`.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/Icon
```

<h4>Parameters</h4>

`string tenantId`
<br/>The identifier of the `Tenant`.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|HTTP status code: 204 on successful deletion or another HTTP status codes on failure.|
|400|None|Could not delete the icon for the `Tenant` due to missing or invalid input.|
|403|None|Forbidden.|
|405|None|Method not allowed at this base URL. Try the request again at the Global base URL.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `List Regions`

<a id="opIdTenant_List Regions"></a>

Returns the `RegionBase` list for the specified `Tenant`.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/Regions
```

<h4>Parameters</h4>

`string tenantId`
<br/>The identifier of the `Tenant`.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[RegionBase](#schemaregionbase)[]|The `RegionBase` list associated with the `Tenant`.|
|403|None|Forbidden.|
|404|None|Not Found.|

<h4>Example response body</h4>

> 200 Response

```json
[
  {
    "Id": "WestEurope",
    "Name": "West Europe",
    "BaseAddress": "https://dat-d.osisoft.com"
  },
  {
    "Id": "WestUS",
    "Name": "West US",
    "AdministrativeEndpointsWritable": true,
    "BaseAddress": "https://dat-b.osisoft.com"
  }
]
```

<h3>Authorization</h3>

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

Tenant with entitlements.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Gets or sets the identifier.|
|CompanyName|string|false|true|Gets or sets the name of the company.|
|State|[TenantProvisioningState](#schematenantprovisioningstate)|false|false|Gets or sets the state.|
|Created|date-time|false|false|Gets or sets the date of tenant creation in database.|
|LastUpdated|date-time|false|false|Gets or sets the last updated.|
|Alias|string|false|true|Gets or sets the alias.|
|Features|[[FeatureState](#schemafeaturestate)]|false|true|Gets or sets the features.|
|ExternalAccountId|string|false|true|Gets or sets the external account identifier.|
|TenantType|string|false|true|Gets or sets tenant type.|
|Entitlements|[[TenantEntitlementInstance](#schematenantentitlementinstance)]|false|true|Gets or sets the entitlements.|

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
  "TenantType": "string",
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

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Creating|0|Status codes describing a tenant's current provisioning state.|
|Active|1|Status codes describing a tenant's current provisioning state.|
|Deactivating|2|Status codes describing a tenant's current provisioning state.|
|Deactivated|3|Status codes describing a tenant's current provisioning state.|
|Reactivating|4|Status codes describing a tenant's current provisioning state.|
|Deleting|5|Status codes describing a tenant's current provisioning state.|
|Deleted|6|Status codes describing a tenant's current provisioning state.|
|Purging|7|Status codes describing a tenant's current provisioning state.|
|IsHomeTenant|8|Status codes describing a tenant's current provisioning state.|
|Locking|9|Status codes describing a tenant's current provisioning state.|
|Locked|10|Status codes describing a tenant's current provisioning state.|
|Unlocking|11|Status codes describing a tenant's current provisioning state.|

---

### FeatureState

<a id="schemafeaturestate"></a>
<a id="schema_FeatureState"></a>
<a id="tocSfeaturestate"></a>
<a id="tocsfeaturestate"></a>

Representation of a server-side database interpretation of a feature state.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Feature|[Feature](#schemafeature)|false|true|Gets or sets the feature.|
|CurrentState|int32|false|false|Gets or sets the current state of the feature.|

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

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Gets or sets the identifier.|
|Name|string|false|true|Gets or sets the name.|
|Description|string|false|true|Gets or sets the description.|
|DefaultState|int32|false|false|Gets or sets the default state.|

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

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|EntitlementDefinitionId|string|false|true|Gets or sets the identifier of the corresponding entitlement definition.|
|EntitlementType|[EntitlementType](#schemaentitlementtype)|false|false|Gets or sets the EntitlementType.|
|LimitType|[LimitType](#schemalimittype)|false|false|Gets or sets the Limit type.|
|Value|int32|false|false|Gets or sets the value.|
|ManualBlockStatus|boolean|false|false|Gets or sets a value indicating whether or not there is a manual block.|

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

<h4>Enumerated Values</h4>

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

<h4>Enumerated Values</h4>

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

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Gets or sets the identifier.|
|CompanyName|string|false|true|Gets or sets the name of the company.|
|State|[TenantProvisioningState](#schematenantprovisioningstate)|false|false|Gets or sets the state.|
|Created|date-time|false|false|Gets or sets the date of tenant creation in database.|
|LastUpdated|date-time|false|false|Gets or sets the last updated.|
|Alias|string|false|true|Gets or sets the alias.|
|Features|[[FeatureState](#schemafeaturestate)]|false|true|Gets or sets the features.|
|ExternalAccountId|string|false|true|Gets or sets the external account identifier.|
|TenantType|string|false|true|Gets or sets tenant type.|

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
  "TenantType": "string"
}

```

---

### RegionBase

<a id="schemaregionbase"></a>
<a id="schema_RegionBase"></a>
<a id="tocSregionbase"></a>
<a id="tocsregionbase"></a>

Represents a region within an environment for customers to see.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Gets or sets the identifier.|
|Name|string|false|true|Gets or sets the name.|
|AdministrativeEndpointsWritable|boolean|false|false|Gets or sets a value indicating whether administrative endpoints are writable in a region.|
|BaseAddress|string|false|true|Gets or sets the base address.|

```json
{
  "Id": "string",
  "Name": "string",
  "AdministrativeEndpointsWritable": true,
  "BaseAddress": "string"
}

```

---

