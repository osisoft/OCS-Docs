---
uid: managecommunity
---

# Manage tenants in a community

Use the `Community Details` page to manage tenants that already belong to a community. This page also lets you add tenants to a community.

To create a new community, see [Add a community](xref:add-community).

## Invite a tenant to a community

Invite business partners to join a community so they can share data. 

**Note:** The business partner must already belong to a tenant in OCS.

Two different users must perform the following procedure to invite and add a tenant to a community:

- One user, the "inviter," invites another tenant. To be an inviter, you must be a [Community Administrator](xref:communityroles#community-administrator).

- Another user, the "invitee," accepts the invitation on behalf of their tenant. To be an invitee, you must be a [Tenant Administrator](xref:communityroles#tenant-administrator) of a separate tenant that does not already belong to the community.

**Invite process**

![Invite process](images/invite-process.drawio.svg)

## 1. Inviter sends invite

To send an invite to a community, follow these steps:

1. In the left pane, select **Data Management** > **Communities**.

1. Find the community you want to share and select **Details**.

1. On the `Community Details` page, on the **Tenants** tab, select **Invite Tenant**.

1. Enter the email address of the administrator of the tenant you would like to invite and select **Send**.

  An email is sent to the invitee.

## 2. Invitee accepts invite

To accept an invitation, follow these steps:

1. Open the email from OSIsoft Cloud Services Operations and follow the instructions.

1. On the login window, enter the tenant ID or tenant alias of the tenant from which you want to share data and select **Continue**. You must be a Tenant Administrator to accept the invitation.

1. On the authentication window, verify your identity.

  A page opens and displays that your tenant will join the community that issued the the invitation. Membership in the community does not begin until the inviter confirms the invitation in the next step.

1. Select **Join**.

  The inviter receives an email asking for confirmation of the pending invitation.

## 3. Inviter confirms invite

To confirm an invite, follow these steps:

1. Follow the instructions in the email.

1. Log into the tenant that owns the community you are sharing.

1. In the left pane, select **Data Management** > **Communities**.

1. On the `Communities` overview page, find the community to which you have invited another tenant and select **Details**.

1. On the `Community Details` page, select the **Invitations** tab.

1. Select an invitation with a status of **Invitation Accepted**.

1. On the `Invitation Details` pane, select **Confirm Tenant**. When prompted for confirmation, select **Confirm Tenant** again.

  The invitee's tenant is now part of the community.

## Remove a tenant from a community

Use this procedure to remove a tenant from a community. This action might be necessary if a business relationship changes or if the tenant's organization experiences a security breach.

After removing a tenant, you can re-invite the tenant to the community but all data that was previously shared must be shared again with the returning tenant.

**Note:** Only a user who has a [Community Administrator](xref:communityroles#community-administrator) role can remove a tenant from a community.  

To remove a tenant from a community, follow these steps:

1. In the left pane, select **Data Management** > **Communities**.

1. Find the community you want to modify and select **Details**.

1. On the `Community Details` page, select the **Tenants** tab.

1. Select the tenant you want to remove from the community. 

1. On the `Tenant Details` pane, select **Remove Tenant**. When prompted for confirmation, select **Remove Tenant** again.

## Remove your own tenant from a community

Use this procedure to remove your own tenant from a community. After removing your tenant, you can be re-invited to the community but all data that was previously shared with your tenant must be shared again. If your tenant created a community, you cannot remove your own tenant from the community.

**Note:** Only users who have the [Community Moderator](xref:communityroles#community-moderator) role can remove their own tenant from a community.

To remove your own tenant from a community, follow these steps:

1. In the left pane, select **Data Management** > **Communities**.

1. Find the community you want to leave and select **Details**.

1. On the `Community Details` page, select the **Tenants** tab.

1. Select your own tenant.

1. Select **More Options** ![More Options](images\more-options.png "More Options") and select **Remove \<*your tenant*\>**.

1. In the confirmation window, enter the name of your own tenant and select **Remove**.
