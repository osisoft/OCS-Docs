---
uid: identityAzureActiveDirectoryTenant
---

# AzureActiveDirectoryTenant

APIs for creating, getting, updating, and deleting Azure Active Directory Tenant for a Tenant

## Properties

For HTTP requests and responses, the AzureActiveDirectoryTenant object has the following properties and JSON-serialized body: 

Property | Type | Descriptions
 --- | --- | ---
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

## `Add Azure Active Directory Tenant`

Add Azure Active Directory Tenant to a Tenant

### Request

`POST api/v1-preview/Tenants/{tenantId}/AzureActiveDirectoryTenants`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Azure Active Directory Tenant Id or Domain Name to add

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 201

Created

##### Type:

 `AzureActiveDirectoryTenant`

```json
{
  "Id": "Id",
  "ConsentState": 0
}
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Tenant not found

#### 409

Azure Active Directory Tenant Id is already in use on the specified Tenant

#### 500

Internal server error
***

## `Get All Azure Active Directory Tenants`

Get all Azure Active Directory Tenants for a Tenant

### Request

`GET api/v1-preview/Tenants/{tenantId}/AzureActiveDirectoryTenants`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant

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

Max number of providers to return

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `List[AzureActiveDirectoryTenant]`

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

Unauthorized

#### 403

Forbidden

#### 403

Forbidden

#### 500

Internal server error
***

## `Get Azure Active Directory Tenant`

Get Azure Active Directory Tenant from a tenant

### Request

`GET api/v1-preview/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Azure Active Directory Tenant Id to remove

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 200

Success

##### Type:

 `AzureActiveDirectoryTenant`

```json
{
  "Id": "Id",
  "ConsentState": 0
}
```

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Tenant not found

#### 500

Internal server error
***

## `Remove Azure Active Directory Tenant From Tenant`

Remove Azure Active Directory Tenant from a tenant

### Request

`DELETE api/v1-preview/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Azure Active Directory Tenant Id to remove

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 204

Removed

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Tenant not found

#### 500

Internal server error
***

## `Send Consent for Azure Active Directory Tenant`

Send consent for an Azure Active Directory Tenant

### Request

`POST api/v1-preview/Tenants/{tenantId}/AzureActiveDirectoryTenants/{azureActiveDirectoryTenantId}/SendConsent`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant

```csharp
[Required]
string azureActiveDirectoryTenantId
```

Azure Active Directory Tenant Id to remove

```csharp
[FromBody]
[Required]
ConsentInformationDto consentInformationDto
```

Consent information used to send

```json
{
  "AzureActiveDirectoryConsentEmail": "user@company.com",
  "AzureActiveDirectoryConsentGivenName": "Name",
  "AzureActiveDirectoryConsentSurname": "Surname"
}
```

### Security

Allowed for these roles:

- `Account Administrator`

### Returns

#### 204

Removed

#### 400

Missing or invalid inputs

#### 401

Unauthorized

#### 403

Forbidden

#### 404

Tenant not found

#### 500

Internal server error
***

