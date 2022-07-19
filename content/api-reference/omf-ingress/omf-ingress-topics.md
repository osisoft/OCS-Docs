---
uid: omf-ingress-topics

---

# Topics

## `List Topics`

<a id="opIdTopics_List Topics"></a>

Gets a list of all `Topic` objects in the given namespace.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Topic](#schematopic)[]|A list of `Topic` objects|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

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

> 401 Response ([ErrorResponseBody](#schemaerrorresponsebody))

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

## `Create Topic`

<a id="opIdTopics_Create Topic"></a>

Creates a new `Topic` mapped to the specified `ClientIds`. A given `ClientId` may only be mapped to one `Topic` per namespace.

<h3>Request</h3>

```text 
POST /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>

<h4>Request Body</h4>

The `CreateTopic` object to create<br/>

```json
{
  "Name": "Topic name",
  "Description": "Topic description",
  "ClientIds": [
    "d6b178a4-0de5-4c30-8ba7-0a84751be854"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[Topic](#schematopic)|The created `Topic`|
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

## `Get Topic`

<a id="opIdTopics_Get Topic"></a>

Gets the specified `Topic`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string topicId`
<br/>Topic identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Topic](#schematopic)|The specified `Topic`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

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

> 401 Response ([ErrorResponseBody](#schemaerrorresponsebody))

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

## `Update Topic`

<a id="opIdTopics_Update Topic"></a>

Updates the `Name`, `Description`, and/or `ClientIds` for the specified `Topic`.

<h3>Request</h3>

```text 
PUT /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string topicId`
<br/>Topic identifier.<br/><br/>

<h4>Request Body</h4>

The `UpdateTopic` with the fields to update<br/>

```json
{
  "Name": "Topic name",
  "Description": "Topic description",
  "ClientIds": [
    "7f17ba9e-51cc-47c4-8df4-22e5e641e9a4"
  ]
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Topic](#schematopic)|The updated `Topic`|
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

## `Delete Topic`

<a id="opIdTopics_Delete Topic"></a>

Deletes the specified `Topic`. If the `Topic` has a `Subscription` mapped to it in the same tenant this call will delete the `Subscription` as well. If the `Subscription` is in a different tenant, it will disable the `Subscription`.

<h3>Request</h3>

```text 
DELETE /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string topicId`
<br/>Topic identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|[ErrorResponseBody](#schemaerrorresponsebody)|No content|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

> 204 Response ([ErrorResponseBody](#schemaerrorresponsebody))

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

# Topics

## `List Topic Subscriptions`

<a id="opIdTopicSubscriptions_List Topic Subscriptions"></a>

Gets a list of `Subscription` objects mapped to the specified `Topic`.

<h3>Request</h3>

```text 
GET /api/v1/tenants/{tenantId}/namespaces/{namespaceId}/topics/{topicId}/subscriptions
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>`string namespaceId`
<br/>Namespace identifier.<br/><br/>`string topicId`
<br/>Topic identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Subscription](#schemasubscription)[]|A list of `Subscription` objects mapped to the `Topic`|
|401|[ErrorResponseBody](#schemaerrorresponsebody)|Unauthorized|
|403|[ErrorResponseBody](#schemaerrorresponsebody)|Forbidden|
|404|[ErrorResponseBody](#schemaerrorresponsebody)|Resource not found|
|408|[ErrorResponseBody](#schemaerrorresponsebody)|Request timeout|
|500|[ErrorResponseBody](#schemaerrorresponsebody)|Internal server error|
|503|[ErrorResponseBody](#schemaerrorresponsebody)|Service unavailable|
|504|[ErrorResponseBody](#schemaerrorresponsebody)|Gateway timeout|

<h4>Example response body</h4>

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

> 401 Response ([ErrorResponseBody](#schemaerrorresponsebody))

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

### Topic

<a id="schematopic"></a>
<a id="schema_Topic"></a>
<a id="tocStopic"></a>
<a id="tocstopic"></a>

Object returned from `Topic` routes.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Server-generated unique identifier.|
|Name|string|false|true|User-specified name. Limit 200 characters.|
|Description|string|false|true|A description. Limit 1000 characters.|
|CreatedDate|date-time|false|false|Server-generated creation timestamp (UTC).|
|ClientIds|string[]|false|true|List of `Client` identifiers. Data sent by these clients will be sent to this `Topic`. Limit 10000 `Client` identifiers.|

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

### CreateTopic

<a id="schemacreatetopic"></a>
<a id="schema_CreateTopic"></a>
<a id="tocScreatetopic"></a>
<a id="tocscreatetopic"></a>

Object used to create a `Topic`.

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|User-specified name. Limit 200 characters.|
|Description|string|false|true|A description. Limit 1000 characters.|
|ClientIds|string[]|true|false|List of `Client` identifiers. Data sent by these clients will be sent to this `Topic`. Limit 10000 `Client` identifiers.|

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

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|true|false|User-specified name. Limit 200 characters.|
|Description|string|false|true|A description. Limit 1000 characters.|
|ClientIds|string[]|true|false|List of `Client` identifiers. Data sent by these clients will be sent to this `Topic`. Limit 10000 `Client` identifiers.|

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

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Server-generated unique identifier.|
|Name|string|false|true|User-specified name. Limit 200 characters.|
|TopicId|string|false|true|The `Topic` identifier that this `Subscription` will read data from.|
|TopicTenantId|string|false|true|The `Topic` tenant identifier.|
|TopicNamespaceId|string|false|true|The `Topic` namespace identifier.|
|TenantId|string|false|true|Tenant identifier.|
|NamespaceId|string|false|true|Namespace identifier.|
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

