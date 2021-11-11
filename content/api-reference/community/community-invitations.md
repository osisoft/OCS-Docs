---
uid: community-invitations

---

# Invitations
Defines the public API methods that are used to manage community invitations. Using this API you can, for example, create, retrieve, update and process invitations. You can also resend an invitation email.

## `List a Community Invitation by Tenant and Community`

<a id="opIdCommunityInvitations_List a Community Invitation by Tenant and Community"></a>

Get invitations associated with a specific issuing tenant and community

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/communities/{communityId}/invitations
?query={query}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>The identifier of the tenant that issued invitations. The tenant must belong to the community.<br/><br/>`string communityId`
<br/>The identifier of the community to which the recipient of the invitation is being invited.<br/><br/>
`[optional] string query`
<br/>(not supported) Search string identifier<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve. If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[CommunityInvitation](#schemacommunityinvitation)[]|Set of Invitations (type `CommunityInvitation`) associated with the issuing tenant ( `tenantId`) and community ( `communityId`)|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested item was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

<h4>Example response body</h4>

> 200 Response ([CommunityInvitation](#schemacommunityinvitation)[])

```json
[
  {
    "Id": "string",
    "Issued": "2019-08-24T14:15:22Z",
    "Expires": "2019-08-24T14:15:22Z",
    "Accepted": "2019-08-24T14:15:22Z",
    "State": "None",
    "IssuingTenantId": "string",
    "InvitedTenantId": "string",
    "CommunityId": "string",
    "CommunityName": "string",
    "InvitationRecipient": "string",
    "AcceptedUserEmail": "string",
    "AcceptedTenantName": "string"
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Member</li>
</ul>

---

## `Create a Community Invitation`

<a id="opIdCommunityInvitations_Create a Community Invitation"></a>

Creates a community invitation for a specific community

<h3>Request</h3>

```text 
POST /api/v1-preview/tenants/{tenantId}/communities/{communityId}/invitations
```

<h4>Parameters</h4>

`string tenantId`
<br/>Owning tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>

<h4>Request Body</h4>

Invitation to create<br/>

```json
{
  "InvitationRecipient": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[CommunityInvitation](#schemacommunityinvitation)|Returns the created invitation of type `CommunityInvitation`|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested item was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

<h4>Example response body</h4>

> 201 Response ([CommunityInvitation](#schemacommunityinvitation))

```json
{
  "Id": "string",
  "Issued": "2019-08-24T14:15:22Z",
  "Expires": "2019-08-24T14:15:22Z",
  "Accepted": "2019-08-24T14:15:22Z",
  "State": "None",
  "IssuingTenantId": "string",
  "InvitedTenantId": "string",
  "CommunityId": "string",
  "CommunityName": "string",
  "InvitationRecipient": "string",
  "AcceptedUserEmail": "string",
  "AcceptedTenantName": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Administrator</li>
<li>Community Moderator</li>
</ul>

---

## `Get a Community Invitation by Tenant, Community, and Id`

<a id="opIdCommunityInvitations_Get a Community Invitation by Tenant, Community, and Id"></a>

Gets a community invitation by Id

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/communities/{communityId}/invitations/{invitationId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>`string invitationId`
<br/>Invitation identifier<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[CommunityInvitation](#schemacommunityinvitation)|Returns the invitation of type `CommunityInvitation`|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested item was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

<h4>Example response body</h4>

> 200 Response ([CommunityInvitation](#schemacommunityinvitation))

```json
{
  "Id": "string",
  "Issued": "2019-08-24T14:15:22Z",
  "Expires": "2019-08-24T14:15:22Z",
  "Accepted": "2019-08-24T14:15:22Z",
  "State": "None",
  "IssuingTenantId": "string",
  "InvitedTenantId": "string",
  "CommunityId": "string",
  "CommunityName": "string",
  "InvitationRecipient": "string",
  "AcceptedUserEmail": "string",
  "AcceptedTenantName": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Member</li>
</ul>

---

## `Delete a Community Invitation`

<a id="opIdCommunityInvitations_Delete a Community Invitation"></a>

Deletes a community invitation by invitation identifier

<h3>Request</h3>

```text 
DELETE /api/v1-preview/tenants/{tenantId}/communities/{communityId}/invitations/{invitationId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier<br/><br/>`string communityId`
<br/>Community identifier<br/><br/>`string invitationId`
<br/>Invitation identifier<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No Content. The invitation has been deleted.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested item was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Administrator</li>
<li>Tenant Administrator</li>
</ul>

---

## `Get details of an Invitation`

<a id="opIdCommunityInvitations_Get details of an Invitation"></a>

Gets details for a community invitation

<h3>Request</h3>

```text 
GET /api/v1-preview/communityinvitations/{invitationId}/details
```

<h4>Parameters</h4>

`string invitationId`
<br/>Invitation identifier<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[CommunityInvitationDetails](#schemacommunityinvitationdetails)|The `CommunityInvitationDetails`|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested item was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

<h4>Example response body</h4>

> 200 Response ([CommunityInvitationDetails](#schemacommunityinvitationdetails))

```json
{
  "CommunityName": "string",
  "CommunityId": "string",
  "InvitationState": "None"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Process a Community Invitation Based on the Requested Action`

<a id="opIdCommunityInvitations_Process a Community Invitation Based on the Requested Action"></a>

Processes an action against a particular community invitation. The available actions include accept, decline and resend.

<h3>Request</h3>

```text 
PUT /api/v1-preview/communityinvitations/{invitationId}
```

<h4>Parameters</h4>

`string invitationId`
<br/>Invitation identifier<br/><br/>

<h4>Request Body</h4>

Invitation action<br/>

```json
{
  "Action": "Accept"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Created. The invitation was processed.|
|202|None|Accepted. The invitation action was processed and the notification accepted.|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested item was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it doesn't know how to handle.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Community Administrator</li>
<li>Tenant Administrator</li>
</ul>

---

## `List Accepted Community Invitations by Tenant`

<a id="opIdCommunityInvitations_List Accepted Community Invitations by Tenant"></a>

Gets invitations associated with a specific invited tenant. Only invitations in the accepted state are returned. Using this method, you can identify the communities to which a tenant has been invited by means of the returned CommunityInvitation.CommunityId attribute.

<h3>Request</h3>

```text 
GET /api/v1-preview/tenants/{tenantId}/communityinvitations
?query={query}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier<br/><br/>
`[optional] string query`
<br/>(not supported) Search string identifier<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve. If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[CommunityInvitation](#schemacommunityinvitation)[]|Set of accepted invitations (type `CommunityInvitation`) associated with the issuing tenant ( `tenantId`)|
|400|[ErrorResponse](#schemaerrorresponse)|Bad Request. The server could not understand the request.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized. The client has not been authenticated.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden. The client does not have the required permissions to make the request.|
|404|[ErrorResponse](#schemaerrorresponse)|Not Found. The requested item was not found.|
|408|[ErrorResponse](#schemaerrorresponse)|Request Timeout. The request has timed out.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal Server Error. The server has encountered a situation it does not know how to handle.|

<h4>Example response body</h4>

> 200 Response ([CommunityInvitation](#schemacommunityinvitation)[])

```json
[
  {
    "Id": "string",
    "Issued": "2019-08-24T14:15:22Z",
    "Expires": "2019-08-24T14:15:22Z",
    "Accepted": "2019-08-24T14:15:22Z",
    "State": "None",
    "IssuingTenantId": "string",
    "InvitedTenantId": "string",
    "CommunityId": "string",
    "CommunityName": "string",
    "InvitationRecipient": "string",
    "AcceptedUserEmail": "string",
    "AcceptedTenantName": "string"
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---
## Definitions

### CommunityInvitation

<a id="schemacommunityinvitation"></a>
<a id="schema_CommunityInvitation"></a>
<a id="tocScommunityinvitation"></a>
<a id="tocscommunityinvitation"></a>

Representation of the community invitation

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|guid|false|false|Invitation identifier|
|Issued|date-time|false|false|Invitation issued timestamp|
|Expires|date-time|false|false|Invitation expiration timestamp|
|Accepted|date-time|false|true|Invitation accepted timestamp|
|State|[CommunityInvitationState](#schemacommunityinvitationstate)|false|false|Invitation state|
|IssuingTenantId|guid|false|false|Identifier of the tenant that issued the invitation|
|InvitedTenantId|guid|false|true|Identifier of the tenant that is invited|
|CommunityId|guid|false|false|Identifier of the community from which the invitation was issued|
|CommunityName|string|false|true|Name of the community from which the invitation was issued|
|InvitationRecipient|string|false|true|Email address of the recipient who will be notified to accept the invitation|
|AcceptedUserEmail|string|false|true|Email address of the recipient who accepts the invitation|
|AcceptedTenantName|string|false|true|Name of the tenant accepting the invitation|

```json
{
  "Id": "string",
  "Issued": "2019-08-24T14:15:22Z",
  "Expires": "2019-08-24T14:15:22Z",
  "Accepted": "2019-08-24T14:15:22Z",
  "State": "None",
  "IssuingTenantId": "string",
  "InvitedTenantId": "string",
  "CommunityId": "string",
  "CommunityName": "string",
  "InvitationRecipient": "string",
  "AcceptedUserEmail": "string",
  "AcceptedTenantName": "string"
}

```

---

### CommunityInvitationState

<a id="schemacommunityinvitationstate"></a>
<a id="schema_CommunityInvitationState"></a>
<a id="tocScommunityinvitationstate"></a>
<a id="tocscommunityinvitationstate"></a>

Enum for Community invitation state.

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|None|None|No Invitation state specified.|
|InvitationCreated|InvitationCreated|Invitation email has been sent.|
|InvitationAccepted|InvitationAccepted|Invitation has been accepted.|
|InvitationDeclined|InvitationDeclined|Invitation has been declined.|
|InvitationExpired|InvitationExpired|Invitation has expired.|
|InvitationCompleted|InvitationCompleted|Invitation has been completed.|

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

### CreateInvitationInput

<a id="schemacreateinvitationinput"></a>
<a id="schema_CreateInvitationInput"></a>
<a id="tocScreateinvitationinput"></a>
<a id="tocscreateinvitationinput"></a>

The input object to create invitation

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|InvitationRecipient|string|false|true|The email address of the invitation recipient|

```json
{
  "InvitationRecipient": "string"
}

```

---

### CommunityInvitationDetails

<a id="schemacommunityinvitationdetails"></a>
<a id="schema_CommunityInvitationDetails"></a>
<a id="tocScommunityinvitationdetails"></a>
<a id="tocscommunityinvitationdetails"></a>

Summary of a community invitation

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|CommunityName|string|false|true|Community name|
|CommunityId|guid|false|false|Community identifier|
|InvitationState|[CommunityInvitationState](#schemacommunityinvitationstate)|false|false|Invitation state|

```json
{
  "CommunityName": "string",
  "CommunityId": "string",
  "InvitationState": "None"
}

```

---

### ProcessInvitationInput

<a id="schemaprocessinvitationinput"></a>
<a id="schema_ProcessInvitationInput"></a>
<a id="tocSprocessinvitationinput"></a>
<a id="tocsprocessinvitationinput"></a>

The input object to process invitation

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Action|[ProcessInvitationAction](#schemaprocessinvitationaction)|false|false|Action to take on invitation|

```json
{
  "Action": "Accept"
}

```

---

### ProcessInvitationAction

<a id="schemaprocessinvitationaction"></a>
<a id="schema_ProcessInvitationAction"></a>
<a id="tocSprocessinvitationaction"></a>
<a id="tocsprocessinvitationaction"></a>

Enumeration of actions taken on community invitations

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|Accept|Accept|Accept the invitation.|
|Decline|Decline|Decline the invitation.|
|Confirm|Confirm|Confirm the invitation.|
|Resend|Resend|Resend the invitation.|

---

