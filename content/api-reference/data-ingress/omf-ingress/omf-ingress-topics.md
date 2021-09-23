---
uid: omf-ingress-topics

---

# Topics

## `List Topics`

<a id="opIdTopics_List Topics"></a>

Lists all `Topic` objects in the given namespace.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Topic](#schematopic)[]|A list of `Topic` objects.|

#### Example response body
> 200 Response

```json
[
  {
    "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
    "Name": "Topic name",
    "Description": "Topic description",
    "CreatedDate": "2021-03-18T23:57:44.6109361Z",
    "ClientIds": [
      "d6b178a4-0de5-4c30-8ba7-0a84751be854"
    ]
  },
  {
    "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
    "Name": "Topic name",
    "Description": "Topic description",
    "CreatedDate": "2021-03-18T23:57:44.6109361Z",
    "ClientIds": [
      "d6b178a4-0de5-4c30-8ba7-0a84751be854"
    ]
  }
]
```

---

## `Create Topic`

<a id="opIdTopics_Create Topic"></a>

Creates a new `Topic` mapped to the specified `ClientIds`. A given `ClientId` may only be mapped to one `Topic` per namespace.

### Request
```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>

### Request Body

The `CreateTopic` object to create.<br/>

```json
{
  "Name": "Topic name",
  "Description": "Topic description",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[Topic](#schematopic)|The created `Topic`.|

#### Example response body
> 201 Response

```json
{
  "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
  "Name": "Topic name",
  "Description": "Topic description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
}
```

---

## `Get Topic`

<a id="opIdTopics_Get Topic"></a>

Gets the specified `Topic`.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string topicId`
<br/>Topic identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Topic](#schematopic)|The specified `Topic`.|

#### Example response body
> 200 Response

```json
{
  "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
  "Name": "Topic name",
  "Description": "Topic description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
}
```

---

## `Update Topic`

<a id="opIdTopics_Update Topic"></a>

Updates the `Name`, `Description`, and/or `ClientIds` for the specified `Topic`.

### Request
```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string topicId`
<br/>Topic identifier<br/><br/><br/>

### Request Body

The `UpdateTopic` with the fields to update.<br/>

```json
{
  "Name": "Topic name",
  "Description": "Topic description",
  "ClientIds": [
    "7f17ba9e-51cc-47c4-8df4-22e5e641e9a4"
  ]
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Topic](#schematopic)|The updated `Topic`.|

#### Example response body
> 200 Response

```json
{
  "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
  "Name": "Topic name",
  "Description": "Topic description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
}
```

---

## `Delete Topic`

<a id="opIdTopics_Delete Topic"></a>

Deletes the specified `Topic`. If the `Topic` has a `Subscription` mapped to it in the same tenant this call will delete the `Subscription` as well. If the `Subscription` is in a different tenant, it will disable the `Subscription`.

### Request
```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string topicId`
<br/>Topic identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content.|

# Topics

## `List Topic Subscriptions`

<a id="opIdTopicSubscriptions_List Topic Subscriptions"></a>

Gets a list of `Subscription` objects mapped to the specified `Topic`.

### Request
```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/subscriptions
```

#### Parameters

`string tenantId`
<br/>Tenant identifier<br/><br/><br/>`string namespaceId`
<br/>Namespace identifier<br/><br/><br/>`string topicId`
<br/>Topic identifier<br/><br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Subscription](#schemasubscription)[]|A list of `Subscription` objects mapped to the `Topic`.|

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
## Definitions

### Topic

<a id="schematopic"></a>
<a id="schema_Topic"></a>
<a id="tocStopic"></a>
<a id="tocstopic"></a>

Object returned from `Topic` routes.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Server-generated unique identifier.|
|Name|string|false|true|User-specified name. Limit 200 characters.|
|Description|string|false|true|A description. Limit 1000 characters.|
|CreatedDate|date-time|false|false|Server-generated creation timestamp (UTC).|
|ClientIds|string[]|false|true|List of `Client` identifiers. Data sent by these clients will be sent to this `Topic`.|

```json
{
  "Id": "009d8600-fb20-4a6a-8368-e74863a83c4c",
  "Name": "Topic name",
  "Description": "Topic description",
  "CreatedDate": "2021-03-18T23:57:44.6109361Z",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
}

```

---

### CreateTopic

<a id="schemacreatetopic"></a>
<a id="schema_CreateTopic"></a>
<a id="tocScreatetopic"></a>
<a id="tocscreatetopic"></a>

Object used to create a `Topic`.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|User-specified name. Limit 200 characters.|
|Description|string|false|true|A description. Limit 1000 characters.|
|ClientIds|string[]|true|false|List of `Client` identifiers. Data sent by these clients will be sent to this `Topic`.|

```json
{
  "Name": "Topic name",
  "Description": "Topic description",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
}

```

---

### UpdateTopic

<a id="schemaupdatetopic"></a>
<a id="schema_UpdateTopic"></a>
<a id="tocSupdatetopic"></a>
<a id="tocsupdatetopic"></a>

Object used to update a `Topic`.

#### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|true|false|User-specified name. Limit 200 characters.|
|Description|string|false|true|A description. Limit 1000 characters.|
|ClientIds|string[]|true|false|List of `Client` identifiers. Data sent by these clients will be sent to this `Topic`.|

```json
{
  "Name": "Topic name",
  "Description": "Topic description",
  "ClientIds": [
    "7f17ba9e-51cc-47c4-8df4-22e5e641e9a4"
  ]
}

```

---

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

