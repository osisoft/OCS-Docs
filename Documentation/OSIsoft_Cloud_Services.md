---
uid: osisoftCloudServices
---

# OSIsoft Cloud Services

The information in the sections that follow document the APIs and usage for each of the following:

* Management - Use the information in this section to create, manage, and administer your account by assigning users, roles, 
  and namespaces to your tenant.
* Sequential Data Store (SDS) - Use the information in this section to learn about the OSIsoft Cloud Services Sequential Data 
  Store. The SDS is optimized for sequential data operations.
* Data ingress and OSIsoft Message Format - You use OSIsoft Message Format (OMF) to achieve high-throughput asynchronous 
  data ingress into the OCS Sequential Data Store. 


## Access to OCS

You must acquire a Tenant, security credentials, and a Namespace before interacting with the Data Store. If you do not 
have a Tenant, you can request access to the OCS Preview at [OSIsoft Cloud Services](mailto://cloudservices@osisoft.com).

The OCS Preview program is limited; contacting OSIsoft does not assure participation.

If you are selected to participate in the preview, you will receive an email notifying you of the name of your Tenant. 
Use the credentials you were provided to sign into the portal. Signing in grants you access 
to additional functionality.


## Architecture

A Tenant represents a client or organization that owns and manages a collection of OSIsoft Cloud Services, including 
the Sequential Data Store. 

Tenants are divided into one or more logical units called Namespaces. Each Namespace is distinct and separate from 
other Namespaces, with its own instances of the various OSIsoft Cloud Services and data stores. 
Namespaces provide isolation of resources. 

Isolation provided by Tenants and Namespaces prevents accidental or malicious data access. 

## OCS API Versioning

New versions of the API are released when major changes occur in the OCS API. When a newer version of the API is released 
the legacy version of the API will only be supported for a period of time. We encourage all users to switch the 
newer version as soon as possible. Versions are inline in the routes, following the host:

    api/v{version}/Tenants/{tenantId}/Namespaces/{namespaceId}/...  

Where:  
* version is an incrementally (singular) increasing integer value 

* v{version}-preview will be used to expose beta functionality

The currently supported versions are:
* v1
* v1-preview

