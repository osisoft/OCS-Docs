---
uid: gsUsers
---

# Get started with users

A user is an identity that has access to a tenant. Roles assigned to a user determine what permissions the user has on resources. For more information about users, see [Users](xref:ccUsers).

To invite a user to your tenant, follow these steps:

1. In the left pane, select **Security** > **Users**.

1. In the toolbar, select **Add User**.

1. In the **Identity Provider** field, select the appropriate identity provider for the user you are adding. You can switch to a different option later. For tenants with a single identity provider enabled, the field is disabled.

1. In the **Contact First Name** and **Contact Last Name** fields, enter a first and last name for the user.  

1. In the **Contact Email** field, enter the contact email. The invitation is sent to the user at this email address. Ensure that the email address is correct so that the invitation is not sent to an unintended recipient.

1. (Optional) Enable additional roles for the user. By default, the user is assigned the Tenant Member role which cannot be removed. Roles can be modified after the user is invited.

1. Select **Invite**. 

   An invitation is sent to the email address specified in the `Contact Email` field. The **Status** column lists the new user as *Pending* until the invitation is accepted. If the invitation expires, the status changes to *Expired*. Once expired, the invitation can be resent.

1. When the user receives the invitation, the user should log in using the identity provider specified. Once the user has logged in, the user status changes to *Active*.

## Next step

Continue with [Get started with clients](xref:gsClients).
