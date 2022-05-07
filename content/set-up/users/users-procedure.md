---
uid: gpUsers
---

# Add a user

A user is an identity that has access to a tenant. Roles assigned to a user determine what permissions the user has on resources.

## Prerequisite

You must have the role of Tenant Administrator to add and manage users.

## Procedure

To add a user to a tenant:

1. In the left pane, select **Security** > **Users**.

1. In the toolbar, select **Add User**.

1. In the **Identity Provider** field, select the appropriate identity provider for the user you are adding. You can switch to a different option later. For tenants with a single identity provider enabled, the field is disabled.

   For advanced integration identity providers, such as Azure Active Directory:

   1. Begin entering the user name or email in the `User Name` field.

   1. A list of matching users displays. Select the user from the list.

   1. (Optional) Enable additional roles for the user. By default, the user is assigned the Tenant Member role which cannot be removed. Roles can be modified after the user is invited.

   1. Select **Add**. The user receives a notification that they were added to the tenant.

   For other identity providers:

   1. In the **Contact First Name** and **Contact Last Name** fields, enter a first and last name for the user.  

   1. In the **Contact Email** field, enter the contact email. The invitation is sent to the user at this email address. Ensure that the email address is correct so that the invitation is not sent to an unintended recipient.

   1. (Optional) Enable additional roles for the user. By default, the user is assigned the Tenant Member role which cannot be removed. Roles can be modified after the user is invited.

   1. Select **Invite**.

      An invitation is sent to the email address specified in the `Contact Email` field. The **Status** column lists the new user as *Pending* until the invitation is accepted. If the invitation expires, the status changes to *Expired*. Once expired, the invitation can be resent.

   1. When the user receives the invitation, the user should log in using the identity provider specified. Once the user has logged in, the user status changes to *Active*.
