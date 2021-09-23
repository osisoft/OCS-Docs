---
uid: omf-ingress-access-control

---

# Access Control

## `Get Subscriptions Access Control List`

<a id="opIdSubscriptionsAccessControlList_Get Subscriptions Access Control List"></a>

Gets the `AccessControlList` for the `Subscription` collection.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/subscriptions
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The `AccessControlList`|

#### Example response body
> 200 Response

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

## `Update Subscriptions Access Control List`

<a id="opIdSubscriptionsAccessControlList_Update Subscriptions Access Control List"></a>

Updates the `AccessControlList` for the `Subscription` collection.

### Request
```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/subscriptions
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>

### Request Body

The updated `AccessControlList`.<br/>

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {},
      "AccessType": 0,
      "AccessRights": 0
    }
  ]
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The updated `AccessControlList`.|

#### Example response body
> 200 Response

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

# Access Control

## `Get Topics Access Control List`

<a id="opIdTopicsAccessControlList_Get Topics Access Control List"></a>

Gets the `AccessControlList` for the `Topic` collection.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/topics
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The `AccessControlList`.|

#### Example response body
> 200 Response

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

## `Update Topics Access Control List`

<a id="opIdTopicsAccessControlList_Update Topics Access Control List"></a>

Updates the `AccessControlList` for the `Topic` collection.

### Request
```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/topics
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>

### Request Body

The updated `AccessControlList`.<br/>

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {},
      "AccessType": 0,
      "AccessRights": 0
    }
  ]
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The updated `AccessControlList`.|

#### Example response body
> 200 Response

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

# Access Control

## `List Subscriptions Access Rights`

<a id="opIdSubscriptionsAccessRights_List Subscriptions Access Rights"></a>

Gets a list of the `CommonAccessRights` to the `Subscription` collection for the requesting `Identity`.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accessrights/subscriptions
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of `CommonAccessRights`.|

# Access Control

## `List Topics Access Rights`

<a id="opIdTopicsAccessRights_List Topics Access Rights"></a>

Gets a list of the `CommonAccessRights` to the `Topic` collection for the requesting `Identity`.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accessrights/topics
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of `CommonAccessRights`.|

# Access Control

## `Get Subscription Access Control List`

<a id="opIdSubscriptionAccessControlList_Get Subscription Access Control List"></a>

Gets the `AccessControlList` for the specified `Subscription`.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}/accesscontrol
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string subscriptionId`
<br/>Subscription identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The `AccessControlList`.|

#### Example response body
> 200 Response

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

## `Update Subscription Access Control List`

<a id="opIdSubscriptionAccessControlList_Update Subscription Access Control List"></a>

Updates the `AccessControlList` for the specified `Subscription`.

### Request
```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}/accesscontrol
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string subscriptionId`
<br/>Subscription identifier<br/><br/><br/>

### Request Body

The updated `AccessControlList`.<br/>

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {},
      "AccessType": 0,
      "AccessRights": 0
    }
  ]
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The updated `AccessControlList`.|

#### Example response body
> 200 Response

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

# Access Control

## `List Subscription Access Rights`

<a id="opIdSubscriptionAccessRights_List Subscription Access Rights"></a>

Gets a list of the `CommonAccessRights` to the specified `Subscription` for the requesting `Identity`.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}/accessrights
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string subscriptionId`
<br/>Subscription identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of `CommonAccessRights`.|

# Access Control

## `Get Subscription Owner`

<a id="opIdSubscriptionOwner_Get Subscription Owner"></a>

Gets the `Trustee` of the specified `Subscription`.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}/owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string subscriptionId`
<br/>Subscription identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|The `Trustee`.|

#### Example response body
> 200 Response

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

---

## `Update Subscription Owner`

<a id="opIdSubscriptionOwner_Update Subscription Owner"></a>

Updates the `Trustee` of the specified `Subscription`.

### Request
```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}/owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string subscriptionId`
<br/>Subscription identifier<br/><br/><br/>

### Request Body

The updated `Trustee`.<br/>

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|The updated `Trustee`.|

#### Example response body
> 200 Response

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

# Access Control

## `Get Topic Access Control List`

<a id="opIdTopicAccessControlList_Get Topic Access Control List"></a>

Gets the `AccessControlList` for the specified `Topic`.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/accesscontrol
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string topicId`
<br/>Topic identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The `AccessControlList`.|

#### Example response body
> 200 Response

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

## `Update Topic Access Control List`

<a id="opIdTopicAccessControlList_Update Topic Access Control List"></a>

Updates the `AccessControlList` for the specified `Topic`.

### Request
```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/accesscontrol
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string topicId`
<br/>Topic identifier<br/><br/><br/>

### Request Body

The updated `AccessControlList`.<br/>

```json
{
  "RoleTrusteeAccessControlEntries": [
    {
      "Trustee": {},
      "AccessType": 0,
      "AccessRights": 0
    }
  ]
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The updated `AccessControlList`.|

#### Example response body
> 200 Response

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

# Access Control

## `List Topic Access Rights`

<a id="opIdTopicAccessRights_List Topic Access Rights"></a>

Gets a list of the `CommonAccessRights` to the specified `Topic` for the requesting `Identity`.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/accessrights
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string topicId`
<br/>Topic identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of `CommonAccessRights`.|

# Access Control

## `Get Topic Owner`

<a id="opIdTopicOwner_Get Topic Owner"></a>

Gets the `Trustee` of the specified `Topic`.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string topicId`
<br/>Topic identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|The `Trustee`.|

#### Example response body
> 200 Response

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

---

## `Update Topic Owner`

<a id="opIdTopicOwner_Update Topic Owner"></a>

Updates the `Trustee` of the specified `Topic`.

### Request
```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/owner
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string topicId`
<br/>Topic identifier<br/><br/><br/>

### Request Body

The updated `Trustee`.<br/>

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|The updated `Trustee`.|

#### Example response body
> 200 Response

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
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

