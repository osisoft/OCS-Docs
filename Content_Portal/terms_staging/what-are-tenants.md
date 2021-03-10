---
uid: WhatAreTenants
---

# What are tenants?

A tenant is the root-level resource in OSIsoft Cloud Services (OCS), representing a client or organization that owns and manages a collection of OCS resources. Typically, each distinct organization using OCS is a tenant. All your OCS resources exist within the scope of your tenant. 

Each tenant manages the following resources:

- Users who are authorized to access OCS
- Clients that are authorized to access OCS
- Roles that define the level of access to grant to each user or client 
- Namespaces where data is managed (tenants are divided into one or more logical units called namespaces). 

Before your organization uses OCS, OSIsoft provisions a tenant for them. An organization has at least one tenant, and in some cases has more than one. 

# A note about regions

Tenants can span different regions within OCS. For example, OCS currently has services hosted in two regions, West US, and West Europe. If the tenant is authorized to use multiple regions, you can create resources (for example, a namespace) in each region.