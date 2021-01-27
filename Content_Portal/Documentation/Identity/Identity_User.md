---
uid: identityUser
---

# User

Users consume resources in a tenant. They are invited by the Admin of the
            tenant and should already have a tenant in one of the configured identity
            providers for this tenant. A User is fully provisioned in OSIsoft Cloud Services
            only after they have accepted the invitation and successfully logged with
            an identity provider. OSIsoft Cloud Services does not maintain user credentials, but it delegates
            authentication to the identity provider the user logged in with at first. Once
            logged in the user cannot change the identity provider it signed up with. A tenant
            can only have one user with a given email to an identity provider. If a user has
            multiple aliases in the same identity provider, they will not be able to create
            multiple corresponding OSIsoft Cloud Services users. Users have roles associated with them. These roles
            determine what a user is authorized to do in the tenant. Roles are assigned to a user
            upon creation and can be modified by an Admin. We allow the change of some User fields
            and the complete deletion of a user.
            For some recommendations on least privilege for users and clients, refer to the [Least Privilege](xref:LeastPrivilege) topic.
Users consume resources in a tenant. They are invited by the admin of the tenant and should already have an account in one of the configured identity providers for this tenant. A user is fully provisioned in OSIsoft Cloud Services only after they have accepted the invitation and successfully logged with an identity provider. OSIsoft Cloud Services does not maintain user credentials, but it delegates authentication to the identity provider the user logged in with at first. Once
logged in the user cannot change the identity provider it signed up with. A tenant can only have one user with a given email to an identity provider. If a user has multiple aliases in the same identity provider, they will not be able to create multiple corresponding OSIsoft Cloud Services users. Users have roles associated with them. These roles determine what a user is authorized to do in the tenant. Roles are assigned to a user upon creation and can be modified by an Admin. We allow the change of some User fields and the complete deletion of a user.

## Properties

For HTTP requests and responses, the User object has the following properties and JSON-serialized body: 

Property Name | Data Type | Description
 --- | --- | ---
Id | Guid | Unique User ID.
GivenName | string | Given name of user.
Surname | string | Surname of user.
Name | string | Nname of user.
Email | string | Email of user.
ContactEmail | string | Contact email for user. User will only be contacted through this email.
ContactGivenName | string | Preferred contact name for user.
ContactSurname | string | Preferred contact surname for user.
ExternalUserId | string | Provider id for user. This is the unique ID we get from the identity provider.
IdentityProviderId | Guid | Identity Provider Id used to authenticate user. Will be set once the user accepts an invitation. If not specified when sending the invitation to the User, it can be any of the Identity Provider Ids configured for this tenant.
RoleIds | Guid[] | List of strings of RoleIds.

### Serialized model

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "GivenName": "Name",
  "Surname": "Surname",
  "Name": "Name",
  "Email": "user@company.com",
  "ContactEmail": "user@company.com",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ExternalUserId": "ExternalUserId",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ]
}
```

***

## Authentication

All endpoints referenced in this documentation require authenticated access. Authorization header must be set to the access token you retrieve after a successful authentication request.

`Authorization: Bearer <token>`

Requests made without an access token or an invalid/expired token will fail with a 401 Unauthorized response.
Requests made with an access token which does not have the correct permissions (see security subsection on every endpoint) will fail with a 403 Forbidden.
Read [here](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/AUTHENTICATION_README.md) on how to authenticate against OCS with the various clients and receive an access token in response.

## Error handling

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

## `Get Users from a Tenant`

Get a list of users from a tenant. Optionally, get a list of requested users.
            Total number of users in the Tenant set in the Total-Count header.

### Request

`GET api/v1/Tenants/{tenantId}/Users`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[FromQuery]
[Optional]
[Default = ""]
Guid[] id
```

Unordered list of User Ids to get.

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

Number of users to skip. Ignored if a list of Ids is passed.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of users to return. Ignored if a list of Ids is passed.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `List`

```json
[
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "GivenName": "Name",
    "Surname": "Surname",
    "Name": "Name",
    "Email": "user@company.com",
    "ContactEmail": "user@company.com",
    "ContactGivenName": "Name",
    "ContactSurname": "Surname",
    "ExternalUserId": "ExternalUserId",
    "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ]
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "GivenName": "Name",
    "Surname": "Surname",
    "Name": "Name",
    "Email": "user@company.com",
    "ContactEmail": "user@company.com",
    "ContactGivenName": "Name",
    "ContactSurname": "Surname",
    "ExternalUserId": "ExternalUserId",
    "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ]
  }
]
```

#### 207

Partial success.

##### Type:

 `UserMultiStatusResponse`

```json
{
  "OperationId": "OperationId",
  "Error": "Error",
  "Reason": "Reason",
  "ChildErrors": [
    {
      "StatusCode": 0,
      "ModelId": "ModelId",
      "OperationId": "OperationId",
      "Error": "Error",
      "Reason": "Reason",
      "Resolution": "Resolution"
    },
    {
      "StatusCode": 0,
      "ModelId": "ModelId",
      "OperationId": "OperationId",
      "Error": "Error",
      "Reason": "Reason",
      "Resolution": "Resolution"
    }
  ],
  "Data": [
    {
      "Id": "00000000-0000-0000-0000-000000000000",
      "GivenName": "Name",
      "Surname": "Surname",
      "Name": "Name",
      "Email": "user@company.com",
      "ContactEmail": "user@company.com",
      "ContactGivenName": "Name",
      "ContactSurname": "Surname",
      "ExternalUserId": "ExternalUserId",
      "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
      "RoleIds": [
        "00000000-0000-0000-0000-000000000000",
        "00000000-0000-0000-0000-000000000000"
      ]
    },
    {
      "Id": "00000000-0000-0000-0000-000000000000",
      "GivenName": "Name",
      "Surname": "Surname",
      "Name": "Name",
      "Email": "user@company.com",
      "ContactEmail": "user@company.com",
      "ContactGivenName": "Name",
      "ContactSurname": "Surname",
      "ExternalUserId": "ExternalUserId",
      "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
      "RoleIds": [
        "00000000-0000-0000-0000-000000000000",
        "00000000-0000-0000-0000-000000000000"
      ]
    }
  ]
}
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

## `Get Users' Invitation Status`

Get invitation statuses for multiple users. Optionally restrict it only to users of a specific invitation status. The user status can be: InvitationAccepted (0),  NoInvitation (1), InvitationNotSent (2), InvitationSent (3), InvitationExpired (4).

### Request

`GET api/v1/Tenants/{tenantId}/Users/Status`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[FromQuery]
[Optional]
[Default = ""]
Guid[] id
```

Unordered list of User Ids to get.

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

Number of users to skip. Ignored if a list of Ids is passed.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of users to return. Ignored if a list of Ids is passed.

```csharp
[FromQuery]
[Optional]
[Default = ""]
string[] status
```

Only return statuses that match these values. Possible User statuses are: InvitationAccepted, NoInvitation, InvitationNotSent, InvitationSent, InvitationExpired.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `List`

```json
[
  {
    "InvitationStatus": 0,
    "User": {
      "Id": "00000000-0000-0000-0000-000000000000",
      "GivenName": "Name",
      "Surname": "Surname",
      "Name": "Name",
      "Email": "user@company.com",
      "ContactEmail": "user@company.com",
      "ContactGivenName": "Name",
      "ContactSurname": "Surname",
      "ExternalUserId": "ExternalUserId",
      "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
      "RoleIds": [
        "00000000-0000-0000-0000-000000000000",
        "00000000-0000-0000-0000-000000000000"
      ]
    }
  },
  {
    "InvitationStatus": 0,
    "User": {
      "Id": "00000000-0000-0000-0000-000000000000",
      "GivenName": "Name",
      "Surname": "Surname",
      "Name": "Name",
      "Email": "user@company.com",
      "ContactEmail": "user@company.com",
      "ContactGivenName": "Name",
      "ContactSurname": "Surname",
      "ExternalUserId": "ExternalUserId",
      "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
      "RoleIds": [
        "00000000-0000-0000-0000-000000000000",
        "00000000-0000-0000-0000-000000000000"
      ]
    }
  }
]
```

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 500

Internal server error.

#### 404

Tenant not found.
***

## `Get User from a Tenant`

Get a User from tenant.

### Request

`GET api/v1/Tenants/{tenantId}/Users/{userId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid userId
```

Id of User.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `User`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "GivenName": "Name",
  "Surname": "Surname",
  "Name": "Name",
  "Email": "user@company.com",
  "ContactEmail": "user@company.com",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ExternalUserId": "ExternalUserId",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ]
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User or tenant not found.

#### 500

Internal server error.
***

## `Get User's Invitation Status`

Get invitation status for a User. It can be: InvitationAccepted (0),
            NoInvitation (1), InvitationNotSent (2), InvitationSent (3), InvitationExpired (4).

### Request

`GET api/v1/Tenants/{tenantId}/Users/{userId}/Status`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid userId
```

Id of user.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `UserStatus`

```json
{
  "InvitationStatus": 0,
  "User": {
    "Id": "00000000-0000-0000-0000-000000000000",
    "GivenName": "Name",
    "Surname": "Surname",
    "Name": "Name",
    "Email": "user@company.com",
    "ContactEmail": "user@company.com",
    "ContactGivenName": "Name",
    "ContactSurname": "Surname",
    "ExternalUserId": "ExternalUserId",
    "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ]
  }
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User or tenant not found.

#### 500

Internal server error.
***

## `Get User's Preferences`

Get preferences from a user. User preferences can be any valid
            JSON object. A common use case is to store UI preferences for the user.

### Request

`GET api/v1/Tenants/{tenantId}/Users/{userId}/Preferences`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid userId
```

Id of user.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `JObject`

```json
{}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User or tenant not found.

#### 500

Internal server error.
***

## `Update User's Preferences`

Update preferences for a user.

### Request

`PUT api/v1/Tenants/{tenantId}/Users/{userId}/Preferences`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid userId
```

Id of user.

```csharp
[FromBody]
[Required]
JObject preferences
```

JSON object preferences.

```json
{}
```

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `JObject`

```json
{}
```

#### 400

Missing preferences.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User or tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

## `Create User`

Create a User in the tenant. This endpoint does not create an invitation for the user.
            You will need to create an invitation in the respective endpoint for this user, otherwise
            they will not be able to finish the sign-up process. Users have unique Ids in a tenant.
            Currently there is a limit of 50000 users per tenant.
            For Windows Active Directory users, the externalUserId must be specified.

### Request

`POST api/v1/Tenants/{tenantId}/Users`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[FromBody]
[Required]
UserCreateOrUpdate userCreateOrUpdate
```

UserCreateOrUpdate object.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
Id | Guid | No | User Id for the user. When creating a user, if User ID is not specified, one will be generated.
ExternalUserId | string | No | User ExternalUserId for the user. Must be specified if identity provider is Windows Active Directory.
ContactGivenName | string | No | Preferred name to be used when contacting user.
ContactSurname | string | No | Preferred surname to be used when contacting user.
ContactEmail | string | No | Preferred contact email to be used. This does not have to be the same as the user's identity provider email.
IdentityProviderId | Guid | No | Identity provider this user will be required to use to login.  If null, the identity provider Id will            be set when creating the invitation.
RoleIds | Guid[] | No | List of strings of RoleIds.



```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "ExternalUserId": "ExternalUserId",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ContactEmail": "user@company.com",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ]
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 201

Created.

##### Type:

 `User`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "GivenName": "Name",
  "Surname": "Surname",
  "Name": "Name",
  "Email": "user@company.com",
  "ContactEmail": "user@company.com",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ExternalUserId": "ExternalUserId",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ]
}
```

#### 400

Missing or invalid inputs, or the User limit exceeded for tenant.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

## `Update User in a Tenant`

Update a user in a tenant. The Id of a user cannot be changed.

### Request

`PUT api/v1/Tenants/{tenantId}/Users/{userId}`

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
UserCreateOrUpdate userCreateOrUpdate
```

UserCreateOrUpdate object. Properties that are not set or are null will not be changed.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
Id | Guid | No | User Id for the user. When creating a user, if User ID is not specified, one will be generated.
ExternalUserId | string | No | User ExternalUserId for the user. Must be specified if identity provider is Windows Active Directory.
ContactGivenName | string | No | Preferred name to be used when contacting user.
ContactSurname | string | No | Preferred surname to be used when contacting user.
ContactEmail | string | No | Preferred contact email to be used. This does not have to be the same as the user's identity provider email.
IdentityProviderId | Guid | No | Identity provider this user will be required to use to login.  If null, the Identity Provider Id will            be set when creating the invitation.
RoleIds | Guid[] | No | List of strings of RoleIds.



```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "ExternalUserId": "ExternalUserId",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ContactEmail": "user@company.com",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ]
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Updated User.

##### Type:

 `User`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "GivenName": "Name",
  "Surname": "Surname",
  "Name": "Name",
  "Email": "user@company.com",
  "ContactEmail": "user@company.com",
  "ContactGivenName": "Name",
  "ContactSurname": "Surname",
  "ExternalUserId": "ExternalUserId",
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ]
}
```

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User or tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

## `Delete User in a Tenant`

Delete a user. Admins cannot delete themselves.
            Deleting a user does not invalidate any of the
            existing access tokens, but it prevents this user
            from being able to authenticate in the future.
            Existing access tokens for the user will be valid
            until their expiration date. Refresh tokens on
            behalf of the user will no longer be valid after the
            user has been deleted.

### Request

`DELETE api/v1/Tenants/{tenantId}/Users/{userId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid userId
```

Id of user.

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

User or tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

## `Get Header for User`

Validate that a user exists. This endpoint is identical to the GET
            one, but it does not return an object in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/Users/{userId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid userId
```

Id of user.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

User exists.

##### Type:

 `Void`

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User does not exist.

#### 500

Internal server error.
***

## `Get Total Count of Users`

Return total number of users in a tenant. Optionally, check based on a list of requested users. The value will be set in the Total-Count header. This endpoint is identical to the GET one but it does not return any objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/Users`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[FromQuery]
[Optional]
[Default = ""]
Guid[] id
```

Unordered list of User Ids.

### Security

Allowed for these roles:

- `Account Member`
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

User not found.

#### 500

Internal server error.
***

## `Get Header for User's Preferences`

Validate that there are preferences for a user. This endpoint is identical
            to the GET one but it does not return any objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/Users/{userId}/Preferences`

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

- `Account Member`
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

User or tenant not found.

#### 500

Internal server error.
***

