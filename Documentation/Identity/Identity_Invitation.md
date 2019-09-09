---
uid: identityInvitation
---

# Invitation

Invitations are issued after the creation of a User object in OCS,
            to begin the provisioning process for a user with one of the Identity
            Providers in a Tenant.
            There can only be one Invitation for a User at a time. An invitation
            can expire, at which time the Admin can either delete it, or extend it.
            When creating an Invitation an account Admin has the option to resend the
            Invitation email to the ContactEmail configured for the User the Invitation
            is attached to. The email can be re-sent by updating the Invitation.
            When an Invitation expires the User cannot accept it. If the expiration
            date is extended the User can accept an Invitation.
            Invitations that are past of their expiration date by more than two weeks will be deleted.
            The only way to provision a User after this, is to send a new Invitation.

## Properties

For HTTP requests and responses, the Invitation object has the following properties and JSON-serialized body: 

Property | Type | Descriptions
 --- | --- | --- | ---
Id | string | Unique Invitation Id.
Issued | DateTime | Invitation issuing timestamp.
Expires | DateTime | Invitation expiration timestamp.
Accepted | DateTime | Invitation accepted timestamp.
State | InvitationStates | Invitation state. Can be None (0), InvitationEmailSent (1), InvitationAccepted (2)
TenantId | string | ID of the Tenant the invitation belongs to.
UserId | Guid | ID of the User whom the invitation was issued to.
IdentityProviderId | Guid | ID of the Identity Provider that must be used to accept the invitation.

### Serialized Model

```json
{
  "Id": "Id",
  "Issued": "2019-07-19T13:56:29.6798766-07:00",
  "Expires": "2019-07-19T13:56:29.6798797-07:00",
  "Accepted": "2019-07-19T13:56:29.6798828-07:00",
  "State": 0,
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "UserId": "00000000-0000-0000-0000-000000000000",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

***

## Base URL

All URLs referenced in this section have the following base:

`https://dat-b.osisoft.com/`

## Authentication

All endpoints referenced in this documentation require authenticated access. Authorization header must be set to the access token you retrieve after a successful authentication request.

`Authorization: Bearer <token>`

Requests made without an access token or an invalid/expired token will fail with a 401 Unauthorized response.
Requests made with an access token which does not have the correct permissions (see security subsection on every endpoint) will fail with a 403 Forbidden.
Read [here](https://github.com/osisoft/OSI-Samples/tree/master/ocs_samples/basic_samples/Authentication) on how to authenticate against OCS with the various clients and receive an access token in response.

## Error Handling

All responses will have an error message in the body. The exceptions are 200 responses and the 401 Unauthorized response. The error message will look as follows:

```json
{
    "OperationId": "1b2af18e-8b27-4f86-93e0-6caa3e59b90c", 
    "Error": "Error message.", 
    "Reason": "Reason that caused error.", 
    "Resolution": "Possible solution for the error." 
}
```

If and when contacting OSIsoft support about this error, please provide the OperationId.

## `Get Invitation`

Get an Invitation from Tenant.

### Request

`GET api/v1/Tenants/{tenantId}/Invitations/{invitationId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
string invitationId
```

Id of Invitation.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `Invitation`

```json
{
  "Id": "Id",
  "Issued": "2019-07-19T13:56:29.6860834-07:00",
  "Expires": "2019-07-19T13:56:29.6860885-07:00",
  "Accepted": "2019-07-19T13:56:29.6860936-07:00",
  "State": 0,
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "UserId": "00000000-0000-0000-0000-000000000000",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Invitation or Tenant not found.

#### 500

Internal server error.
***

## `Get Invitations`

Get all non-expired invitations from a Tenant. Optionally include expired invitations.

### Request

`GET api/v1/Tenants/{tenantId}/Invitations`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string query
```

Query to execute. Currently not supported.

```csharp
[FromQuery]
[Optional]
[Default = 0]
int32 skip
```

Number of invitations to skip.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of invitations to return.

```csharp
[FromQuery]
[Optional]
[Default = False]
bool includeExpiredInvitations
```

Specify whether to return expired invitations.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `List`

```json
[
  {
    "Id": "Id",
    "Issued": "2019-07-19T13:56:29.6881037-07:00",
    "Expires": "2019-07-19T13:56:29.6881159-07:00",
    "Accepted": "2019-07-19T13:56:29.6881237-07:00",
    "State": 0,
    "TenantId": "00000000-0000-0000-0000-000000000000",
    "UserId": "00000000-0000-0000-0000-000000000000",
    "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
  },
  {
    "Id": "Id",
    "Issued": "2019-07-19T13:56:29.6881435-07:00",
    "Expires": "2019-07-19T13:56:29.6881451-07:00",
    "Accepted": "2019-07-19T13:56:29.688148-07:00",
    "State": 0,
    "TenantId": "00000000-0000-0000-0000-000000000000",
    "UserId": "00000000-0000-0000-0000-000000000000",
    "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
  }
]
```

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant not found.

#### 500

Internal server error.
***

## `Update Invitation`

Update an Invitation. Expired invitations will not be extended.
            automatically upon updates.

### Request

`PUT api/v1/Tenants/{tenantId}/Invitations/{invitationId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
string invitationId
```

Id of Invitation.

```csharp
[FromBody]
[Required]
InvitationCreateOrUpdate invitationCreateOrUpdate
```

New InvitationCreateOrUpdate object. Properties that are not set or are null will not be changed.

Property | Type | Required | Description 
 --- | --- | --- | ---
ExpiresDateTime | DateTime | No | Invitation expiration date. Must be in the future.            Maximum allowed is two month in the future.            Defaults to 21 days on creation.            It should be in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) and either            include a *Z* at the end to represent UTC timezone            or include the offset in hours. If neither is present            time will be treated in the local time zone of the server.
State | InvitationStates | No | Set the state of invitation. For OSISoft internal use only.
SendInvitation | bool | No | Send an invitation email. Invitation will be sent to the            ContactEmail in the User this invitation is attached to.            Default is true.
IdentityProviderId | Guid | No | Identity Provider to use for accepting this invitation.            Null implies invitation can be accepted using any            configured Identity Provider.



```json
{
  "ExpiresDateTime": "2019-07-19T13:56:29.6937488-07:00",
  "State": 0,
  "SendInvitation": false,
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `Invitation`

```json
{
  "Id": "Id",
  "Issued": "2019-07-19T13:56:29.6964848-07:00",
  "Expires": "2019-07-19T13:56:29.6964885-07:00",
  "Accepted": "2019-07-19T13:56:29.6964927-07:00",
  "State": 0,
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "UserId": "00000000-0000-0000-0000-000000000000",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Invitation or Tenant not found.

#### 500

Internal server error.
***

## `Delete Invitation`

Delete an Invitation. Users who already have an Invitation email
            will not be able to sign-up once the Invitation is deleted.

### Request

`DELETE api/v1/Tenants/{tenantId}/Invitations/{invitationId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
string invitationId
```

Id of Invitation.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 204

Deleted.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Invitation or Tenant not found.

#### 500

Internal server error.
***

## `Get header for an Invitation`

Validate that an Invitation exists. This endpoint is identical to the GET
            one, but it does not return an object in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/Invitations/{invitationId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
string invitationId
```

Id of Invitation.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `Void`

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Invitation or Tenant not found.

#### 500

Internal server error.
***

## `Get header for Invitations`

Return total number of non-expired Invitations in a Tenant. Optionally include expired invitations.
            The value will be set in the Total-Count header. This endpoint is identical to the GET one but
            it does not return any objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/Invitations`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[FromQuery]
[Optional]
[Default = False]
bool includeExpiredInvitations
```

Specify to return expired invitations.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `Void`

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant not found.

#### 500

Internal server error.
***

## `Get User's Invitation`

Get Invitation for a User.

### Request

`GET api/v1/Tenants/{tenantId}/Users/{userId}/Invitation`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid userId
```

Id of User.

### Security

Allowed for these roles:

- `Account Administrator`
- `Account Member`

### Returns

#### 200

Success.

##### Type:

 `Invitation`

```json
{
  "Id": "Id",
  "Issued": "2019-07-19T13:56:29.7669772-07:00",
  "Expires": "2019-07-19T13:56:29.7669819-07:00",
  "Accepted": "2019-07-19T13:56:29.7669868-07:00",
  "State": 0,
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "UserId": "00000000-0000-0000-0000-000000000000",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Invitation, User, or Tenant not found.

#### 500

Internal server error.
***

## `Create Invitation`

Create an Invitation for a User. Should use when no other Invitation exists for the User.

### Request

`POST api/v1/Tenants/{tenantId}/Users/{userId}/Invitation`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid userId
```

Id of User.

```csharp
[FromBody]
[Required]
InvitationCreateOrUpdate invitationCreateOrUpdate
```

InvitationCreateOrUpdate object.

Property | Type | Required | Description 
 --- | --- | --- | ---
ExpiresDateTime | DateTime | No | Invitation expiration date. Must be in the future.            Maximum allowed is two month in the future.            Defaults to 21 days on creation.            It should be in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) and either            include a *Z* at the end to represent UTC timezone            or include the offset in hours. If neither is present            time will be treated in the local time zone of the server.
State | InvitationStates | No | Set the state of invitation. For OSISoft internal use only.
SendInvitation | bool | No | Send an invitation email. Invitation will be sent to the            ContactEmail in the User this invitation is attached to.            Default is true.
IdentityProviderId | Guid | No | Identity Provider to use for accepting this invitation.            Null implies invitation can be accepted using any            configured Identity Provider.



```json
{
  "ExpiresDateTime": "2019-07-19T13:56:29.7686102-07:00",
  "State": 0,
  "SendInvitation": false,
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 201

Created.

##### Type:

 `Invitation`

```json
{
  "Id": "Id",
  "Issued": "2019-07-19T13:56:29.7686954-07:00",
  "Expires": "2019-07-19T13:56:29.7686969-07:00",
  "Accepted": "2019-07-19T13:56:29.7686992-07:00",
  "State": 0,
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "UserId": "00000000-0000-0000-0000-000000000000",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User or Tenant not found.

#### 409

Invitation already exists.

#### 500

Internal server error.
***

## `Create or Update Invitation`

Create or update an Invitation for a User.

### Request

`PUT api/v1/Tenants/{tenantId}/Users/{userId}/Invitation`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid userId
```

Id of User.

```csharp
[FromBody]
[Required]
InvitationCreateOrUpdate invitationCreateOrUpdate
```

InvitationCreateOrUpdate object.

Property | Type | Required | Description 
 --- | --- | --- | ---
ExpiresDateTime | DateTime | No | Invitation expiration date. Must be in the future.            Maximum allowed is two month in the future.            Defaults to 21 days on creation.            It should be in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) and either            include a *Z* at the end to represent UTC timezone            or include the offset in hours. If neither is present            time will be treated in the local time zone of the server.
State | InvitationStates | No | Set the state of invitation. For OSISoft internal use only.
SendInvitation | bool | No | Send an invitation email. Invitation will be sent to the            ContactEmail in the User this invitation is attached to.            Default is true.
IdentityProviderId | Guid | No | Identity Provider to use for accepting this invitation.            Null implies invitation can be accepted using any            configured Identity Provider.



```json
{
  "ExpiresDateTime": "2019-07-19T13:56:29.7703535-07:00",
  "State": 0,
  "SendInvitation": false,
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Updated.

##### Type:

 `Invitation`

```json
{
  "Id": "Id",
  "Issued": "2019-07-19T13:56:29.7704833-07:00",
  "Expires": "2019-07-19T13:56:29.7704854-07:00",
  "Accepted": "2019-07-19T13:56:29.7704891-07:00",
  "State": 0,
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "UserId": "00000000-0000-0000-0000-000000000000",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

#### 201

Created.

##### Type:

 `Invitation`

```json
{
  "Id": "Id",
  "Issued": "2019-07-19T13:56:29.7705274-07:00",
  "Expires": "2019-07-19T13:56:29.7705292-07:00",
  "Accepted": "2019-07-19T13:56:29.7705325-07:00",
  "State": 0,
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "UserId": "00000000-0000-0000-0000-000000000000",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000"
}
```

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User or Tenant not found.

#### 500

Internal server error.
***

## `Delete Invitation`

Delete an Invitation for a User.

### Request

`DELETE api/v1/Tenants/{tenantId}/Users/{userId}/Invitation`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid userId
```

Id of User.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 204

Deleted.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Invitation or Tenant not found.

#### 500

Internal server error.
***

## `Get header for User's Invitation`

Validate that Invitation exist for a User. This endpoint
            is identical to the GET one but it does not return any
            objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/Users/{userId}/Invitation`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid userId
```

Id of User.

```csharp
[FromQuery]
[Optional]
[Default = False]
bool includeExpiredInvitations
```

Specify whether to include expired invitations.

### Security

Allowed for these roles:

- `Account Administrator`
- `Account Member`

### Returns

#### 200

Success.

##### Type:

 `Void`

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant not found.

#### 500

Internal server error.
***

