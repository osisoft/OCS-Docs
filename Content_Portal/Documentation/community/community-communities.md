---
title: community/community-communities v20210426.5
language_tabs: []
toc_footers: []
includes: []
search: true
code_clipboard: true
highlight_theme: darkula
headingLevel: 2
generator: osisoft.widdershins v1.0.7

---

# Communities
A community is an organizational entity that facilitates data sharing across multiple tenants.

## `List Communities a Tenant is Joined to`

<a id="opIdCommunities_List Communities a Tenant is Joined to"></a>

Gets all communities a tenant is joined to.

### Request
```text 
GET /api/v1-preview/tenants/{tenantId}/Communities
?query={query}&skip={skip}&count={count}
```

#### Parameters

`string tenantId`
<br/>Owning tenant identifier<br/><br/>
`[optional] string query`
<br/>(not supported) Search string identifier<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve. If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Community](#schemacommunity)[]|Returns the current communities for the tenant. This is a set of objects of type `Community`.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|None|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

#### Example response body
> 200 Response

```json
[
  {
    "Id": "string",
    "Name": "string",
    "Alias": "string",
    "Description": "string",
    "Tenants": [
      {
        "Id": "string",
        "Name": "string",
        "Status": "None",
        "IsOwner": true,
        "UserCount": 0,
        "ClientCount": 0
      }
    ],
    "DateCreated": "2019-08-24T14:15:22Z",
    "StreamsContributedCount": 0,
    "TotalStreamsContributedCount": 0
  }
]
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Create a New Community`

<a id="opIdCommunities_Create a New Community"></a>

Creates a new community within a specific tenant. The tenant sending this request will be assigned ownership of the community. The calling user or client will be granted community administrator and member roles for the community.

### Request
```text 
POST /api/v1-preview/tenants/{tenantId}/Communities
```

#### Parameters

`string tenantId`
<br/>Owning tenant identifier<br/><br/>

### Request Body

Community information to create<br/>

```json
{
  "Name": "string",
  "Description": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|201|[Community](#schemacommunity)|Returns the created community of type `Community`.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|409|[ErrorResponse](#schemaerrorresponse)|None|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

#### Example response body
> 201 Response

```json
{
  "Id": "string",
  "Name": "string",
  "Alias": "string",
  "Description": "string",
  "Tenants": [
    {
      "Id": "string",
      "Name": "string",
      "Status": "None",
      "IsOwner": true,
      "UserCount": 0,
      "ClientCount": 0
    }
  ],
  "DateCreated": "2019-08-24T14:15:22Z",
  "StreamsContributedCount": 0,
  "TotalStreamsContributedCount": 0
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get a Community by Id`

<a id="opIdCommunities_Get a Community by Id"></a>

Gets a community and related information by Id.

### Request
```text 
GET /api/v1-preview/tenants/{tenantId}/Communities/{communityId}
```

#### Parameters

`string tenantId`
<br/>Owning tenant identifier<br/><br/>`string communityId`
<br/>Community id<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|[Community](#schemacommunity)|Returns the current communities for the tenant. This is a set of objects of type `Community`.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|None|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

#### Example response body
> 200 Response

```json
{
  "Id": "string",
  "Name": "string",
  "Alias": "string",
  "Description": "string",
  "Tenants": [
    {
      "Id": "string",
      "Name": "string",
      "Status": "None",
      "IsOwner": true,
      "UserCount": 0,
      "ClientCount": 0
    }
  ],
  "DateCreated": "2019-08-24T14:15:22Z",
  "StreamsContributedCount": 0,
  "TotalStreamsContributedCount": 0
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Community Member</li>
</ul>

---

## `Update Community Info`

<a id="opIdCommunities_Update Community Info"></a>

Updates attributes of a community such as name and description.

### Request
```text 
PUT /api/v1-preview/tenants/{tenantId}/Communities/{communityId}
```

#### Parameters

`string tenantId`
<br/>Owning tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>

### Request Body

The community object that contains the attributes to use for the update.<br/>

```json
{
  "Name": "string",
  "Description": "string"
}
```

### Response

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Success. The community tenant was updated.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested community tenant was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

#### Example response body
> 400 Response

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "DynamicProperties": {
    "property1": null,
    "property2": null
  },
  "property1": null,
  "property2": null
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Community Administrator</li>
</ul>

---

## `Delete a Community`

<a id="opIdCommunities_Delete a Community"></a>

Deletes a community by Id.

### Request
```text 
DELETE /api/v1-preview/tenants/{tenantId}/Communities/{communityId}
```

#### Parameters

`string tenantId`
<br/>Owning tenant identifier<br/><br/>`string communityId`
<br/>The id of the community to delete.<br/><br/>

### Response

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No Content. The community was successfully deleted.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The community was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

#### Example response body
> 400 Response

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "DynamicProperties": {
    "property1": null,
    "property2": null
  },
  "property1": null,
  "property2": null
}
```

### Authorization

Allowed for these roles: 
<ul>
<li>Community Administrator</li>
</ul>

---
# Definitions

## Community

<a id="schemacommunity"></a>
<a id="schema_Community"></a>
<a id="tocScommunity"></a>
<a id="tocscommunity"></a>

The Community object

### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|Community identifier|
|Name|string|false|true|Community name|
|Alias|string|false|true|Requesting tenant's alias for the community|
|Description|string|false|true|Community description|
|Tenants|[[CommunityTenant](#schemacommunitytenant)]|false|true|List of CommunityTenant that are in the community|
|DateCreated|date-time|false|true|Date community was created|
|StreamsContributedCount|integer|false|false|Current tenant's view of how many streams it contributed|
|TotalStreamsContributedCount|integer|false|false|Total streams from all community tenants|

```json
{
  "Id": "string",
  "Name": "string",
  "Alias": "string",
  "Description": "string",
  "Tenants": [
    {
      "Id": "string",
      "Name": "string",
      "Status": "None",
      "IsOwner": true,
      "UserCount": 0,
      "ClientCount": 0
    }
  ],
  "DateCreated": "2019-08-24T14:15:22Z",
  "StreamsContributedCount": 0,
  "TotalStreamsContributedCount": 0
}

```

---

## CommunityTenant

<a id="schemacommunitytenant"></a>
<a id="schema_CommunityTenant"></a>
<a id="tocScommunitytenant"></a>
<a id="tocscommunitytenant"></a>

The CommunityTenant object

### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|Tenant Id|
|Name|string|false|true|Tenant name|
|Status|[CommunityTenantStatus](#schemacommunitytenantstatus)|false|false|CommunityTenant status in a community|
|IsOwner|boolean|false|false|Boolean indicating whether the CommunityTenant is the owner of the community|
|UserCount|integer|false|false|Summary count of the users authorized to access the community within the tenant|
|ClientCount|integer|false|false|Summary count of the clients authorized to access the community within the tenant|

```json
{
  "Id": "string",
  "Name": "string",
  "Status": "None",
  "IsOwner": true,
  "UserCount": 0,
  "ClientCount": 0
}

```

---

## CommunityTenantStatus

<a id="schemacommunitytenantstatus"></a>
<a id="schema_CommunityTenantStatus"></a>
<a id="tocScommunitytenantstatus"></a>
<a id="tocscommunitytenantstatus"></a>

Represents a status of a Community Tenant.

#### Enumerated Values

|Property|Value|
|---|---|
|None|None|
|AwaitingConfirmation|AwaitingConfirmation|
|Paused|Paused|
|Active|Active|
|Remove|Remove|

---

## ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

Object returned whenever there is an error

### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|true|false|Operation unique identifier of action that caused the error|
|Error|string|true|false|Error description|
|Reason|string|true|false|Reason for the error|
|Resolution|string|true|false|Resolution to resolve the error|
|DynamicProperties|object|false|true|Additional properties.|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "DynamicProperties": {
    "property1": null,
    "property2": null
  },
  "property1": null,
  "property2": null
}

```

---

## CreateCommunityInput

<a id="schemacreatecommunityinput"></a>
<a id="schema_CreateCommunityInput"></a>
<a id="tocScreatecommunityinput"></a>
<a id="tocscreatecommunityinput"></a>

The CreateCommunityInput object. This is the model input for creating a community.

### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|Name of the community to be created|
|Description|string|false|true|Description of the community|

```json
{
  "Name": "string",
  "Description": "string"
}

```

---

## UpdateCommunityInput

<a id="schemaupdatecommunityinput"></a>
<a id="schema_UpdateCommunityInput"></a>
<a id="tocSupdatecommunityinput"></a>
<a id="tocsupdatecommunityinput"></a>

The UpdateCommunityInput object

### Properties

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Name|string|false|true|Community name|
|Description|string|false|true|Community description|

```json
{
  "Name": "string",
  "Description": "string"
}

```

---

