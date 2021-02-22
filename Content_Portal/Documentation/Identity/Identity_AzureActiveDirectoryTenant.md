---
uid: identityAzureActiveDirectoryTenant
---

# Azure Active Directory Tenant

An Azure Active Directory tenant is used to map an existing [Azure Active Directory](https://azure.microsoft.com/en-us/services/active-directory/). Tenant from Azure to OSIsoft Cloud Services. We only allow one Azure Active Directory tenant per OSIsoft Cloud Services tenant.

## Properties

For HTTP requests and responses, the AzureActiveDirectoryTenant object has the following properties and JSON-serialized body: 

Property Name | Data Type | Description
 --- | --- | ---
Id | string | Id of an Azure Active Directory tenant.
ConsentState | ConsentState | Consent State of Azure Active Directory tenant. Can be: NotConsented (0), Consented (1).

### Serialized Model

```json
{
  "Id": "Id",
  "ConsentState": 0
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

## `Add Azure Active Directory Tenant to OCS Tenant`

Add an Azure Active Directory tenant to the OSIsoft Cloud Services tenant.

### Request

`POST api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OSIsoft Cloud Services tenant.

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Id or Domain Name of Azure Active Directory tenant.

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

OSIsoft Cloud Services tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 409

Id of Azure Active Directory tenant. is already in use on the specified tenant.

#### 500

Internal server error.
***

## `Get all Azure Active Directory Tenants from OCS Tenant`

Get all Azure Active Directory tenants from an OSIsoft Cloud Services tenant.

### Request

`GET api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OSIsoft Cloud Services tenant.

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

Number of Azure Active Directory tenants to skip.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of Azure Active Directory tenants to return.

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

## `Get Azure Active Directory Tenant from OCS Tenant`

Get Azure Active Directory tenant from an OSIsoft Cloud Services tenant.

### Request

`GET api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OSIsoft Cloud Services tenant.

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Id of Azure Active Directory tenant.

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

OSIsoft Cloud Services tenant not found.

#### 500

Internal server error.
***

## `Remove Azure Active Directory Tenant from OCS Tenant`

Remove Azure Active Directory tenant from an OSIsoft Cloud Services tenant.

### Request

`DELETE api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OSIsoft Cloud Services tenant.

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Id of Azure Active Directory tenant to remove.

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

OSIsoft Cloud Services tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

## `Send Consent Email for Azure Active Directory Tenant`

Send consent for an Azure Active Directory tenant. OSIsoft Cloud Services needs to be granted
            permission to interact with the Azure Active Directory tenant. Otherwise, users from this Azure Active Directory tenant
            cannot accept invitations from OSIsoft Cloud Services and log in. You can read more about this
            [here](https://pisquare.osisoft.com/docs/DOC-3986-msa-consent-for-azure-active-directory).

### Request

`POST api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}/SendConsent`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OSIsoft Cloud Services tenant.

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Id of Azure Active Directory tenant.

```csharp
[FromBody]
[Required]
ConsentInformation consentInformation
```

ConsentInformation object.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
AzureActiveDirectoryConsentEmail | string | Yes | Address to email consent.            Only Azure Active Directory Admins have permission to consent to            being allowed to interact with the tenant. The email            does not have to be sent to an Admin.
AzureActiveDirectoryConsentGivenName | string | Yes | Preferred name to use in the consent email.
AzureActiveDirectoryConsentSurname | string | Yes | Preferred surname to use in the consent email.
AzureActiveDirectoryTenant | string | Yes | Azure Active Directory Domain Name (for example: mydomain.onmicrosoft.com).



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

OSIsoft Cloud Services tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 500

Internal server error.
***

## `Get Azure Active Directory Tenant in Tenant`

Validate that Azure Active Directory tenant exists in this OSIsoft Cloud Services tenant.
            This endpoint is identical to the GET one but
            it does not return any objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OSIsoft Cloud Services tenant.

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Id of Azure Active Directory tenant.

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

OSIsoft Cloud Services tenant not found.

#### 500

Internal server error.
***

## `Get Total Count of Azure Active Directory Tenant in Tenant`

Return total number of Azure Active Directory tenants in a OSIsoft Cloud Services tenant. This endpoint is identical to the GET one but it does not return any objects in the body.

### Request

`HEAD api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants`

### Parameters

```csharp
[Required]
string tenantId
```

Id of OSIsoft Cloud Services tenant.

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

OSIsoft Cloud Services tenant not found.

#### 500

Internal server error.
***

