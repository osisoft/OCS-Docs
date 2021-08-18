---
uid: bpNamespaces
---

# Namespaces best practices

OSIsoft recommends using one of the following strategies when creating namespaces:

- Use Case 1 &ndash; Create a separate namespace for each environment, for example, Production, Development, Staging, and so on.
- Use Case 2 &ndash; Create a separate namespace for each end-user customer.

The first use case is recommended for tenants where all the data belongs to one organization. Generally, it is not good practice to create separate namespaces for data that will later need to be used together.  

The second use case may be preferable if you are providing a service to multiple end-user customers that use OSIsoft Cloud Services as a backend. This strategy makes it easier to avoid naming conflicts for end-users. It can also make it easier to manage security and assign permissions. However, it is important to note that security on a namespace is not automatically inherited by the objects and collections within it. If your organization has internal data that does not belong to an end-user customer, you may want to consider combining both strategies. Create separate namespaces for each customer and one namespace for internal use that includes your Production, Development, and Staging environments.
