---
uid: gsNamespaces
---

# Get started with namespaces

The first task is to create a namespace, a logical unit of organization for data within a tenant. For more information on namespaces, see the following topics:

- [Namespaces](xref:ccNamespaces)

- [Namespaces best practices](xref:bpNamespaces)

Creating a namespace is a resource-intensive operation. Therefore, you may prefer to use an existing namespace. In this procedure, the ID assigned to the namespace is *MyData*. Throughout the get started exercises, we refer to the namespace with this name. Substitute MyData with the name of an existing namespace or any other name you prefer.

To create the *MyData* namespace, follow these steps:

1. In the left pane, select **Data Management** > **Namespaces**.

1. In the `Add Namespace` window, complete the following fields, and then select **Add**:

  - **Namespace Id** - Enter *MyData* for the namespace Id.
  
  - **Description** - Enter a description for the namespace.
  
  - **Region** - Select a region. 

   **Note:** Once the namespace is created, the **Namespace Id** and **Region** fields cannot be changed.

1. To see information about the namesplace, select the namespace, and then select the **Details** tab.  

   - The tab shows the tenant Id, namespace Id, description, and region of the namespace. It also displays zero (0) in the **Type Count** and **Stream Count** fields.

   - The details window shows the **State** field, which indicates the status of the namespace. Once the process of creating a namespace and bringing it online is complete, the value of the **State** field changes to *Active*. If the status does not display as *Active*, close the window and refresh the page. 

    **Note:** It will take some time for the namespace to be created. 

   <!-- LA: What is the status while the namespace is being set up? Can we give them an estimate of how long it might take for the namespace status to change to Active? Follow up with Derek. -->

1. To edit the **Description** field, Select the namespace in the list, and then select **Edit Namespace**.  

   **Note:** The only field you can edit is the **Description** field.

1. Make any changes to the description and select **Save**.

### How to manage permissions on the namespace

<!-- DB: I think it makes sense to have that discussion as part of the Roles discussion, since that's the explicit purpose of Roles. But agreed it shouldn't be repeated in every page. --> 
<!-- LA: I will make a pass through all the topics once we've created the Roles topic. -->

Access control is managed by assigning permissions to roles. Each role is granted (Allow) or denied (Deny) permission to perform an access operation (read, write, delete, or manage permissions). Users are assigned to a role that determines their access to resources. 

**Note:** The remaining steps are optional. 

1. Select **Manage Permissions**.

1. In the **Selected role** field, select **Tenant Member** from the dropdown list.

1. To give the tenant member write permissions, select the **Allow** checkbox for the Write access type.

1. Select **Save**.

## Next step

Continue with [Get started with connections](xref:gsConnections).
