---
uid: osisoftCloudServices
---

# OSIsoft Cloud Services

The information in the sections that follow document the APIs and usage for each of the following:

* Management - Use the information in this section to create, manage, and administer your account by assigning users, roles, and namespaces to your tenant.
* Identity - Use the information in this section to create, manage and administer Users and Clients.
* Sequential Data Store (SDS) - Use the information in this section to learn about the OSIsoft Cloud Services Sequential Data Store. The SDS is optimized for sequential data operations.
* Data ingress and OSIsoft Message Format - You use OSIsoft Message Format (OMF) to achieve high-throughput asynchronous data ingress into the OCS Sequential Data Store.
* Data Views - Use the information in this section to create user-selected subsets of data stored in OSIsoft Cloud Services which are mapped into customizable table formats.


## Access to OCS

You must acquire an account before interacting with OCS. If you do not 
have an account, you can request access to OCS at https://cloud.osisoft.com/?signup.


## Architecture

A Tenant represents a client or organization that owns and manages a collection of OSIsoft Cloud Services.

Tenants are divided into one or more logical units called Namespaces. Each Namespace is distinct and separate from 
other Namespaces, with its own instances of the various OSIsoft Cloud Services and data stores. 
Namespaces provide isolation of resources. 

Namespaces are provisioned within a region. The Namespace's services and data stores all exist in the Namespace's region. Resources allocated to a Namespace are isolated to the Namespace's region. For more information on regions see the [Namespace](xref:AccountNamespace_1) documentation.  Isolation provided by Tenants and Namespaces prevents accidental or malicious data access. 

OSIsoft Cloud Services provides data residency via namespaces in the following regions:

| Supported Regions | Geographic Area | Location | 
 | --- | --- | ---  | 
| WestUS | Americas | California | 
| WestEurope | Europe | Netherlands | 

Tenant account information is stored in all regions for read-only purposes. Write operations are only supported through the global base URL. See the [Tenant](xref:AccountTenant) documentation for information on how to access this data.


## OCS API Versioning

New versions of the API are released when major changes occur in the OCS API. When a newer version of the API is released, 
the legacy version of the API will only be supported for a period of time. We encourage all users to switch to the 
newer version as soon as possible. Versions are inline in the routes, following the host:
```text
    api/v{version}/Tenants/{tenantId}/Namespaces/{namespaceId}/...  
```
Where:  
* version is an incrementally (singular) increasing integer value 

* v{version}-preview will be used to expose beta functionality

The currently supported versions are:
* v1
* v1-preview
