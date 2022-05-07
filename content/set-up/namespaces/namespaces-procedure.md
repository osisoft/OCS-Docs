---
uid: gpNamespaces
---

# Add a namespace

A namespace is a logical unit of organization for data within a tenant. Before data can be added for a given tenant, a namespace must be created within the scope of the tenant. Follow this procedure to add a namespace to a tenant.

1. In the left pane, select **Data Management** > **Namespaces**.

1. On the `Namespaces` page, select **Add Namespace**.

1. In the `Add Namespace` window, complete the following fields:

 - **Namespace Id** - Enter a namespace Id that meets the following requirements:

    - Contains up to 100 characters.

    - Contains only alphanumeric characters, underscores, dashes, spaces, and periods.

    - Does not contain two consecutive periods.

    - Does not start or end with a period.

    - Does not start with two consecutive underscores.

    - Does not contain leading or trailing whitespaces.
 
 - **Description** - Enter a description up to 1023 characters in length.
 
 - **Region** - Select the region in which to store the data.

   **Note:** Once the namespace is created, the **Namespace Id** and **Region** fields cannot be changed.

1. Select **Add**.

   **Note:** Select a namespace to see the `Details` tab, which displays the following:
   
    - Tenant Id
   
    - Namespace Id

    - Description
    
    - Region 
    
    - State - Shows the status of the namespace. Once the process of creating a namespace and bringing it online is complete, the value changes to *Active*. If the status is not *Active* after creation, refresh the page.
    
    - Type Count - Shows the number of types defined in the namespace. For a new namespace, this is zero.
    
    - Stream Count - Shows the number of streams in the namespace. For a new namespace, this is zero.

## Related links

- [Namespaces](xref:AccountNamespace_1) API
