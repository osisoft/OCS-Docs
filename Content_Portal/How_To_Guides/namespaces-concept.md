---
uid: ccNamespaces
---


# About Namespaces

A namespace is a logical unit of organization for data within a tenant. Each tenant may contain more than one namespace. Before any data can be put into OCS for a given tenant, a namespace must be created within the scope of that tenant. When a namespace is created, the region where that namespace will reside (for example, West US) needs to be specified. Once the namespace is created and the necessary resources allocated to support it, any data put into the namespace will reside in the selected region.

When a namespace is created, a set of OSIsoft Cloud Services (OCS) data processing resources (for example, SDS and Asset service), along with the associated storage resources, are allocated to support that namespace. Each namespace is distinct and separate from other namespaces and, therefore, they isolate the resources contained within it. The resources are scoped to the namespace. Therefore, you can create an SdsType or an SdsStream object with the same name in two different namespaces.

Any data stored within a namespace is tied to that namespace, along with the region where the namespace was allocated. OCS does not currently provide a mechanism to directly transfer data from one namespace (or region) to any other namespace (or region). To migrate data between namespaces, and thus between namespaces in different regions, the data must be exported from the source namespace in OCS, then imported into the destination namespace.

## PI Core Counterpart

In PI Core Services, a namespace is similar to a full PI Server. Much like a PI Server, a namespace has its own resources and it is not typical or easy to use data from multiple namespaces at the same time. It is reasonable for an account to use only one namespace.

## Namespace IDs

The namespace ID must be unique across the tenant.

The namespace ID must meet these requirements:

- Contain 100 or fewer characters
- Can include alphanumeric characters, underscores (\_), dashes (-), spaces, and periods
- Cannot contain two consecutive periods or two consecutive underscores
- Cannot begin or end with a period
- Cannot start with two consecutive underscores <!-- LA: need to verify this with engineering -->
- Cannot include leading or trailing white spaces

## Querying Data Across Namespaces

When querying API endpoints, the namespace ID is part of the URL. The API URL takes the form `https://{server}/api/{version}/Tenants/{tenant id}/Namespaces/{namespace id}`, followed by the API path, such as `/Streams`. Because the namespace is included in the URL, it is not possible to make a single API request for data across multiple namespaces.