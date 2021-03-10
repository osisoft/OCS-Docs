# Users

## Definition

A user is an identity that has access to an OSIsoft Cloud Services (OCS) tenant. Roles assigned to a user determine what permissions the user has on resources in OCS. For more information on Roles see the [Roles](#TODO) documentation. Users must be linked to an account from an enabled identity provider such as Azure Active Directory, Microsoft Accounts, or Google. Users log in to OCS using the credentials from that account.

A user account is how users log in to the [OCS Portal](https://cloud.osisoft.com), and how users authenticate when using [Hybrid Clients](#TODO?) and [Authorization Code Clients](#TODO?). Hence at least one user should already be added to a tenant when it is first accessed.

You must have the **Account Administrator** role to add and manage users in a tenant.

## PI Core counterpart

An OCS user is comparable to a mapping in the PI Data Archive. For example, in PI Data Archive a mapping may be added from a Microsoft Windows account to a specified PI identity. The user uses their Windows credentials to authenticate against PI Data Archive and gets the permissions specified by the PI identity. In OCS, a user uses Azure Active Directory, Microsoft accounts, or Google credentials to authenticate against OCS, and users get their permissions from the roles that are assigned to them.

## User best practices

1. The OCS invitation is sent to the user at the email address specified in the **Contact Email** field. Therefore, verify that it is correct to ensure that your users receive the invitation and ensure that it is not sent to an unintended recipient, giving them access to OCS.

1. Before inviting users to OCS, ensure that they have been granted the correct permissions through their roles. In particular, consider the access granted to the Account Member role which, by default, grants read access to everything in the tenant. If a user should not have read access to some resources, the Account Member role can be limited.

## Inviting a user

1. Click the menu icon and click **Users** (under Security).

1. In the toolbar, click **Add User**.

1. If multiple identity providers are enabled in your tenant, you are prompted to select an identity provider. Choose the appropriate identity provider for the user you are adding. After you select an option, you can later switch to a different option.

1. Enter a **First Name** and **Last Name** for the user.  
   This can be changed later, but will appear in the user's invitation email.

1. Enter the **Contact Email**. The invitation to your OCS tenant is sent to the user at this address. Ensure that it is correct so that the invitation is not sent to an unintended recipient.

1. (Optional) Enable additional roles for the user. By default, the user is assigned the Account Member role which cannot be removed. Roles can be modified after the user is invited.

1. Once the information has been entered, click **Invite**. OCS sends the invitation to the email address specified in the **Contact Email** field. The **Status** column lists the new user as **Pending** until the invitation is accepted. If the invitation expires, the status changes to **Expired**. Once expired, the invitation can be resent.

1. Once the user receives the invitation, they should log in using the identity provider you specified. Once they have logged in, the status of their user should be **Active**.
