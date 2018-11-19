---
uid: accountApplications
---

Applications
=======================================================

***

## `CreateClientApiKeyForApplication()`

Create a `ClientApiKeySet` for the specified application.

**Http**

`POST api/Tenants/{tenantId}/ClientApiKeySets/Keys`

**Parameters**

```csharp
string tenantId
```
ID of the tenant the application belongs to.
```csharp
string applicationId
```
ID of the application for this request
```csharp
string description
```
Description of the `ClientApiKeySet`


**Security**

Allowed by Account Administrator [`Role`](xref:AccountRole)

**Returns**

The created `ClientApiKeySet`

***

## `GetClientApiKeyCollectionFromApplication()`

Get the `ClientApiKeyCollection` for the specified applicaiton.

**Http**

`GET api/Tenants/{tenantId}/ClientApiKeySets/Keys`

**Parameters**

```csharp
string tenantId
```
ID of the tenant the application belongs to.
```csharp
string applicationId
```
ID of the application for this request


**Security**

Allowed by Account Administrator [`Role`](xref:AccountRole)

**Returns**

`ClientApiKeyCollection` for the specified applicaiton.

***

## `DeleteClientApiKeyFromApplication()`

Delete a specified `ClientApiKeySet`.

**Http**

`DELETE api/Tenants/{tenantId}/ClientApiKeySets/Keys`

**Parameters**

```csharp
string tenantId
```
ID of the tenant the application belongs to.
```csharp
string applicationId
```
ID of the application for this request
```csharp
string keyId
```
ID of the `ClientApiKeySet` to be deleted.


**Security**

Allowed by Account Administrator [`Role`](xref:AccountRole)

**Returns**

HTTP status code - 200 OK if the `ClientApiKeySet` was deleted.

***

## `GetExternalApplicationsAsync()`

Lists all applications from a customer's directory

**Http**

`GET api/Tenants/{tenantId}/externalapplications`

**Parameters**

```csharp
string tenantId
```
ID of the tenant the application belongs to
```csharp
string skip
```
Number of applications to skip for paging purposes.
```csharp
string count
```
Maximum number of applications to return in this page.
```csharp
string query
```
Prefix match to filter applications by applicationId or display name


**Security**

Allowed by Account Administrator [`Role`](xref:AccountRole)

**Returns**

An array of `Application` objects that could be added to this account.

***

## `RegisterClientApplicationAsync()`

Registers the application with cloud services

**Http**

`POST api/Tenants/{tenantId}/Applications`

**Parameters**

```csharp
string tenantId
```
ID of the tenant the application belongs to
```csharp
Application application
```
`Application` object with required properties.


**Security**

Account admin or Cluster operator

**Returns**

The `Application` for a tenant

## Properties

**Notes**

For HTTP requests and responses, the Application object has the following properties and JSON-serialized body: 

```csharp
string Id
```
Application Identifier

```csharp
string TenantId
```
Tenant Id

```csharp
string Name
```
Application Display Name

```csharp
[Role] Roles
```
List of roles for the application

```json
{
	"Id": "id",
	"TenantId": "tenantid",
	"Name": "name",
	"Roles": []
}
```

***
