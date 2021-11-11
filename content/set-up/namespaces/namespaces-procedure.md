---
uid: gpNamespaces
---

# Add a namespace

A namespace is a logical unit of organization for data within a tenant. Before data can be added for a given tenant, a namespace must be created within the scope of the tenant. See the following topics for more information about namespaces:

- [Namespaces](xref:ccNamespaces)
- [Namespaces best practices](xref:bpNamespaces)

## Procedure

1. In the left pane, select **Data Management** > **Namespaces**.

3. In the **Namespace Id** field, enter the namespace Id, enter a description, and select a region. 

   **Note:** Once the namespace is created, the **Namespace Id** and **Region** fields cannot be changed.

4. Click **Add**.

   **Note:** Click **Display Details** in the menu bar to see the following information about the namespace:

    - The window shows the tenant Id, namespace Id, description, and region of the namespace. It also displays zero (0) in the **Type Count** and **Stream Count** fields.  
    - The details window shows the **State** field, which indicates the status of the namespace. Once the process of creating a namespace and bringing it online is complete, the value of the **State** field changes to *Active*. If the status does not display as *Active*, close the window and refresh the page. 

## Related links

- [Namespaces](xref:AccountNamespace_1) API
