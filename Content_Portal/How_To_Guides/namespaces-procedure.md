---
uid: GSCreateNamespaces
---


# Create a Namespace

## Procedure

Creating a namespace is a resource-intensive operation. Therefore, you may prefer to use an existing namespace. In this procedure, the ID assigned to the namespace is QuickStart. Throughout the Getting Started, we will refer to the namespace with this name. Substitute "QuickStart" with the name of an existing namespace or any other name you prefer.

1. Click the ![Menu icon](images\menu-icon.png) icon and click **Namespaces** (under Data Management).


2. In the Manage Namespaces pane, click **Add Namespace**. 

3. In the Namespace Id field, enter _QuickStart_ for your namespace ID, enter a description, and select a region. 

   Note: Once the namespace is created, the **Namespace Id** and **Region** cannot be changed.

   When you are done, click **Add**.

4. Click **Display Details**.  

   - The window shows your account ID, namespace ID, description, and region of your namespace. It also displays zero (0) in the **Type Count** and **Stream Count** fields.  
   - The details window shows the **State**, which indicates the status of the namespace. Once the process of creating a namespace and bringing it online is complete, the **State** changes to **Active**. If the status is not yet **Active**, close the window and refresh the page. 

    Note: It will take some time for the namespace to be created. 

   <!-- LA: What is the status while the namespace is being set up? Can we give them an estimate of how long it might take for the namespace status to change to Active? Follow up with Derek. -->

5. Select the namespace in the list, and click **Edit Namespace**.  

   Note: The only field you can edit is the **Description** field.

6. Make any changes to the description and click **Save**.

#### How to manage permissions on the namespace

<!-- DB: I think it makes sense to have that discussion as part of the Roles discussion, since that's the explicit purpose of Roles. But agreed it shouldn't be repeated in every page. --><!-- LA: I will make a pass through all the topics once we've created the Roles topic. -->

Access control is managed by assigning permissions to roles. Each role is granted (**Allow**) or denied (**Deny**) permission to perform an access operation (read, write, delete, or manage permissions). Users are assigned to a role that determines their access to OCS resources. 

Note: The remaining steps are optional. 

1. Click **Manage Permissions**.
2. Click the **Selected role** arrow, and select Account Member from the list.
3. Give the account member write permissions by selecting the **Allow** checkbox for the **Write** access type.
4. Click **Save**.
