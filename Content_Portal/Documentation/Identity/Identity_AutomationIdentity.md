---
uid: identityAutomationIdentity
---

# Automation Identity

APIs for automation identities.

## Properties

For HTTP requests and responses, the AutomationIdentity object has the following properties and JSON-serialized body: 

Property Name | Data Type | Description
 --- | --- | ---
Id | Guid | Automation identity id.
Name | string | The automation identity name.
TenantId | string | The automation identity tenant id.
RoleIds | Guid[] | Role ids associated with this automation identity.
RoleTypeIds | Guid[] | Role type ids associated with this automation identity.
Tags | string[] | Tags associated with this automation identity.

### Serialized model

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "Name": "Name",
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "RoleTypeIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "Tags": [
    "String",
    "String"
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

## `Create an Automation Identity`

Create an automation identity. A non-Administrator caller must have all roles being assigned to the new automation adentity.

### Request

`POST api/v1/Tenants/{tenantId}/AutomationIdentities`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[FromBody]
[Required]
AutomationIdentityCreate automationIdentityCreate
```

New Automation Identity object.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
Name | string | Yes | The automation identity name.
RoleIds | Guid[] | Yes | Role ids associated with this automation identity.
Tags | string[] | No | Tags associated with this automation identity.



```json
{
  "Name": "Name",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "Tags": [
    "String",
    "String"
  ]
}
```

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 201

Created.

##### Type:

 `AutomationIdentity`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "Name": "Name",
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "RoleTypeIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "Tags": [
    "String",
    "String"
  ]
}
```

#### 400

Bad Request.

#### 401

Unauthorized.

#### 403

Forbidden. A non-Administrator caller must have all roles being assigned to the new automation identity.

#### 404

Not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 409

Already exists.

#### 500

Internal server error.
***

## `Get an Automation Identity`

Returns automation identity object.

### Request

`GET api/v1/Tenants/{tenantId}/AutomationIdentities/{automationIdentityId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid automationIdentityId
```

Id of automation identity.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `AutomationIdentity`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "Name": "Name",
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "RoleTypeIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "Tags": [
    "String",
    "String"
  ]
}
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Not found.

#### 500

Internal server error.
***

## `Get Header for Automation Identity`

Validate that an automation identity exists in tenant.

### Request

`HEAD api/v1/Tenants/{tenantId}/AutomationIdentities/{automationIdentityId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid automationIdentityId
```

Id of automation identity.

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

Automation identity or tenant not found.

#### 500

Internal server error.
***

## `Get Automation Identities from a Tenant`

Returns automation identity objects.

### Request

`GET api/v1/Tenants/{tenantId}/AutomationIdentities`

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
string[] tag
```

Only return automation identities that have at least one of these tags.

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

Number of automation identities to skip. Ignored if a list of ids is passed.

```csharp
[FromQuery]
[Optional]
[Default = 100]
int32 count
```

Maximum number of automation identities to return. Ignored if a list of ids is passed.

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
    "Name": "Name",
    "TenantId": "00000000-0000-0000-0000-000000000000",
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ],
    "RoleTypeIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ],
    "Tags": [
      "String",
      "String"
    ]
  },
  {
    "Id": "00000000-0000-0000-0000-000000000000",
    "Name": "Name",
    "TenantId": "00000000-0000-0000-0000-000000000000",
    "RoleIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ],
    "RoleTypeIds": [
      "00000000-0000-0000-0000-000000000000",
      "00000000-0000-0000-0000-000000000000"
    ],
    "Tags": [
      "String",
      "String"
    ]
  }
]
```

#### 401

Unauthorized.

#### 403

Forbidden.

#### 404

Not found.

#### 500

Internal server error.
***

## `Get Total Count of Automation Identities from Tenant`

Return total number of automation identities in tenant in the Total-Count header.

### Request

`HEAD api/v1/Tenants/{tenantId}/AutomationIdentities`

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
string[] tag
```

Only count automation identities that have at least one of these tags.

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

Automation identity or tenant not found.

#### 500

Internal server error.
***

## `Delete an Automation Identity`

Delete an automation identity. A non-Administrator caller must have all roles belonging to the automation identity being deleted.

### Request

`DELETE api/v1/Tenants/{tenantId}/AutomationIdentities/{automationIdentityId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid automationIdentityId
```

Id of automation identity.

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 204

Deleted.

#### 401

Unauthorized.

#### 403

Forbidden. A non-Administrator caller must have all roles belonging to the automation identity being deleted.

#### 404

Automation identity or tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

## `Update Automation Identity`

Update a automation identity. A non-Administrator caller must have all roles belonging to the existing automation identity, as well as any roles being added.

### Request

`PUT api/v1/Tenants/{tenantId}/AutomationIdentities/{automationIdentityId}`

### Parameters

```csharp
[Required]
string tenantId
```

Id of tenant.

```csharp
[Required]
Guid automationIdentityId
```

Id of automation identity.

```csharp
[FromBody]
[Required]
AutomationIdentityUpdate automationIdentityUpdate
```

Automation identity object. Properties that are not set or are null will not be changed.

Property Name | Data Type | Required | Description 
 --- | --- | --- | ---
Name | string | No | The automation identity name.
RoleIds | Guid[] | No | Role ids associated with this automation identity.
Tags | string[] | No | Tags associated with this automation identity.



```json
{
  "Name": "Name",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "Tags": [
    "String",
    "String"
  ]
}
```

### Security

Allowed for these roles:

- `Account Member`
- `Account Administrator`

### Returns

#### 200

Success.

##### Type:

 `AutomationIdentity`

```json
{
  "Id": "00000000-0000-0000-0000-000000000000",
  "Name": "Name",
  "TenantId": "00000000-0000-0000-0000-000000000000",
  "RoleIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "RoleTypeIds": [
    "00000000-0000-0000-0000-000000000000",
    "00000000-0000-0000-0000-000000000000"
  ],
  "Tags": [
    "String",
    "String"
  ]
}
```

#### 401

Unauthorized.

#### 403

Forbidden. A non-Administrator caller must have all roles belonging to the existing automation identity, as well as any roles being added.

#### 400

Missing or invalid inputs.

#### 404

Automation identity or tenant not found.

#### 405

Method not allowed at this base URL. Try the request again at the Global base URL.

#### 408

Operation timed out.

#### 500

Internal server error.
***

