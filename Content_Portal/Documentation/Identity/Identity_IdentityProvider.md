---
uid: identityIdentityProvider
---

# IdentityProvider

APIs for getting a list of all supported Identity Providers.

## Properties

For HTTP requests and responses, the IdentityProvider object has the following properties and JSON-serialized body: 

Property | Type | Description
 --- | --- | ---
Id | Guid | Gets or sets id of an identity provider.
DisplayName | string | Gets or sets identity provider display name to use.
Scheme | string | Gets or sets the name of the cookie handler that will temporarily store the outcome of the external authentication.
UserIdClaimType | string | Gets or sets type of claim.
ClientId | string | Gets or sets the ClientId of the identity provider.
IsConfigured | bool | Gets or sets a value indicating whether the identity provider has been configured.

### Serialized Model

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "DisplayName": "Name",
  "Scheme": "Scheme",
  "UserIdClaimType": "UserIdClaimType",
  "ClientId": "ClientId",
  "IsConfigured": false
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
  "IsConfigured": false
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
  "IsConfigured": false
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
    "IsConfigured": false
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "DisplayName": "Name",
    "Scheme": "Scheme",
    "UserIdClaimType": "UserIdClaimType",
    "ClientId": "ClientId",
    "IsConfigured": false
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
    "IsConfigured": false
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "DisplayName": "Name",
    "Scheme": "Scheme",
    "UserIdClaimType": "UserIdClaimType",
    "ClientId": "ClientId",
    "IsConfigured": false
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
  "IsConfigured": false
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

Property | Type | Required | Description 
 --- | --- | --- | ---
IdentityProviderId | Guid | Yes | Gets or sets Identity Provider Id to Add.
AzureActiveDirectorySendConsent | bool | No | Gets or sets a value indicating whether send consent email for Azure Active Directory.
AzureActiveDirectoryConsentEmail | string | Yes | Gets or sets address to email consent.            Only Azure Active Directory Admins have permission to consent to            being allowed to interact with the tenant. The email            does not have to be sent to an Admin.
AzureActiveDirectoryConsentGivenName | string | Yes | Gets or sets preferred name to use in the consent email.
AzureActiveDirectoryConsentSurname | string | Yes | Gets or sets preferred surname to use in the consent email.
AzureActiveDirectoryTenant | string | Yes | Gets or sets Azure Active Directory Domain Name (e.g. mydomain.onmicrosoft.com).



```json
{
  "IdentityProviderId": "00000000-0000-0000-0000-000000000000",
  "AzureActiveDirectorySendConsent": false,
  "AzureActiveDirectoryConsentEmail": "user@company.com",
  "AzureActiveDirectoryConsentGivenName": "Name",
  "AzureActiveDirectoryConsentSurname": "Surname",
  "AzureActiveDirectoryTenant": "AzureActiveDirectoryTenant"
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
  "IsConfigured": false
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

