# Users

## Definition

A user is an identity that has access to an OSIsoft Cloud Services (OCS) tenant. Roles assigned to a user determine what permissions the user has on resources in OCS. For more information on Roles see the [Roles](#TODO) documentation. Users must be linked to an account from an enabled identity provider such as Azure Active Directory, Microsoft Accounts, or Google, and then log in to OCS through using the credentials from that account.

A user account is how users log in to the [OCS Portal](https://cloud.osisoft.com), and how users authenticate when using [Hybrid Clients](#TODO?) and [Authorization Code Clients](#TODO?). Hence at least one user should already be added to a tenant when it is first accessed.

You must have the **Account Administrator** role to add and manage users in a tenant.

## PI Core counterpart

An OCS user is comparable to a mapping in the PI Data Archive. For example, in the PI Data Archive a mapping may be added from a Windows Account to a specified PI Identity. The user then uses their Windows credentials to authenticate against the PI Data Archive and gets the permissions specified by the PI Identity. In OCS, a user uses Azure AD, Microsoft Accounts, or Google credentials to authenticate against OCS and gets the permissions specified by their set of roles.

## User best practices

1. Ensure the **Contact Email** field is correct before adding new users. The OCS invitation is sent to this address, so if it is incorrect a user may not receive an invitation or an incorrect recipient may receive an invitation, and thus access, to your OCS tenant.

1. Before inviting users to OCS, ensure that they will be granted the correct permissions via their roles. In particular, consider the access granted to the Account Member role, which includes read access to everything in the tenant by default. If a user should not have read access to some resources, the Account Member role can be limited.

## Inviting a user

Find the Users page in the OSIsoft Cloud Services portal [here](https://cloud.osisoft.com/users).

1. In the toolbar, click **Add User**.

1. If you have multiple identity providers enabled in your tenant, you will be prompted to select an identity provider first. If so, choose the appropriate identity provider for the user you are adding. Once you select an option, you can still switch to a different option.

1. Enter a **First Name** and **Last Name** for the user. This can be changed later, but will appear in the user's invitation email.

1. Enter the **Contact Email**, which is where the user will receive their invitation to your OCS tenant. Ensure that this is correct so that the invitation is not sent to an unintended recipient.

1. Optionally, enable additional roles for the user. By default the user will have the Account Member role, which cannot be removed. Roles can still be modified after the user is invited.

1. Once the information has been entered, click **Invite**. OCS sends the invitation to the email address specified in the **Contact Email** field. The **Status** column lists the new user as **Pending** until the invitation is accepted. If the invitation expires, the status changes to **Expired**. Once expired, the invitation can be resent.

1. Once the user receives the invitation, they should log in using the identity provider you specified. Once they have logged in, the status of their user should be **Active**.
