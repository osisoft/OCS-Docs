---
uid: identityPersistedGrant
---

# PersistedGrant

Persisted Grants such as refresh tokens or authorization codes are used
            by OCS to maintain some state about User authentication with regards to
            a Client. For instance, refresh tokens, which are issued to Hybrid clients,
            make it possible to determine when the Client can be issued a new access token
            on behalf of the User without the users themselves being present.


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

## `Get Client Ids of Persisted Grants for User`

Get enumerable of client IDs that have been issued an
            Authorization Codes (not the same as the client type)
            on behalf of a User.

### Request

`GET api/v1/Tenants/{tenantId}/Users/{userId}/PersistedGrants`

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

 `List`

```json
[
  "String",
  "String"
]
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User not found.

#### 500

Internal server error.
***

## `Get Total Count of Persisted Grants for a User`

Validate whether there are any Authorization Code Persisted Grants for User.

### Request

`HEAD api/v1/Tenants/{tenantId}/Users/{userId}/PersistedGrants`

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

User not found.

#### 500

Internal server error.
***

## `Remove Persisted Grants`

Remove Authorization Code Persisted Grants
            for the User with the specified User Id in the Tenant.

### Request

`DELETE api/v1/Tenants/{tenantId}/Users/{userId}/PersistedGrants`

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

#### 204

Removed.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

User not found.

#### 500

Internal server error.
***

