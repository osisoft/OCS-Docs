---
uid: identityIdentityProvider
---

# IdentityProvider

APIs for getting a list of all supported Identity Providers

## Properties

For HTTP requests and responses, the IdentityProvider object has the following properties and JSON-serialized body: 

Property | Type | Descriptions
 --- | --- | --- | ---
Id | Guid | Id of an identity provider
DisplayName | string | Identity provider display name to use
Scheme | string | Specifies the name of the cookie handler that will temporarily store the outcome of the external authentication.
UserIdClaimType | string | Type of claim

### Serialized Model

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "DisplayName": "Name",
  "Scheme": "Scheme",
  "UserIdClaimType": "UserIdClaimType"
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

## `Get Identity Provider`

Returns an IdentityProvider object

### Request

`GET api/v1/IdentityProviders/{identityProviderId}`

### Parameters

```csharp
[Required]
Guid identityProviderId
```

Id of provider

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
  "UserIdClaimType": "UserIdClaimType"
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

Query to execute. Currently not supported

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

Maximum number of providers to return

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
    "UserIdClaimType": "UserIdClaimType"
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "DisplayName": "Name",
    "Scheme": "Scheme",
    "UserIdClaimType": "UserIdClaimType"
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

## `Validate that IDP Exists based on scheme`

Get header for a scheme to check its validity

### Request

`HEAD api/v1/IdentityProviders/schemes/{scheme}`

### Parameters

```csharp
[Required]
string scheme
```

Scheme name

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

## `Validate that IDP exists based on Id`

Get header for an identity provider to check if the identity provider exists.

### Request

`HEAD api/v1/IdentityProviders/{identityProviderId}`

### Parameters

```csharp
[Required]
Guid identityProviderId
```

Id of provider

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

## `Get Total Count of IDPs in Te`

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

## `Get All IDPs from Tenant`

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
[Default = ""]
string query
```

Query to execute. Currently not supported

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

- `Account Administrator`
- `Account Member`

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
    "UserIdClaimType": "UserIdClaimType"
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "DisplayName": "Name",
    "Scheme": "Scheme",
    "UserIdClaimType": "UserIdClaimType"
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

## `Get IDP from Tenant`

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

- `Account Administrator`
- `Account Member`

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
  "UserIdClaimType": "UserIdClaimType"
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

## `Add IDP to Tenant`

Add an existing Identity Provider to a Tenant. This IDP
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
IdentityProviderId | Guid | Yes | Identity Provider Id to Add
AzureActiveDirectorySendConsent | bool | No | Send consent email for Azure Active Directory.
AzureActiveDirectoryConsentEmail | string | Yes | Address to email consent.            Only AAD Admins have permission to consent to OCS            being allowed to interact with the tenant. The email            does not have to be sent to an Admin.
AzureActiveDirectoryConsentGivenName | string | Yes | Preferred name to use in the consent email.
AzureActiveDirectoryConsentSurname | string | Yes | Preferred surname to use in the email.
AzureActiveDirectoryTenant | string | Yes | AAD Domain Name (e.g. mydomain.onmicrosoft.com)



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
  "UserIdClaimType": "UserIdClaimType"
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

#### 409

Identity Provider already exists in Tenant.

#### 500

Internal server error.
***

## `Remove IDP From Tenant`

Remove an Identity Provider from a Tenant. Users provisioned
            with this Identity Provider will remain in the Tenant, but will
            not be able to authenticate.

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

#### 500

Internal server error.
***

## `Validate IDP Exists`

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

- `Account Administrator`
- `Account Member`

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

## `Get Total Count of IDPs`

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

- `Account Administrator`
- `Account Member`

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

