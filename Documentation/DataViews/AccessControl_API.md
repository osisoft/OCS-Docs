---
uid: AccessControlApi
---

# AccessControl

APIs for Working with Access Control Objects

***

## `Get Data Views Collection Access Control List`

Get the Data Views collection Access Control List

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/dataviews/`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


### Returns

#### 200

Successfully retrieved the Data Views collection Access Control List.
                 See [Access Control Lists](..\Access_Control.md#access-control-lists) for object structure and more information about ACLs.

#### 403

Unauthorized


#### 500

Internal server error

***

## `Update Data Views Collection Access Control List`

Update the Data Views collection Access Control List

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/accesscontrol/dataviews/`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```

### Parameters from request body: 

Updated Access Control List.
                 See [Access Control Lists](..\Access_Control.md#access-control-lists) for object structure and more information about ACLs.
```csharp
AccessControlList acl [FromBody] [Required] [No Default Value]
```


### Returns

#### 204

Successfully updated the Data Views collection Access Control List


#### 400

Bad request


#### 403

Unauthorized


#### 500

Internal server error

***

## `Get Data View Access Control List`

Get the Data View Access Control List for Data View with specified Id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/accesscontrol`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the Data View Access Control List.
                 See [Access Control Lists](..\Access_Control.md#access-control-lists) for object structure and more information about ACLs.

#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Update Data View Access Control List`

Update the Data View Access Control List for Data View with specified Id

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/accesscontrol`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Updated Access Control List.
                 See [Access Control Lists](..\Access_Control.md#access-control-lists) for object structure and more information about ACLs.
```csharp
AccessControlList acl [FromBody] [Required] [No Default Value]
```


### Returns

#### 204

Successfully updated the Data View Access Control List


#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Get Data View Owner`

Get the Data View owner for Data View with specified Id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/owner`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved the Data View owner.
                 See [Owner](..\Access_Control.md#owner) for object structure more information about Owners.

#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Update Data View Owner`

Update the Data View owner for Data View with specified Id

### Request
`PUT api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/owner`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```

### Parameters from request body: 

Updated owner.
                 See [Owner](..\Access_Control.md#owner) for object structure more information about Owners.
```csharp
Trustee owner [FromBody] [Required] [No Default Value]
```


### Returns

#### 204

Successfully updated the Data View owner


#### 400

Bad request


#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

## `Get Access Rights to Data View`

Get the calling user or client's access rights for Data View with specified Id

### Request
`GET api/tenants/{tenantId}/namespaces/{namespaceId}/dataviews/{id}/accessrights`

### Parameters

Id of tenant
```csharp
string tenantId  [Required] [No Default Value]
```


Id of namespace
```csharp
string namespaceId  [Required] [No Default Value]
```


Id of Data View
```csharp
string id  [Required] [No Default Value]
```


### Returns

#### 200

OK - retrieved access rights for the Data View.
                 See [CommonAccessRightsEnum](..\Access_Control.md#commonaccessrightsenum) for more information about access rights.

```json
{
  "Length": "Int32",
  "LongLength": "Int64",
  "Rank": "Int32",
  "SyncRoot": "Object",
  "IsReadOnly": "Boolean",
  "IsFixedSize": "Boolean",
  "IsSynchronized": "Boolean"
}
```

#### 403

Unauthorized


#### 404

Specified Data View not found


#### 500

Internal server error

***

