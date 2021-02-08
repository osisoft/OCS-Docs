---
uid: managecommunity
---

# Manage tenants in a community

The Community Details page lets you perform various tasks for managing tenants that already belong to a community. It also lets you add tenants to a community.

To create a new community, see [Add a community](xref:add-community).

## Invite a tenant to a community

OCS lets you invite business partners to join a community so they are enabled to share data. The business partner must already be a tenant in OCS.

Two different users must perform this procedure:

- One user, the "inviter," issues an invitation to another tenant to join a community. To be an inviter, you must be an OCS [Tenant Administrator](xref:communityroles#account-administrator) *and* a [Community Administrator](xref:communityroles#community-administrator).
- Another user, the "invitee," accepts the invitation. To be an invitee, you must be a Tenant Administrator of a separate tenant that does not already belong to the community.

1. **Inviter:** Perform the following steps to issue an invitation:   
   1.1. On the Communities overview page, find the community you want to share and click **Details**.   
   1.2. On the Community Details page, on the Tenant card, click **New Tenant**.   
   1.3. Enter the email address of the representative of the tenant you would like to invite and click **Invite**. An email is sent to the invitee.
2. **Invitee:** Perform the following steps to accept an invitation:   
   2.1 Open the email from OSIsoft Cloud Services and click **VIEW COMMUNITY INVITE**. OCS opens and displays a login dialog.   
   2.2. Enter the name of your tenant and click **Continue**. A dialog for verifying identity appears.   
   2.3. Verify your identity. OCS displays a page saying that your tenant will be joining the community from which the invite was issued. Membership in the community does not actually begin until the inviter confirms the invitation in the next step.   
   2.4. Click **Join**. The inviter receives an email asking for confirmation of the pending invitation.   
3. **Inviter:** Perform the following steps to confirm the new tenant:   
   3.1. In the email, click **VIEW PENDING INVITATIONS**. After authentication, the Community Details page opens and shows that an invitation awaits confirmation.   
   3.2. Select the tenant with the pending confirmation, select **More Options** ![More Options](..\images\more-options-blue-background.png "More Options"), and click **Confirm Tenant**. When prompted for confirmation, click **Confirm Tenant** again.

## Pause or resume sharing your tenant's data

This procedure is TBD

## Remove a tenant from a community

Use this procedure to remove a tenant from a community. This action might be necessary if a business relationship changes or the tenant's organization experiences a security breach.

After removing a tenant, you can re-invite the tenant to the community but all data that was previously shared must be shared again with the returning tenant.

**Note.** Only an OCS user who has a [Community Administrator](xref:communityroles#community-administrator) role *and* a [Tenant Administrator](xref:communityroles#account-administrator) role can remove a tenant from a community.  

1. On the Communities overview page, find the community you want to modify and click **Details**.
2. On the Community Details page, select the tenant you want to remove from the community.
3. Select **More Options** ![More Options](..\images\more-options-blue-background.png "More Options") and click **Remove Tenant**. When prompted for confirmation, click **Remove Tenant** again.

## Remove your own tenant from a community

Use this procedure to remove your own tenant from a community.

After removing you tenant, you can be re-invited to the community but all data that was previously shared with your tenant must be shared again.

If your tenant created a community and still has ownership of it, you cannot remove your own tenant.

**Note.** Only OCS users who have the [Community Administrator](xref:communityroles#community-administrator) role *and* the [Tenant Administrator](xref:communityroles#account-administrator) role can remove their own tenant from a community.

1. On the Communities overview page, find the community you want to leave and click **Details**.
2. Select **More Options** ![More Options](..\images\MoreOptions.png "More Options") and click **Remove \<*your tenant*\>**. A confirmation dialog opens.
3. Enter the name of your own tenant and click **Remove**.