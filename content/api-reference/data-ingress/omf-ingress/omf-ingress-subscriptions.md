---
uid: omf-ingress-subscriptions

---

# Subscriptions

## `List Subscriptions`

<a id="opIdSubscriptions_List Subscriptions"></a>

Lists all `Subscription` objects in the given namespace.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Subscription](#schemasubscription)[]|A list of `Subscription` objects.|

#### Example response body
> 200 Response

```json
[
  {
    "Id": "e78e0fcb-39a1-41a6-b11e-e8afe6941873",
    "Name": "Subscription name",
    "TopicId": "f1cdbdd6-bb1a-4b7c-acbb-692dba7455f6",
    "TopicTenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
    "TopicNamespaceId": "topicNamespaceId",
    "TenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
    "NamespaceId": "subscriptionNamespaceId",
    "Description": "Subscription description",
    "CreatedDate": "2021-03-18T23:57:44.6109361Z",
    "Enabled": true
  },
  {
    "Id": "e78e0fcb-39a1-41a6-b11e-e8afe6941873",
    "Name": "Subscription name",
    "TopicId": "f1cdbdd6-bb1a-4b7c-acbb-692dba7455f6",
    "TopicTenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
    "TopicNamespaceId": "topicNamespaceId",
    "TenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
    "NamespaceId": "subscriptionNamespaceId",
    "Description": "Subscription description",
    "CreatedDate": "2021-03-18T23:57:44.6109361Z",
    "Enabled": true
  }
]
```

---

## `Create Subscription`

<a id="opIdSubscriptions_Create Subscription"></a>

Creates a new `Subscription` which reads data from the specified `Topic` and writes data to the Sequential Data Store in the specified namespace.

### Request
```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>

### Request Body

The `CreateSubscription` object to create.<br/>

```json
{
  "Name": "Subscription name",
  "Description": "Subscription description",
  "TopicId": "5edb1b19-706b-4678-9c30-3f5b1281b050",
  "TopicTenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
  "TopicNamespaceId": "topicNamespaceId"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[Subscription](#schemasubscription)|The created `Subscription`.|

#### Example response body
> 201 Response

```json
{
  "Id": "e78e0fcb-39a1-41a6-b11e-e8afe6941873",
  "Name": "Subscription name",
  "TopicId": "f1cdbdd6-bb1a-4b7c-acbb-692dba7455f6",
  "TopicTenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
  "TopicNamespaceId": "topicNamespaceId",
  "TenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
  "NamespaceId": "subscriptionNamespaceId",
  "Description": "Subscription description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "Enabled": true
}
```

---

## `Get Subscription`

<a id="opIdSubscriptions_Get Subscription"></a>

Gets the specified `Subscription`.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string subscriptionId`
<br/>Subscription identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Subscription](#schemasubscription)|The specified `Subscription`.|

#### Example response body
> 200 Response

```json
{
  "Id": "e78e0fcb-39a1-41a6-b11e-e8afe6941873",
  "Name": "Subscription name",
  "TopicId": "f1cdbdd6-bb1a-4b7c-acbb-692dba7455f6",
  "TopicTenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
  "TopicNamespaceId": "topicNamespaceId",
  "TenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
  "NamespaceId": "subscriptionNamespaceId",
  "Description": "Subscription description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "Enabled": true
}
```

---

## `Update Subscription`

<a id="opIdSubscriptions_Update Subscription"></a>

Updates the `Name` and/or `Description` of the specified `Subscription`.

### Request
```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string subscriptionId`
<br/>Subscription identifier<br/><br/><br/>

### Request Body

The `UpdateSubscription` with the fields to update.<br/>

```json
{
  "Name": "Subscription name",
  "Description": "Subscription description"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Subscription](#schemasubscription)|The updated `Subscription`.|

#### Example response body
> 200 Response

```json
{
  "Id": "e78e0fcb-39a1-41a6-b11e-e8afe6941873",
  "Name": "Subscription name",
  "TopicId": "f1cdbdd6-bb1a-4b7c-acbb-692dba7455f6",
  "TopicTenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
  "TopicNamespaceId": "topicNamespaceId",
  "TenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
  "NamespaceId": "subscriptionNamespaceId",
  "Description": "Subscription description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "Enabled": true
}
```

---

## `Delete Subscription`

<a id="opIdSubscriptions_Delete Subscription"></a>

Deletes the specified `Subscription`.

### Request
```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/subscriptions/{subscriptionId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string subscriptionId`
<br/>Subscription identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|

---
## Definitions

### Subscription

<a id="schemasubscription"></a>
<a id="schema_Subscription"></a>
<a id="tocSsubscription"></a>
<a id="tocssubscription"></a>

Object returned from `Subscription` routes.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Server-generated unique identifier.|
|Name|string|false|true|User-specified name. Limit 200 characters.|
|TopicId|string|false|true|The `Topic` identifier that this `Subscription` will read data from.|
|TopicTenantId|string|false|true|The `Topic` tenant identifier.|
|TopicNamespaceId|string|false|true|The `Topic` namespace identifier.|
|TenantId|string|false|true|Tenant identifier<br/>|
|NamespaceId|string|false|true|Namespace identifier<br/>|
|Description|string|false|true|A description. Limit 1000 characters.|
|CreatedDate|date-time|false|false|Server-generated creation timestamp (UTC).|
|Enabled|boolean|false|false|Indicates if the `Subscription` is enabled. If set to `false` data sent to the specified `Topic` of this `Subscription` will not be written to the Sequential Data Store.|

```json
{
  "Id": "e78e0fcb-39a1-41a6-b11e-e8afe6941873",
  "Name": "Subscription name",
  "TopicId": "f1cdbdd6-bb1a-4b7c-acbb-692dba7455f6",
  "TopicTenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
  "TopicNamespaceId": "topicNamespaceId",
  "TenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
  "NamespaceId": "subscriptionNamespaceId",
  "Description": "Subscription description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "Enabled": true
}

```

---

### CreateSubscription

<a id="schemacreatesubscription"></a>
<a id="schema_CreateSubscription"></a>
<a id="tocScreatesubscription"></a>
<a id="tocscreatesubscription"></a>

Object used to create a `Subscription`.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|User-specified name. Limit 200 characters.|
|Description|string|false|true|A description. Limit 1000 characters.|
|TopicId|string|true|false|The `Topic` identifier that this `Subscription` will read data from.|
|TopicTenantId|string|true|false|The `Topic` tenant identifier.|
|TopicNamespaceId|string|true|false|The `Topic` namespace identifier.|

```json
{
  "Name": "Subscription name",
  "Description": "Subscription description",
  "TopicId": "5edb1b19-706b-4678-9c30-3f5b1281b050",
  "TopicTenantId": "7e2819b6-f38c-4449-b633-f64f7e9838f8",
  "TopicNamespaceId": "topicNamespaceId"
}

```

---

### UpdateSubscription

<a id="schemaupdatesubscription"></a>
<a id="schema_UpdateSubscription"></a>
<a id="tocSupdatesubscription"></a>
<a id="tocsupdatesubscription"></a>

Object used to update a `Subscription`.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|true|false|User-specified name. Limit 200 characters.|
|Description|string|false|true|A description. Limit 1000 characters.|

```json
{
  "Name": "Subscription name",
  "Description": "Subscription description"
}

```

---

