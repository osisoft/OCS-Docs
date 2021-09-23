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

A. **Inviter:** Perform the following steps to issue an invitation:

1. On the `Communities` overview page, find the community you want to share and click **Details**.

2. On the `Community Details` page, on the **Tenants** tab, click **Invite Tenant**.

3. Enter the email address of the administrator of the tenant you would like to invite and click **Send**.

  An email is sent to the invitee.

B. **Invitee:** Perform the following steps to accept an invitation:

1. Open the email from OSIsoft Cloud Services Operations and follow the instructions.

  OCS opens and displays a login dialog.

2. Enter the tenant ID or tenant alias of the tenant from which you want to share data and click **Continue**. You must be a Tenant Administrator to accept the invitation.

3. On the authentication dialog, verify your identity.

  OCS displays a page saying that your tenant will join the community that issued the the invitation. Membership in the community does not begin until the inviter confirms the invitation in the next step.

4. Click **Join**.

  The inviter receives an email asking for confirmation of the pending invitation.

C. **Inviter:** Perform the following steps to confirm the new tenant:

1. Follow the instructions in the email.

2. Log into the tenant that owns the community you are sharing.

3. On the `Communities` overview page, find the community to which you have invited another tenant and click **Details**.

4. On the `Community Details` page, click the **Invitations** tab.

5. Select an invitation with a status of **Invitation Accepted**.

  The `Invitation Details` pane opens.

6. Click **Confirm Tenant**. When prompted for confirmation, click **Confirm Tenant** again.

  The invitee's tenant is now part of the community.

## Remove a tenant from a community

Use this procedure to remove a tenant from a community. This action might be necessary if a business relationship changes or the tenant's organization experiences a security breach.

After removing a tenant, you can re-invite the tenant to the community but all data that was previously shared must be shared again with the returning tenant.

**Note:** Only an OCS user who has a [Community Administrator](xref:communityroles#community-administrator) role can remove a tenant from a community.  

1. On the `Communities` overview page, find the community you want to modify and click **Details**.

2. On the `Community Details` page, click the **Tenants** tab.

3. Select the tenant you want to remove from the community. The `Tenant Details` pane opens. 

4. On the `Tenant Details` pane, click **Remove Tenant**. When prompted for confirmation, click **Remove Tenant** again.

## Remove your own tenant from a community

Use this procedure to remove your own tenant from a community.

After removing your tenant, you can be re-invited to the community but all data that was previously shared with your tenant must be shared again.

If your tenant created a community, you cannot remove your own tenant from the community.

**Note:** Only OCS users who have the [Community Moderator](xref:communityroles#community-moderator) role can remove their own tenant from a community.

1. On the `Communities` overview page, find the community you want to leave and click **Details**.

2. On the `Community Details` page, click the **Tenants** tab.

3. Select your own tenant.

4. Select **More Options** ![More Options](images\more-options.png "More Options") and click **Remove \<*your tenant*\>**.

  A confirmation dialog opens.

5. Enter the name of your own tenant and click **Remove**.
