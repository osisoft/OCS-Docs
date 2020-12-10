---
uid: identityIdentityProvider
---

# IdentityProvider

APIs for getting a list of all supported Identity Providers.

## Properties

For HTTP requests and responses, the IdentityProvider object has the following properties and JSON-serialized body: 

Property Name | Data Type | Description
 --- | --- | ---
Id | Guid | Id of an identity provider.
DisplayName | string | Identity provider display name to use.
Scheme | string | The name of the cookie handler that will temporarily store the outcome of the external authentication.
UserIdClaimType | string | Type of claim.
ClientId | string | The ClientId of the identity provider.
IsConfigured | bool | A value indicating whether the identity provider has been configured.
Capabilities | object | The capabilities of the identity provider. 

### Serialized Model

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "DisplayName": "Name",
  "Scheme": "Scheme",
  "UserIdClaimType": "UserIdClaimType",
  "ClientId": "ClientId",
  "IsConfigured": false, 
  "Capabilities": { 
    "User": { 
      "SignIn": true, 
      "Invitation": true, 
      "Search": false 
    }, 
    "Group": { 
      "Authorize": false, 
      "Search": false 
    } 
  } 
}
```

***

## Authentication

All endpoints referenced in this documentation require authenticated access. Authorization header must be set to the access token you retrieve after a successful authentication request.

`Authorization: Bearer <token>`

Requests made without an access token or an invalid/expired token will fail with a 401 Unauthorized response.
Requests made with an access token which does not have the correct permissions (see security subsection on every endpoint) will fail with a 403 Forbidden.
Read [here](https://github.com/osisoft/OSI-Samples-OCS/tree/master/basic_samples/Authentication) on how to authenticate against OCS with the various clients and receive an access token in response.

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

## `Get Identity Provider`

Returns an IdentityProvider object.

### Request

`GET api/v1/IdentityProviders/{identityProviderId}`

### Parameters

```csharp
[Required]
Guid identityProviderId
```

Id of provider.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `IdentityProvider`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "DisplayName": "Name",
  "Scheme": "Scheme",
  "UserIdClaimType": "UserIdClaimType",
  "ClientId": "ClientId",
  "IsConfigured": false,
  "Capabilities": null
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Identity Provider not found.

#### 500

Internal server error.
***

## `Get Identity Provider By Scheme`

Returns a list of IdentityProvider objects that follow a scheme.

### Request

`GET api/v1/IdentityProviders/schemes/{scheme}`

### Parameters

```csharp
[Required]
string scheme
```

Scheme name.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `IdentityProvider`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "DisplayName": "Name",
  "Scheme": "Scheme",
  "UserIdClaimType": "UserIdClaimType",
  "ClientId": "ClientId",
  "IsConfigured": false,
  "Capabilities": null 
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Identity Provider not found.

#### 500

Internal server error.
***

## `Get Identity Providers`

Returns a list of IdentityProvider objects.

### Request

`GET api/v1/IdentityProviders`

### Parameters

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

Number of providers to skip.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of providers to return.

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
    "Id": "00000000-0000-0000-0000-000000000000",
    "DisplayName": "Name",
    "Scheme": "Scheme",
    "UserIdClaimType": "UserIdClaimType",
    "ClientId": "ClientId",
    "IsConfigured": false,
    "Capabilities": null
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "DisplayName": "Name",
    "Scheme": "Scheme",
    "UserIdClaimType": "UserIdClaimType",
    "ClientId": "ClientId",
    "IsConfigured": false,
    "Capabilities": null
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
***

## `Get Identity Provider based on scheme`

Get header for a scheme to check its validity.

### Request

`HEAD api/v1/IdentityProviders/schemes/{scheme}`

### Parameters

```csharp
[Required]
string scheme
```

Scheme name.

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

Identity Provider not found.

#### 500

Internal server error.
***

## `Get Identity Provider based on Id`

Get header for an identity provider to check if the identity provider exists.

### Request

`HEAD api/v1/IdentityProviders/{identityProviderId}`

### Parameters

```csharp
[Required]
Guid identityProviderId
```

Id of provider.

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

IdentityProvider or Tenant not found.

#### 500

Internal server error.
***

## `Get Header for Identity Providers`

Get header for Identity Providers to get the total number of Identity Providers.

### Request

`HEAD api/v1/IdentityProviders`

### Parameters
This API call does not have any parameters.
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

Tenant not found.

#### 500

Internal server error.
***

## `Get All Identity Providers from Tenant`

Get all Identity Providers from a Tenant.

### Request

`GET api/v1/Tenants/{tenantId}/IdentityProviders`

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
bool ignoreAadConsentState
```

Return AAD Identity Provider if at least one AAD tenant exists, regardless of the consent state.

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

Number of Identity Providers to skip.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of Identity Providers to return.

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
    "DisplayName": "Name",
    "Scheme": "Scheme",
    "UserIdClaimType": "UserIdClaimType",
    "ClientId": "ClientId",
    "IsConfigured": false,
    "Capabilities": { 
      "User": { 
        "SignIn": true, 
        "Invitation": true, 
        "Search": false 
      }, 
      "Group": { 
        "Authorize": false, 
        "Search": false 
      } 
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "DisplayName": "Name",
    "Scheme": "Scheme",
    "UserIdClaimType": "UserIdClaimType",
    "ClientId": "ClientId",
    "IsConfigured": false,
    "Capabilities": { 
      "User": { 
        "SignIn": true, 
        "Invitation": true, 
        "Search": false 
      }, 
      "Group": { 
        "Authorize": false, 
        "Search": false 
      } 
  }
]
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant not found.

#### 500

Internal server error.
***

## `Get Identity Provider from Tenant`

Get an Identity Provider from a Tenant.

### Request

`GET api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid identityProviderId
```

Id of Identity Provider.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `IdentityProvider`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "DisplayName": "Name",
  "Scheme": "Scheme",
  "UserIdClaimType": "UserIdClaimType",
  "ClientId": "ClientId",
  "IsConfigured": false,
  "Capabilities": { 
      "User": { 
        "SignIn": true, 
        "Invitation": true, 
        "Search": false 
      }, 
      "Group": { 
        "Authorize": false, 
        "Search": false 
      } 
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

IdentityProvider or Tenant not found.

#### 500

Internal server error.
***

## `Add Identity Provider to Tenant`

Add an existing Identity Provider to a Tenant. This Identity Provider
            will be available in the Home Realm Discovery Page
            for users to sign-in or sign-up.

### Request

`POST api/v1/Tenants/{tenantId}/IdentityProviders`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[FromBody]
[Required]
IdentityProviderAdd identityProviderAdd
```

IdentityProviderAdd object.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
IdentityProviderId | Guid | Yes | Identity Provider Id to Add.
AzureActiveDirectorySendConsent | bool | No | A value indicating whether send consent email for Azure Active Directory.
AzureActiveDirectoryConsentEmail | string | Yes | Address to email consent.            Only Azure Active Directory Admins have permission to consent to            being allowed to interact with the tenant. The email            does not have to be sent to an Admin.
AzureActiveDirectoryConsentGivenName | string | Yes | Preferred name to use in the consent email.
AzureActiveDirectoryConsentSurname | string | Yes | Preferred surname to use in the consent email.
AzureActiveDirectoryTenant | string | Yes | Azure Active Directory Domain Name (for example, mydomain.onmicrosoft.com).
AzureActiveDirectoryConsentTypes | string | No | Azure Active Directory Consent Types (for example, SignIn or SignIn;ReadAllUsersGroups).



```json
{
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
  "AzureActiveDirectorySendConsent": false,
  "AzureActiveDirectoryConsentEmail": "user@company.com",
  "AzureActiveDirectoryConsentGivenName": "Name",
  "AzureActiveDirectoryConsentSurname": "Surname",
  "AzureActiveDirectoryTenant": "AzureActiveDirectoryTenant",
  "AzureActiveDirectoryConsentTypes": "AzureActiveDirectoryConsentTypes"
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 201

Created.

##### Type:

 `IdentityProvider`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "DisplayName": "Name",
  "Scheme": "Scheme",
  "UserIdClaimType": "UserIdClaimType",
  "ClientId": "ClientId",
  "IsConfigured": false,
  "Capabilities": null
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

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 409

Identity Provider already exists in Tenant.

#### 500

Internal server error.
***

## `Remove Identity Provider From Tenant`

Remove an Identity Provider from a Tenant. Users provisioned
            with this Identity Provider will remain in the Tenant, but will
            not be able to authenticate.
            An administrator cannot remove the Identity Provider they are signed in with.

### Request

`DELETE api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid identityProviderId
```

Id of Identity Provider.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 204

Removed.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

IdentityProvider or Tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

## `Get Header for Identity Provider`

Validate that a Identity Provider exists in the Tenant.
            This endpoint is identical to the GET one but
            it does not return any objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid identityProviderId
```

Id of Identity Provider.

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

IdentityProvider or Tenant not found.

#### 500

Internal server error.
***

## `Get Total Count of Identity Providers`

Return total number of Identity Providers in a Tenant. The
            value will be set in the Total-Count header. This endpoint
            is identical to the GET one but it does not return any objects
            in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/IdentityProviders`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

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

Tenant not found.

#### 500

Internal server error.
***

## `Get a List of all User on an Identity Provider`

Get a list of users that matches the query string on an Identity Provider that supports advanced integration, such as Azure Active Directory. The prerequisite is that the identity provider must have already consented to sharing access to its directory with the OCS tenant.

### Request

`GET api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/{IdpId}/Users?query={user}&count={count}&skipToken={optional}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid identityProviderId
```

Id of Identity Provider.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of users to return.

```csharp
[FromQuery]
[Optional]
string skiptoken
```

An encoded string that identifies the set of users that was not returned. For example, if you specify a count of the first 50 users matching your query, the skiptoken identifies the 51st user.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

```json
"Results": [
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "GivenName": "GivenName",
    "Surname": "Surname",
    "Name": "Name",
    "Email": "Email",
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "GivenName": "GivenName",
    "Surname": "Surname",
    "Name": "Name",
    "Email": "Email",
  }
],
"SkipToken": SkipToken
```

## `Get a List of all Groups on an Identity Provider`

Get a list of groups that matches the query string on an identity provider that supports advanced integration, such as Azure Active Directory. The prerequisite is that the identity provider must have already consented to sharing access to its directory with the OCS tenant. The consent grants User.Read.All and GroupMember.Read.all permissions to the OCS tenant.

### Request

`GET api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/{IdpId}/Groups?query={group}&count={count}&skipToken={optional}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid identityProviderId
```

Id of Identity Provider.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of groups to return.

```csharp
[FromQuery]
[Optional]
string skiptoken
```

An encoded string that identifies the set of groups that was not returned. For example, if you specify a count of the first 5 groups matching your query, the skiptoken identifies the 6th group.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

```json
"Results": [
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "Name": "Name",
    "Email": "Email",
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "Name": "Name",
    "Email": "Email",
  }
],
"SkipToken": SkipToken
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

IdentityProvider or Tenant not found.

#### 500

Internal server error.
***

## `Get a List of all Groups that a User belongs to on an Identity Provider`

Get a list of all groups that the specified user belongs to on an Identity Provider that supports advanced integration, such as Azure Active Directory. The prerequisite is that the identity provider must have already consented to sharing access to its directory with the OCS tenant. The consent grants User.Read.All and GroupMember.Read.all permissions to the OCS tenant.

### Request

`GET api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/{IdpId}/Users/{userId}/Groups?count={count}&skipToken={optional}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid identityProviderId
```

Id of Identity Provider.

```csharp
[Required]
Guid userId
```

Id of User.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of groups to return.

```csharp
[FromQuery]
[Optional]
string skiptoken
```

An encoded string that identifies the set of groups that was not returned. For example, if you request a count of the first 3 groups matching your query, the skiptoken identifies the 4th user.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

```json
"Users": [
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "GivenName": "GivenName",
    "Surname": "Surname",
    "Name": "Name",
    "Email": "Email",
  }
],
"Groups": Groups
"SkipToken": SkipToken
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

IdentityProvider or Tenant not found.

#### 500

Internal server error.
***

## `Get a List of all Users belongs a Group on an Identity Provider`

Get a list of all users belonging to a specific group on an Identity Provider that supports advanced integration, such as Azure Active Directory. The prerequisite is that the identity provider must have already consented to sharing access to its directory with the OCS tenant.

### Request

`GET api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/{IdpId}/Groups/{GroupId}/Members?count={count}&skipToken={optional}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid identityProviderId
```

Id of Identity Provider.

```csharp
[Required]
Guid GroupId
```

Id of Group.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of users to return.

```csharp
[FromQuery]
[Optional]
string skiptoken
```

An encoded string that identifies the set of users that was not returned. For example, if you request a count of the first 50 users matching your query, the skiptoken identifies the 51st user.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

```json
"Results": [
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "Name": "Name",
    "Email": "Email",
  }
],
"SkipToken": SkipToken
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

IdentityProvider or Tenant not found.

#### 500

Internal server error.
***

## `Get an Identity Provider Consent from a Tenant`

Get the consent information for an Identity Provider for a Tenant. The ConsentState property, if returned, determines whether an Identity Provider consents to sharing access to its directory with the OCS tenant. For example, the expected ConsentState's for Azure Active Directory (AAD) include (Pending_)SignIn and (Pending_)ReadAllUsersGroups.

### Request

`GET api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Consent`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid identityProviderId
```

Id of Identity Provider to check for consent.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `IdentityProviderConsent`

```json

Microsoft Accounts and Google

{
  "Scheme": "Scheme",
}

Azure Active Directory

{
  "Scheme": "aad",
  "AadTenantId": "00000000-0000-0000-0000-000000000000",
  "AadDomain": "AadDomain",
  "ConsentState": "ConsentState"
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

IdentityProvider or Tenant not found.

#### 500

Internal server error.
***

## `Get Header for Identity Provider Consent`

Validate that a Identity Provider Consent exists in the Tenant. This endpoint is identical to the GET one but it does not return any objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Consent`

### Parameters

```csharp
[Required]
string tenantId
```

Id of Tenant.

```csharp
[Required]
Guid identityProviderId
```

Id of Identity Provider to check for consent.

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

IdentityProvider or Tenant not found.

#### 500

Internal server error.
***

## `Update Identity Provider Consent of a Tenant`

Update the Identity Provider Consent of a Tenant. Currently only support Azure Active Directory. The consent grants User.Read.All and GroupMember.Read.all permissions to the OCS tenant.

### Request

`POST api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Consent`

### Parameters

```csharp
[Required]
string tenantId
```
Id of Tenant.

```csharp
[Required]
Guid identityProviderId
```

Id of Identity Provider to activate consent

```csharp
[FromBody]
[Required]
IdentityProviderConsent identityProviderConsent
```

IdentityProviderConsent object.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
Scheme | string | Yes | The scheme of the Identity Provider.
AadTenantId | string | No | Azure Active Directory Tenant Id.
AadDomain | string | No | Azure Active Directory Domain Name (for example, mydomain.onmicrosoft.com).
AadConsentTypes | string | Yes | Azure Active Directory Consent Types (for example, SignIn or SignIn;ReadAllUsersGroups).
ConsentEmail | string | Yes | Address to email consent. Only Azure Active Directory Admins have permission to consent to being allowed to interact with the tenant. The email does not have to be sent to an Admin.
ConsentFirstName | string | Yes | Preferred name to use in the consent email.
ConsentOverride | bool | No | A value indicating whether force a consent email to be sent for the specified ConsentTypes.



```json
{
  "Scheme": "aad",
  "AadTenantId": "00000000-0000-0000-0000-000000000000",
  "AadDomain": " AadDomain",
  "AadConsentTypes": "AadConsentTypes",
  "ConsentFirstName": "Name",
  "ConsentEmail": "user@company.com",
  "ConsentOverride": true
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant not found.

#### 408

Operation timed out.

#### 500

Internal server error.
***
