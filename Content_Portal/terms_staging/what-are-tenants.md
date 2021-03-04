---
uid: WhatAreTenants
---

# What are tenants?

A tenant is the root-level resource in OSIsoft Cloud Services (OCS), representing a client or organization that owns and manages a collection of OCS resources. All OCS resources are scoped to a tenant. Typically, each distinct organization using OCS is a tenant. 

OCS resources scoped to a tenant deal with identity (the digital representation of the user) and access control, enabling OCS to provide specific amount of access to authorized users and clients. 

Every tenant has the following resources they can manage:

- Users who are authorized to access OCS
- Clients who are authorized to access OCS
- Roles that define the level of access to grant to each user or client 
- Namespaces where data is managed. Tenants are divided into one or more logical units called Namespaces. 

Before an organization can use OCS, a tenant must be provisioned for them. An organization will have at least one tenant and could have more than one tenant. Tenants can span different regions within OCS. For example, OCS currently has services hosted in two regions, West US, and West Europe. If the tenant is authorized to use multiple regions, they can create resources (for example, namespaces) in each region.