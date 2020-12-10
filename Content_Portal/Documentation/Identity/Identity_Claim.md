---
uid: identityClaim
---

# Claim

An Identity Provider Claim provides a mechanism to map a Claim
            from an Identity Provider to one or more Roles.

## Properties

For HTTP requests and responses, the Claim object has the following properties and JSON-serialized body: 

Property Name | Data Type | Description
 --- | --- | ---
Issuer | string | The issuer of the claim.
OriginalIssuer | string | The original issuer of the claim.
Subject | ClaimsIdentity | The subject of the claim.
Type | string | The type of the claim.
Value | string | The value of the claim.
ValueType | string | The value type of the claim.

### Serialized Model

```json
{
  "Issuer": "Issuer",
  "OriginalIssuer": "OriginalIssuer",
  "Properties": null,
  "Subject": null,
  "Type": "Type",
  "Value": "Value",
  "ValueType": "ValueType"
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

## `Get All Identity Provider Claims`

Get all Identity Provider Claims for an Identity Provider on a Tenant.

### Request

`GET api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims`

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
    "TypeName": "Name",
    "Value": "Value",
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ]
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "TypeName": "Name",
    "Value": "Value",
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ]
  }
]
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant or Identity Provider not found.

#### 500

Internal server error.
***

## `Get All Identity Provider Claims Header`

Get Header for all Identity Provider Claims for an Identity Provider on a Tenant.

### Request

`HEAD api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims`

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

#### 200

Success.

##### Type:

 `Void`

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant or Identity Provider not found.

#### 500

Internal server error.
***

## `Get Identity Provider Claim`

Get an Identity Provider Claim from an Identity Provider on a Tenant.

### Request

`GET api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}`

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
Guid identityProviderClaimId
```

Id of Identity Provider Claim.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `IdentityProviderClaim`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "TypeName": "Name",
  "Value": "Value",
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

Tenant, Identity Provider, or Identity Provider Claim not found.

#### 500

Internal server error.
***

## `Get Identity Provider Claim Header`

Get an Identity Provider Claim Header from an Identity Provider on a Tenant.

### Request

`HEAD api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}`

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
Guid identityProviderClaimId
```

Id of Identity Provider Claim.

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

Tenant, Identity Provider, or Identity Provider Claim not found.

#### 500

Internal server error.
***

## `Create New Identity Provider Claim`

Create a new Identity Provider Claim for an Identity Provider on a Tenant.

### Request

`POST api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims`

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
[FromBody]
[Required]
IdentityProviderClaimCreate identityProviderClaimCreate
```

Identity Provider Claim to create.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
Value | string | Yes | The value for this IdentityProvider Claim.
IdentityProviderClaimTypeNameId | Guid | Yes | The Identity Provider Claim Type Name Id for this IdentityProvider Claim.
RoleIds | Guid[] | Yes | The list of Role Ids associated with this IdentityProviderClaim.



```json
{
  "Value": "Value",
  "IdentityProviderClaimTypeNameId": "00000000-0000-0000-0000-000000000000",
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

 `IdentityProviderClaim`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "TypeName": "Name",
  "Value": "Value",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ]
}
```

#### 302

Found.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Tenant, Identity Provider, or Roles not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 409

Identity Provider Claim configuration already exists.

#### 500

Internal server error.
***

## `Update an existing Identity Provider Claim`

Create a new Identity Provider Claim for an Identity Provider on a Tenant.

### Request

`PUT api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}`

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
Guid identityProviderClaimId
```

Id of Identity Provider Claim.

```csharp
[FromBody]
[Required]
IdentityProviderClaimUpdate identityProviderClaimUpdate
```

Updated Identity Provider Claim values.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
Value | string | No | The value for this IdentityProvider Claim.
RoleIds | Guid[] | No | The list of Role Ids associated with this IdentityProviderClaim.



```json
{
  "Value": "Value",
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

Updated.

##### Type:

 `IdentityProviderClaim`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "TypeName": "Name",
  "Value": "Value",
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

Tenant, Identity Provider, Identity Provider Claim, or Roles not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 409

Identity Provider Claim configuration already exists.

#### 500

Internal server error.
***

## `Delete an existing Identity Provider Claim`

Delete an Identity Provider Claim for an Identity Provider on a Tenant.

### Request

`DELETE api/v1/Tenants/{tenantId}/IdentityProviders/{identityProviderId}/Claims/{identityProviderClaimId}`

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
Guid identityProviderClaimId
```

Id of Identity Provider Claim.

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

Tenant, Identity Provider, or Identity Provider Claim not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

