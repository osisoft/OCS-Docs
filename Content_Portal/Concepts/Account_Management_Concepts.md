---
uid: AccountManagementConcepts
---

# Tenant Management Concepts



## Tenant

A tenant is how OSIsoft Cloud Services (OCS) refers to a customer, client, or organization. Before a customer can use OCS, a tenant must be provisioned for them. A customer will have at least one tenant and could have more than one tenant. Each tenant has at least one identity provider associated with it. Tenants also span regions within OCS. For example, OCS currently has services hosted in two regions, West US, and West Europe. If the tenant is authorized to use multiple regions, they can create resources (for example, namespaces) in each region.

## Namespace

A namespace is a logical unit of organization for data within a tenant. Each tenant may contain more than one namespace. Before any data can be put into OCS for a given tenant, a namespace must be created within the scope of that tenant. When a namespace is created, the region where that namespace will reside (for example, West US) needs to be specified. Once the namespace is created and the necessary resources allocated to support it, any data put into the namespace will reside in the selected region.

When a namespace is created, a set of OSIsoft Cloud Services (OCS) data processing resources (for example, SDS and Asset service), along with the associated storage resources, are allocated to support that namespace. Each namespace is distinct and separate from other namespaces and, therefore, they isolate the resources contained within it. The resources are scoped to the namespace. Therefore, you can create an SdsType or an SdsStream object with the same name in two different namespaces.

Any data stored within a namespace is tied to that namespace, along with the region where the namespace was allocated. OCS does not currently provide a mechanism to directly transfer data from one namespace (or region) to any other namespace (or region). To migrate data between namespaces, and thus between namespaces in different regions, the data must be exported from the source namespace in OCS, then imported into the destination namespace.

## User

Authentication of individuals is performed by the identity provider associated with the tenant. When a user logs in to OCS, they authenticate themselves with an identity provider such as Google or Azure Active Directory. The identity provider authenticates the user against the credentials in its database. Upon successful authentication, it passes a token back to OCS granting the user access.

A user’s access to an OCS object is determined by the roles they are assigned and the corresponding Access Control Lists.  See [Roles](#roles) for more information.

## Client

Clients are applications and adapters, acting on behalf of users, that allow for programmatic access to the OCS APIs. The following client types are supported in OCS:

- Client credential clients &#150; Used for server-to-server communications without the presence or intervention of a user. Examples include OSIAdapter or Edge Data Store sending data to OCS. The client credentials client is issued a client ID and secret. Once authenticated, it is granted an access token with a defined lifetime. The tokens may either be short-lived access tokens or longer-lived refresh tokens that allow the client to request new access tokens. 
- Authorization code clients &#150; Used by web-based applications, native mobile applications, and desktop applications that access OCS, this client type requires user interaction. Users authenticate with the Identity Provider. This client supports silent refresh, which allows the user to automatically receive a new access token, providing for uninterrupted access to the application.
- Hybrid clients &#150; Used by thick client applications, this client requires user interaction. The user authenticates with the Identity Provider. Once the user is authenticated, then the server-side client steps in and server-to-server communication commences. Refresh tokens and access tokens are granted to the server-side client, requiring no further user interaction.

Clients are assigned roles that define their access to OCS objects. See [Roles](#roles) for more information. 

## <a name="roles"></a> Roles

Roles, in combination with Access Control Lists (ACL), determine the level of access to OCS objects. The tenant administrator creates roles for the users and clients that will access OCS and assigns the appropriate roles to them. Additionally, the administrator creates an ACL for each OCS object (namespaces, streams, and so on) that defines access permissions for each type of role. Users and clients are granted access permissions to OCS objects based on their assigned roles and the corresponding ACLs. 

OCS provides two built-in roles:

- Account member &#150; Assigned to every user and client credentials client. Users and clients assigned this role can access objects or information of which they are the owner.
- Account administrator &#150; Role with the highest privileges, the tenant Administrator can create and delete users, clients, and secrets.



