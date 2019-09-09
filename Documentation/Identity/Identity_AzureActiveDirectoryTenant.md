---
uid: identityAzureActiveDirectoryTenant
---

# AzureActiveDirectoryTenant

An Azure Active Directory (AAD) Tenant is used to map an existing
            [AAD](https://azure.microsoft.com/en-us/services/active-directory/)
            tenant from Azure to OSIsoft Cloud Services (OCS). We only allow one AAD Tenant
            per OCS Tenant.

## Properties

For HTTP requests and responses, the AzureActiveDirectoryTenant object has the following properties and JSON-serialized body: 

Property | Type | Descriptions
 --- | --- | --- | ---
Id | string | Id of an Azure Active Directory Tenant
ConsentState | ConsentState | Consent State of Azure Active Directory Tenant. Can be: NotConsented (0), Consented (1)

### Serialized Model

```json
{
  "Id": "Id",
  "ConsentState": 0
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

## `Add AAD Tenant to OCS Tenant`

Add an AAD Tenant to the OCS Tenant.

### Request

`POST api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OCS Tenant.

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Id or Domain Name of AAD Tenant.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 201

Created.

##### Type:

 `AzureActiveDirectoryTenant`

```json
{
  "Id": "Id",
  "ConsentState": 0
}
```

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

OCS Tenant not found.

#### 409

Id of AAD Tenant. is already in use on the specified Tenant.

#### 500

Internal server error.
***

## `Get All AAD Tenants from OCS Tenant`

Get all AAD Tenants from an OCS Tenant.

### Request

`GET api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OCS Tenant.

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

Number of AAD tenants to skip.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of AAD tenants to return.

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
    "ConsentState": 0
  },
  {
    "Id": "Id",
    "ConsentState": 0
  }
]
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 403

Forbidden.

#### 500

Internal server error.
***

## `Get AAD Tenant from OCS Tenant`

Get AAD Tenant from an OCS Tenant.

### Request

`GET api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OCS Tenant.

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Id of AAD Tenant.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `AzureActiveDirectoryTenant`

```json
{
  "Id": "Id",
  "ConsentState": 0
}
```

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

OCS Tenant not found.

#### 500

Internal server error.
***

## `Remove AAD Tenant from OCS Tenant`

Remove AAD Tenant from an OCS Tenant.

### Request

`DELETE api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OCS Tenant.

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Id of AAD Tenant to remove.

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 204

Removed.

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

OCS Tenant not found.

#### 500

Internal server error.
***

## `Send Consent Email for AAD Tenant`

Send consent for an AAD Tenant. OCS needs to be granted
            permission to interact with the AAD tenant. Otherwise, users from this AAD Tenant
            cannot accept invitations from OCS and log in. You can read more about this
            [here](https://pisquare.osisoft.com/docs/DOC-3986-msa-consent-for-azure-active-directory)

### Request

`POST api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}/SendConsent`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OCS Tenant.

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Id of AAD Tenant.

```csharp
[FromBody]
[Required]
ConsentInformation consentInformation
```

ConsentInformation object.

Property | Type | Required | Description 
 --- | --- | --- | ---
AzureActiveDirectoryConsentEmail | string | Yes | Address to email consent.            Only AAD Admins have permission to consent to OCS            being allowed to interact with the tenant. The email            does not have to be sent to an Admin.
AzureActiveDirectoryConsentGivenName | string | Yes | Preferred name to use in the consent email.
AzureActiveDirectoryConsentSurname | string | Yes | Preferred surname to use in the email.
AzureActiveDirectoryTenant | string | Yes | AAD Domain Name (e.g. mydomain.onmicrosoft.com)



```json
{
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

#### 204

Removed.

#### 400

Missing or invalid inputs.

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

OCS Tenant not found.

#### 500

Internal server error.
***

## `Validate AAD Tenant in OCS Tenant`

Validate that AAD Tenant exists in this OCS Tenant.
            This endpoint is identical to the GET one but
            it does not return any objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OCS Tenant.

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Id of AAD Tenant.

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

OCS Tenant not found.

#### 500

Internal server error.
***

## `Get Total Count of AAD Tenant in OCS Tenant`

Return total number of AAD tenants in a OCS Tenant. This endpoint
            is identical to the GET one but it does not return any objects
            in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OCS Tenant.

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

OCS Tenant not found.

#### 500

Internal server error.
***

