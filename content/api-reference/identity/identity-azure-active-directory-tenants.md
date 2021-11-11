---
uid: identity-azure-active-directory-tenants

---

# Azure Active Directory Tenants
An Azure Active Directory tenant is used to map an existing [Azure Active Directory](https://azure.microsoft.com/en-us/services/active-directory/) tenant from Azure to OSIsoft Cloud Services (OCS). We only allow one Azure Active Directory tenant per OCS tenant.

## `Get AAD Tenant from OCS Tenant`

<a id="opIdAzureActiveDirectoryTenants_Get AAD Tenant from OCS Tenant"></a>

Returns Azure Active Directory tenant from an OCS tenant.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{aadTenantId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>OCS tenant identifier.<br/><br/>`string aadTenantId`
<br/>Azure Active Directory tenant identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AzureActiveDirectoryTenant](#schemaazureactivedirectorytenant)|AzureActiveDirectory specified|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|OCS tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([AzureActiveDirectoryTenant](#schemaazureactivedirectorytenant))

```json
{
  "Id": "string",
  "ConsentState": 0,
  "Domain": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get AAD Tenant in Tenant`

<a id="opIdAzureActiveDirectoryTenants_Get AAD Tenant in Tenant"></a>

Validates that Azure Active Directory tenant exists in this OCS tenant. This method is identical to the GET method but it does not return any objects in the body.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{aadTenantId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>OCS tenant identifier.<br/><br/>`string aadTenantId`
<br/>Azure Active Directory tenant identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Header for specified Azure Active Directory tenant|
|400|None|Missing or invalid inputs.|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|OCS tenant not found|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Add AAD Tenant to OCS Tenant`

<a id="opIdAzureActiveDirectoryTenants_Add AAD Tenant to OCS Tenant"></a>

Adds an Azure Active Directory tenant to the OCS tenant.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{aadTenantId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>OCS tenant identifier.<br/><br/>`string aadTenantId`
<br/>Azure Active Directory tenant identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|201|[AzureActiveDirectoryTenant](#schemaazureactivedirectorytenant)|AzureActiveDirectoryTenant object created|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|OCS tenant not found|
|408|[ErrorResponse](#schemaerrorresponse)|Operation timed out.|
|409|[ErrorResponse](#schemaerrorresponse)|Azure Active Directory tenant identifier is already in use on the specified Tenant.|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 201 Response ([AzureActiveDirectoryTenant](#schemaazureactivedirectorytenant))

```json
{
  "Id": "string",
  "ConsentState": 0,
  "Domain": "string"
}
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Remove AAD Tenant from OCS Tenant`

<a id="opIdAzureActiveDirectoryTenants_Remove AAD Tenant from OCS Tenant"></a>

Removes Azure Active Directory tenant from an OCS tenant. This is not supported currently.

<h3>Request</h3>

```text 
DELETE /api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{aadTenantId}
```

<h4>Parameters</h4>

`string tenantId`
<br/>OCS tenant identifier.<br/><br/>`string aadTenantId`
<br/>Azure Active Directory tenant identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|string|NotSupportedException|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `List All AAD Tenants from OCS Tenant`

<a id="opIdAzureActiveDirectoryTenants_List All AAD Tenants from OCS Tenant"></a>

Returns all Azure Active Directory tenants from an OCS tenant.

<h3>Request</h3>

```text 
GET /api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants
?query={query}&skip={skip}&count={count}
```

<h4>Parameters</h4>

`string tenantId`
<br/>OCS tenant identifier.<br/><br/>
`[optional] string query`
<br/>(Not supported) Search string identifier.<br/><br/>`[optional] integer skip`
<br/>Parameter representing the zero-based offset of the first object to retrieve.  If unspecified, a default value of 0 is used.<br/><br/>`[optional] integer count`
<br/>Parameter representing the maximum number of objects to retrieve. If unspecified, a default value of 100 is used.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|[AzureActiveDirectoryTenant](#schemaazureactivedirectorytenant)[]|List of AzureActiveDirectoryTenants found|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|or|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h4>Example response body</h4>

> 200 Response ([AzureActiveDirectoryTenant](#schemaazureactivedirectorytenant)[])

```json
[
  {
    "Id": "string",
    "ConsentState": 0,
    "Domain": "string"
  }
]
```

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Get Total Count of AAD Tenant in Tenant`

<a id="opIdAzureActiveDirectoryTenants_Get Total Count of AAD Tenant in Tenant"></a>

Returns total number of Azure Active Directory tenants in a OCS tenant. This method is identical to the GET method but it does not return any objects in the body.

<h3>Request</h3>

```text 
HEAD /api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants
```

<h4>Parameters</h4>

`string tenantId`
<br/>Tenant identifier.<br/><br/>

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|200|None|Headers for AzureActiveDirectoryTenants found|
|400|None|Missing or invalid inputs.|
|401|None|Unauthorized.|
|403|None|Forbidden.|
|404|None|OCS tenant not found|
|500|None|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---

## `Send Consent Email for AAD Tenant`

<a id="opIdAzureActiveDirectoryTenants_Send Consent Email for AAD Tenant"></a>

Sends consent for an Azure Active Directory tenant. OCS needs to be granted permission to interact with the Azure Active Directory tenant. Otherwise, users from this Azure Active Directory tenant cannot accept invitations from OCS and log in.

<h3>Request</h3>

```text 
POST /api/v1/Tenants/{tenantId}/AzureActiveDirectoryTenants/{aadTenantId}/SendConsent
```

<h4>Parameters</h4>

`string tenantId`
<br/>OCS tenant identifier.<br/><br/>`string aadTenantId`
<br/>Azure Active Directory tenant identifier.<br/><br/>

<h4>Request Body</h4>

ConsentInformation object<br/>

```json
{
  "AzureActiveDirectoryConsentEmail": "user@example.com",
  "AzureActiveDirectoryConsentGivenName": "string",
  "AzureActiveDirectoryConsentSurname": "string",
  "AzureActiveDirectoryTenant": "string",
  "AzureActiveDirectoryConsentTypes": "string"
}
```

<h3>Response</h3>

|Status Code|Body Type|Description|
|---|---|---|
|204|None|No content|
|400|[ErrorResponse](#schemaerrorresponse)|Missing or invalid inputs.|
|401|[ErrorResponse](#schemaerrorresponse)|Unauthorized.|
|403|[ErrorResponse](#schemaerrorresponse)|Forbidden.|
|404|[ErrorResponse](#schemaerrorresponse)|OCS tenant not found|
|500|[ErrorResponse](#schemaerrorresponse)|Internal server error.|

<h3>Authorization</h3>

Allowed for these roles: 
<ul>
<li>Tenant Administrator</li>
</ul>

---
## Definitions

### AzureActiveDirectoryTenant

<a id="schemaazureactivedirectorytenant"></a>
<a id="schema_AzureActiveDirectoryTenant"></a>
<a id="tocSazureactivedirectorytenant"></a>
<a id="tocsazureactivedirectorytenant"></a>

The Azure Active Directory tenant object

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|Id|string|false|true|Azure Active Directory tenant identifier|
|ConsentState|[ConsentState](#schemaconsentstate)|false|false|Consent state of Azure Active Directory tenant. Can be: NotConsented (0), Consented (1).|
|Domain|string|false|true|Azure Active Directory tenant domain name|

```json
{
  "Id": "string",
  "ConsentState": 0,
  "Domain": "string"
}

```

---

### ConsentState

<a id="schemaconsentstate"></a>
<a id="schema_ConsentState"></a>
<a id="tocSconsentstate"></a>
<a id="tocsconsentstate"></a>

Azure Active Directory tenant consent state

<h4>Enumerated Values</h4>

|Property|Value|Description|
|---|---|---|
|NotConsented|0|Azure Active Directory tenant consent has not been completed.|
|Consented|1|Azure Active Directory tenant consent has been completed.|

---

### ErrorResponse

<a id="schemaerrorresponse"></a>
<a id="schema_ErrorResponse"></a>
<a id="tocSerrorresponse"></a>
<a id="tocserrorresponse"></a>

Object returned whenever there is an error

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|OperationId|string|true|false|Operation identifier of action that caused the error|
|Error|string|true|false|Error description|
|Reason|string|true|false|Reason for the error|
|Resolution|string|true|false|Resolution to resolve the error|
|DynamicProperties|object|false|true|Additional properties|

```json
{
  "OperationId": "string",
  "Error": "string",
  "Reason": "string",
  "Resolution": "string",
  "DynamicProperties": {
    "property1": null,
    "property2": null
  },
  "property1": null,
  "property2": null
}

```

---

### ConsentInformation

<a id="schemaconsentinformation"></a>
<a id="schema_ConsentInformation"></a>
<a id="tocSconsentinformation"></a>
<a id="tocsconsentinformation"></a>

The object that holds the information about the recipient of the Azure Active Directory consent email

<h4>Properties</h4>

|Property Name|Data Type|Required|Nullable|Description|
|---|---|---|---|---|
|AzureActiveDirectoryConsentEmail|email|false|true|Email address to send consent|
|AzureActiveDirectoryConsentGivenName|string|false|true|Preferred name to use in the consent email|
|AzureActiveDirectoryConsentSurname|string|false|true|Preferred surname to use in the consent email|
|AzureActiveDirectoryTenant|string|false|true|Azure Active Directory tenant domain name (for example, mydomain.onmicrosoft.com)|
|AzureActiveDirectoryConsentTypes|string|false|true|Semicolon delimited Azure Active Directory consent types. Can be "SignIn" or "SignIn;ReadAllUsersGroups".|

```json
{
  "AzureActiveDirectoryConsentEmail": "user@example.com",
  "AzureActiveDirectoryConsentGivenName": "string",
  "AzureActiveDirectoryConsentSurname": "string",
  "AzureActiveDirectoryTenant": "string",
  "AzureActiveDirectoryConsentTypes": "string"
}

```

---

