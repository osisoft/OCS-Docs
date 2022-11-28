---
uid: omf-ingress-access-control

---

# Access Control

## `Get OMF Connection Access Control List`

<a id="opIdOmfConnectionAccessControlList_Get OMF Connection Access Control List"></a>

Gets the `AccessControlList` for the specified `OmfConnection`.

<h3>Request</h3>

```text 
GET /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/omfConnections/{omfConnectionId}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string omfConnectionId`
<br/>OMF connection identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The `AccessControlList`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

## `Update OMF Connection Access Control List`

<a id="opIdOmfConnectionAccessControlList_Update OMF Connection Access Control List"></a>

Updates the `AccessControlList` for the specified `OmfConnection`.

<h3>Request</h3>

```text 
PUT /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/omfConnections/{omfConnectionId}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string omfConnectionId`
<br/>OMF connection identifier.<br/><br/>

<h4>Request Body</h4>

The updated `AccessControlList`<br/>

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
|200|[AccessControlList](#schemaaccesscontrollist)|The updated `AccessControlList`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

# Access Control

## `List OMF Connection Access Rights`

<a id="opIdOmfConnectionAccessRights_List OMF Connection Access Rights"></a>

Gets a list of the `CommonAccessRights` to the specified `OmfConnection` for the requesting `Identity`.

<h3>Request</h3>

```text 
GET /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/omfConnections/{omfConnectionId}/accessrights
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string omfConnectionId`
<br/>OMF connection identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of `CommonAccessRights`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

# Access Control

## `Get OMF Connection Owner`

<a id="opIdOmfConnectionOwner_Get OMF Connection Owner"></a>

Gets the `Trustee` of the specified `OmfConnectionId`.

<h3>Request</h3>

```text 
GET /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/omfConnections/{omfConnectionId}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string omfConnectionId`
<br/>OMF connection identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|The `Trustee`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|

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

## `Update OMF Connection Owner`

<a id="opIdOmfConnectionOwner_Update OMF Connection Owner"></a>

Updates the `Trustee` of the specified `OmfConnection`.

<h3>Request</h3>

```text 
PUT /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/omfConnections/{omfConnectionId}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string omfConnectionId`
<br/>OMF connection identifier.<br/><br/>

<h4>Request Body</h4>

The updated `Trustee`<br/>

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
|200|[Trustee](#schematrustee)|The updated `Trustee`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Bad request|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

# Access Control

## `Get OMF Connections Access Control List`

<a id="opIdOmfConnectionsAccessControlList_Get OMF Connections Access Control List"></a>

Gets the `AccessControlList` for the `OmfConnection` collection.

<h3>Request</h3>

```text 
GET /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/omfConnections
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The `AccessControlList`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

## `Update OMF Connections Access Control List`

<a id="opIdOmfConnectionsAccessControlList_Update OMF Connections Access Control List"></a>

Updates the `AccessControlList` for the `OmfConnection` collection.

<h3>Request</h3>

```text 
PUT /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/omfConnections
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

The updated `AccessControlList`<br/>

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
|200|[AccessControlList](#schemaaccesscontrollist)|The updated `AccessControlList`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Bad request|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

# Access Control

## `List OMF Connections Access Rights`

<a id="opIdOmfConnectionsAccessRights_List OMF Connections Access Rights"></a>

Gets a list of the `CommonAccessRights` to the `OmfConnection` collection for the requesting `Identity`.

<h3>Request</h3>

```text 
GET /api/v2-preview/tenants/{tenantId}/namespaces/{namespaceId}/accessrights/omfConnections
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of `CommonAccessRights`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

# Access Control

## `Get Subscription Access Control List`

<a id="opIdSubscriptionAccessControlList_Get Subscription Access Control List"></a>

Gets the `AccessControlList` for the specified `Subscription`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string subscriptionId`
<br/>Subscription identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The `AccessControlList`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

## `Update Subscription Access Control List`

<a id="opIdSubscriptionAccessControlList_Update Subscription Access Control List"></a>

Updates the `AccessControlList` for the specified `Subscription`.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string subscriptionId`
<br/>Subscription identifier.<br/><br/>

<h4>Request Body</h4>

The updated `AccessControlList`<br/>

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
|200|[AccessControlList](#schemaaccesscontrollist)|The updated `AccessControlList`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Bad request|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

# Access Control

## `List Subscription Access Rights`

<a id="opIdSubscriptionAccessRights_List Subscription Access Rights"></a>

Gets a list of the `CommonAccessRights` to the specified `Subscription` for the requesting `Identity`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}/accessrights
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string subscriptionId`
<br/>Subscription identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of `CommonAccessRights`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

# Access Control

## `Get Subscription Owner`

<a id="opIdSubscriptionOwner_Get Subscription Owner"></a>

Gets the `Trustee` of the specified `Subscription`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string subscriptionId`
<br/>Subscription identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|The `Trustee`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

## `Update Subscription Owner`

<a id="opIdSubscriptionOwner_Update Subscription Owner"></a>

Updates the `Trustee` of the specified `Subscription`.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string subscriptionId`
<br/>Subscription identifier.<br/><br/>

<h4>Request Body</h4>

The updated `Trustee`<br/>

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
|200|[Trustee](#schematrustee)|The updated `Trustee`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Bad request|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

# Access Control

## `Get Subscriptions Access Control List`

<a id="opIdSubscriptionsAccessControlList_Get Subscriptions Access Control List"></a>

Gets the `AccessControlList` for the `Subscription` collection.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/subscriptions
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The `AccessControlList`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

## `Update Subscriptions Access Control List`

<a id="opIdSubscriptionsAccessControlList_Update Subscriptions Access Control List"></a>

Updates the `AccessControlList` for the `Subscription` collection.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/subscriptions
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

The updated `AccessControlList`<br/>

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
|200|[AccessControlList](#schemaaccesscontrollist)|The updated `AccessControlList`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Bad request|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

# Access Control

## `List Subscriptions Access Rights`

<a id="opIdSubscriptionsAccessRights_List Subscriptions Access Rights"></a>

Gets a list of the `CommonAccessRights` to the `Subscription` collection for the requesting `Identity`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accessrights/subscriptions
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of `CommonAccessRights`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

# Access Control

## `Get Topic Access Control List`

<a id="opIdTopicAccessControlList_Get Topic Access Control List"></a>

Gets the `AccessControlList` for the specified `Topic`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string topicId`
<br/>Topic identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The `AccessControlList`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

## `Update Topic Access Control List`

<a id="opIdTopicAccessControlList_Update Topic Access Control List"></a>

Updates the `AccessControlList` for the specified `Topic`.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string topicId`
<br/>Topic identifier.<br/><br/>

<h4>Request Body</h4>

The updated `AccessControlList`<br/>

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
|200|[AccessControlList](#schemaaccesscontrollist)|The updated `AccessControlList`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

# Access Control

## `List Topic Access Rights`

<a id="opIdTopicAccessRights_List Topic Access Rights"></a>

Gets a list of the `CommonAccessRights` to the specified `Topic` for the requesting `Identity`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/accessrights
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string topicId`
<br/>Topic identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of `CommonAccessRights`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

# Access Control

## `Get Topic Owner`

<a id="opIdTopicOwner_Get Topic Owner"></a>

Gets the `Trustee` of the specified `Topic`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string topicId`
<br/>Topic identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Trustee](#schematrustee)|The `Trustee`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|

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

## `Update Topic Owner`

<a id="opIdTopicOwner_Update Topic Owner"></a>

Updates the `Trustee` of the specified `Topic`.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string topicId`
<br/>Topic identifier.<br/><br/>

<h4>Request Body</h4>

The updated `Trustee`<br/>

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
|200|[Trustee](#schematrustee)|The updated `Trustee`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Bad request|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

> 200 Response ([Trustee](#schematrustee))

```json
{
  "Type": 1,
  "ObjectId": "string",
  "TenantId": "string"
}
```

# Access Control

## `Get Topics Access Control List`

<a id="opIdTopicsAccessControlList_Get Topics Access Control List"></a>

Gets the `AccessControlList` for the `Topic` collection.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/topics
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AccessControlList](#schemaaccesscontrollist)|The `AccessControlList`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

## `Update Topics Access Control List`

<a id="opIdTopicsAccessControlList_Update Topics Access Control List"></a>

Updates the `AccessControlList` for the `Topic` collection.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/topics
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

The updated `AccessControlList`<br/>

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
|200|[AccessControlList](#schemaaccesscontrollist)|The updated `AccessControlList`|
|400|[ErrorResponseBody](#schemaerrorresponsebody)|Bad request|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|415|[ErrorResponseBody](#schemaerrorresponsebody)|Unsupported media type|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

# Access Control

## `List Topics Access Rights`

<a id="opIdTopicsAccessRights_List Topics Access Rights"></a>

Gets a list of the `CommonAccessRights` to the `Topic` collection for the requesting `Identity`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/accessrights/topics
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|Inline|A list of `CommonAccessRights`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

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

### ErrorResponseBody

<a id="schemaerrorresponsebody"></a>
<a id="schema_ErrorResponseBody"></a>
<a id="tocSerrorresponsebody"></a>
<a id="tocserrorresponsebody"></a>

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|false|true|None|
|Error|string|false|true|None|
|Reason|string|false|true|None|
|Resolution|string|false|true|None|
|Parameters|object|false|true|None|

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

