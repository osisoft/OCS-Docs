---
uid: accountNamespace
---

Namespace
=======================================================

A Namespace is a collection of Data Streams. Test.

	For HTTP requests and responses, the Namespace object has the following properties and JSON-serialized body: 

#### NamespaceObj 

``string Id``
	Name of this Namespace. Unique within a Tenant's Namespaces.
``string TenantId``
	GUID of the Tenant that this Namespace corresponds to
``string Description``
	Description of this Namespace.
``string TierId``
	Id of the Tier that this Namespace is associated with.
``int32 ThroughputUnits``
	Number of Throughput units for this Namespace.
``int32 StorageUnits``
	Number of Storage units for this Namespace.
``NamespaceProvisioningState State``
	Current state of this Namespace.
``OwnerTrustee Owner``
	Owner [Trustee](xref:accessControl#trusteeobj) of this Namespace.
``AccessControlList AccessControlList``
	Access Control List.

.. highlight:: C#

    	HTTP/1.1 200
    	Content-Type: application/json

     {
    	"Id": "id",
    	"TenantId": "tenantid",
    	"Description": "description",
    	"TierId": "tierid",
    	"ThroughputUnits": 0,
    	"StorageUnits": 0,
    	"State": 0,
    	"Owner":  {
    		"Type": 2,
    		"TenantId": "string",
    		"ApplicationId": "string"
    	 },
    	"AccessControlList":  {
    		"RoleTrusteeAccessControlEntries": []
    	 }
     }

**********************

``GetAll()``
--------------------------------------------------------------------

Returns all [Namespaces](#namespaceobj) owned by the specified tenant that the caller has access to.

**Http**

    	GET api/Tenants/{tenantId}/Namespaces

**Parameters**

``string tenantId``
	The [Tenant](xref:accountTenant#tenantobj) identifier for the request.

**Security**  
A [Namespace](#namespaceobj) can only be retrieved if the current principle has Read access.

**Returns**  
An array of all [Namespace](#namespaceobj) objects for the specified tenantId that the caller has access.

**********************

``GetNamespaceById()``
--------------------------------------------------------------------

Returns the Namespace with the specified Id.

**Http**

    	GET api/Tenants/{tenantId}/Namespaces/{namespaceId}

**Parameters**

``string tenantId``
	The account identifier for the request
``string namespaceId``
	The Namespace identifier for this request

**Security**  
A [Namespace](#namespaceobj) can only be retrieved if the current principle has Read access.

**Returns**  
A [Namespace](#namespaceobj) object with the specified namespaceId

**********************

``Create()``
--------------------------------------------------------------------

Creates a namespace.

**Http**

    	POST api/Tenants/{tenantId}/Namespaces

**Parameters**

``string tenantId``
	The idenfifier for the account the namespace is to be created for.
``Namespace namespaceObj``
	The [Namespace](#namespaceobj) to be created.

**Security**  
A [Namespace](#namespaceobj) can only be create if the current principle has Write access.

**Returns**  
The created [Namespace](#namespaceobj) object

**********************

``Update()``
--------------------------------------------------------------------

Updates Namespace information - Description, TierId, AccessControl, and Owner.

**Http**

    	PUT api/Tenants/{tenantId}/Namespaces/{namespaceId}

**Parameters**

``string tenantId``
	The identifier of Namespace's Account.
``string namespaceId``
	The identifier for the Namespace to update.
``Namespace newProperties``
	The new details to store for the Namespace.

**Security**  
A [Namespace](#namespaceobj) can only be updated if the current principle has Write access.
            The AccessControlList and Owner can only be updated if the current principle has ManageAccessControl access.

**Returns**  
The updated [Namespace](#namespaceobj).

**********************

``Delete()``
--------------------------------------------------------------------

Deletes a namespace.

**Http**

    	DELETE api/Tenants/{tenantId}/Namespaces/{namespaceId}

**Parameters**

``string tenantId``
	The identifier of namespace's account
``string namespaceId``
	The identifier of the namespace to be deleted

**Security**  
A [Namespace](#namespaceobj) can only be deleted if the current principle has Delete access.

**Returns**  
Nothing is returned

**********************
