---
uid: community-communities

---

# Communities
A community is an organizational entity that facilitates data sharing across multiple tenants.

## `List Communities a Tenant is Joined to`

<a id="opIdCommunities_List Communities a Tenant is Joined to"></a>

Gets all communities a tenant is joined to.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/Communities
?query={query}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Owning tenant identifier<br/><br/>
`[optional] string query`
<br/>(not supported) Search string identifier<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve. If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Community](#schemacommunity)[]|Returns the current communities for the tenant. This is a set of objects of type `Community`.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|None|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

<h4>Example response body</h4>

> 200 Response ([Community](#schemacommunity)[])

```json
[
  {
    "Id": "string",
    "MemberRoleId": "string",
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
        "ClientCount": 0,
        "AccessControlList": "string",
        "ResourceOwner": "string"
      }
    ],
    "DateCreated": "2019-08-24T14:15:22Z",
    "AccessControlList": "string",
    "ResourceOwner": "string",
    "CommunityRoles": [
      {
        "Id": "string",
        "Name": "string",
        "Description": "string",
        "RoleScope": 0,
        "TenantId": "string",
        "CommunityId": "string",
        "RoleTypeId": "string"
      }
    ]
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Member</li>
</ul>

---

## `Create a New Community`

<a id="opIdCommunities_Create a New Community"></a>

Creates a new community within a specific tenant. The tenant sending this request will be assigned ownership of the community. The calling user or client will be granted community administrator and member roles for the community.

<h3>Request</h3>

```text 
POST /api/v1-preview/tenants/{tenantId}/Communities
```

<h4>Parameters</h4>

`string tenantId`
<br/>Owning tenant identifier<br/><br/>

<h4>Request Body</h4>

Community information to create<br/>

```json
{
  "Name": "string",
  "Description": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[Community](#schemacommunity)|Returns the created community of type `Community`.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|409|[ErrorResponse](#schemaerrorresponse)|None|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

<h4>Example response body</h4>

> 201 Response ([Community](#schemacommunity))

```json
{
  "Id": "string",
  "MemberRoleId": "string",
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
      "ClientCount": 0,
      "AccessControlList": "string",
      "ResourceOwner": "string"
    }
  ],
  "DateCreated": "2019-08-24T14:15:22Z",
  "AccessControlList": "string",
  "ResourceOwner": "string",
  "CommunityRoles": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "RoleScope": 0,
      "TenantId": "string",
      "CommunityId": "string",
      "RoleTypeId": "string"
    }
  ]
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get a Community by Id`

<a id="opIdCommunities_Get a Community by Id"></a>

Gets a community and related information by Id.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/Communities/{communityId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Owning tenant identifier<br/><br/>`string communityId`
<br/>Community id<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[Community](#schemacommunity)|Returns the current communities for the tenant. This is a set of objects of type `Community`.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|None|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

<h4>Example response body</h4>

> 200 Response ([Community](#schemacommunity))

```json
{
  "Id": "string",
  "MemberRoleId": "string",
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
      "ClientCount": 0,
      "AccessControlList": "string",
      "ResourceOwner": "string"
    }
  ],
  "DateCreated": "2019-08-24T14:15:22Z",
  "AccessControlList": "string",
  "ResourceOwner": "string",
  "CommunityRoles": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "RoleScope": 0,
      "TenantId": "string",
      "CommunityId": "string",
      "RoleTypeId": "string"
    }
  ]
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Member</li>
</ul>

---

## `Update Community Info`

<a id="opIdCommunities_Update Community Info"></a>

Updates attributes of a community such as name and description.

<h3>Request</h3>

```text 
PUT /api/v1-preview/tenants/{tenantId}/Communities/{communityId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Owning tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>

<h4>Request Body</h4>

The community object that contains the attributes to use for the update.<br/>

```json
{
  "Name": "string",
  "Description": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Success. The community tenant was updated.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested community tenant was not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Administrator</li>
</ul>

---

## `Delete a Community`

<a id="opIdCommunities_Delete a Community"></a>

Deletes a community by Id.

<h3>Request</h3>

```text 
DELETE /api/v1-preview/tenants/{tenantId}/Communities/{communityId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Owning tenant identifier<br/><br/>`string communityId`
<br/>The id of the community to delete.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No Content. The community was successfully deleted.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The community was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Administrator</li>
</ul>

---

## `Get Community Access Rights`

<a id="opIdCommunities_Get Community Access Rights"></a>

Get the effective access rights for a community resource.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/Communities/{communityId}/accessrights
```

<h4>Parameters</h4>

`string tenantId`
<br/>Owning Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|An enumerable of all allowed Access Rights for a Community resource.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested community tenant was not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

---

## `Get Community Access Control List`

<a id="opIdCommunities_Get Community Access Control List"></a>

Get the access control list for a community resource.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/Communities/{communityId}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Owning tenant identifier.<br/><br/>`string communityId`
<br/>Community identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|The AccessControlList of a Community resource.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested community tenant was not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

---

## `Update Community Access Control List`

<a id="opIdCommunities_Update Community Access Control List"></a>

Update the access control list for a community resource.

<h3>Request</h3>

```text 
PUT /api/v1-preview/tenants/{tenantId}/Communities/{communityId}/accesscontrol
```

<h4>Parameters</h4>

`string tenantId`
<br/>Owning tenant identifier.<br/><br/>`string communityId`
<br/>Community identifier.<br/><br/>

<h4>Request Body</h4>

The new AccessControlList to update the current entry with<br/>

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
|204|None|Success.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested community tenant was not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

---

## `Get Community Owner`

<a id="opIdCommunities_Get Community Owner"></a>

Get the resource owner for a community resource.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/Communities/{communityId}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Owning tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|The Resource Owner of a Community resource.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested community tenant was not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

---

## `Update Community Owner`

<a id="opIdCommunities_Update Community Owner"></a>

Update the resource owner for a community resource.

<h3>Request</h3>

```text 
PUT /api/v1-preview/tenants/{tenantId}/Communities/{communityId}/owner
```

<h4>Parameters</h4>

`string tenantId`
<br/>Owning Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>`any newTrustee`
<br/>Input Trustee<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|Success. Community Resource Owner is updated.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested community tenant was not found.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

---
## Definitions

### Community

<a id="schemacommunity"></a>
<a id="schema_Community"></a>
<a id="tocScommunity"></a>
<a id="tocscommunity"></a>

The Community object

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|Community identifier|
|MemberRoleId|guid|false|false|Community member role identifier|
|Name|string|false|true|Community name|
|Alias|string|false|true|Requesting tenant's alias for the community|
|Description|string|false|true|Community description|
|Tenants|[[CommunityTenant](#schemacommunitytenant)]|false|true|List of CommunityTenant that are in the community|
|DateCreated|date-time|false|true|Date community was created|
|AccessControlList|string|false|true|Access Control List for a Community resource.|
|ResourceOwner|string|false|true|The ResourceOwner for a Community resource.|
|CommunityRoles|[[Role](#schemarole)]|false|true|The list of community roles for this community.|

```json
{
  "Id": "string",
  "MemberRoleId": "string",
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
      "ClientCount": 0,
      "AccessControlList": "string",
      "ResourceOwner": "string"
    }
  ],
  "DateCreated": "2019-08-24T14:15:22Z",
  "AccessControlList": "string",
  "ResourceOwner": "string",
  "CommunityRoles": [
    {
      "Id": "string",
      "Name": "string",
      "Description": "string",
      "RoleScope": 0,
      "TenantId": "string",
      "CommunityId": "string",
      "RoleTypeId": "string"
    }
  ]
}

```

---

### CommunityTenant

<a id="schemacommunitytenant"></a>
<a id="schema_CommunityTenant"></a>
<a id="tocScommunitytenant"></a>
<a id="tocscommunitytenant"></a>

The CommunityTenant object

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|Tenant Id|
|Name|string|false|true|Tenant name|
|Status|[CommunityTenantStatus](#schemacommunitytenantstatus)|false|false|CommunityTenant status in a community|
|IsOwner|boolean|false|false|Boolean indicating whether the CommunityTenant is the owner of the community|
|UserCount|integer|false|false|Summary count of the users authorized to access the community within the tenant|
|ClientCount|integer|false|false|Summary count of the clients authorized to access the community within the tenant|
|AccessControlList|string|false|true|Access Control List for a CommunityTenant resource.|
|ResourceOwner|string|false|true|The ResourceOwner for a CommunityTenant resource.|

```json
{
  "Id": "string",
  "Name": "string",
  "Status": "None",
  "IsOwner": true,
  "UserCount": 0,
  "ClientCount": 0,
  "AccessControlList": "string",
  "ResourceOwner": "string"
}

```

---

### CommunityTenantStatus

<a id="schemacommunitytenantstatus"></a>
<a id="schema_CommunityTenantStatus"></a>
<a id="tocScommunitytenantstatus"></a>
<a id="tocscommunitytenantstatus"></a>

Represents a status of a community tenant

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|None|None|
|AwaitingConfirmation|AwaitingConfirmation|
|Paused|Paused|
|Active|Active|
|Remove|Remove|

---

### Role

<a id="schemarole"></a>
<a id="schema_Role"></a>
<a id="tocSrole"></a>
<a id="tocsrole"></a>

Object for retrieving a role

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Role identifier. Generated by the server upon creation.|
|Name|string|false|true|Role name. This cannot be empty.|
|Description|string|false|true|Role description|
|RoleScope|[RoleScope](#schemarolescope)|false|true|Role scope|
|TenantId|string|false|true|Tenant identifier, if this is a Tenant Role. Otherwise, set to null.|
|CommunityId|string|false|true|Community identifier, if this is a Community Role. Otherwise set to null.|
|RoleTypeId|string|false|true|Role type identifier for built-in roles|

```json
{
  "Id": "string",
  "Name": "string",
  "Description": "string",
  "RoleScope": 0,
  "TenantId": "string",
  "CommunityId": "string",
  "RoleTypeId": "string"
}

```

---

### RoleScope

<a id="schemarolescope"></a>
<a id="schema_RoleScope"></a>
<a id="tocSrolescope"></a>
<a id="tocsrolescope"></a>

The object that represents the scope of a given role

<h4>Enumerated Values</h4>

|Property|Value|
|---|---|
|None|0|
|Tenant|1|
|Community|2|
|Cluster|3|

---

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

Object returned whenever there is an error

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|true|false|Operation identifier of action that caused the error|
|Error|string|true|false|Error description|
|Reason|string|true|false|Reason for the error|
|Resolution|string|true|false|Resolution to resolve the error|
|DynamicProperties|object|false|true|Additional properties|

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

### CreateCommunityInput

<a id="schemacreatecommunityinput"></a>
<a id="schema_CreateCommunityInput"></a>
<a id="tocScreatecommunityinput"></a>
<a id="tocscreatecommunityinput"></a>

The CreateCommunityInput object. This is the model input for creating a community.

<h4>Properties</h4>

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

### UpdateCommunityInput

<a id="schemaupdatecommunityinput"></a>
<a id="schema_UpdateCommunityInput"></a>
<a id="tocSupdatecommunityinput"></a>
<a id="tocsupdatecommunityinput"></a>

The UpdateCommunityInput object

<h4>Properties</h4>

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

