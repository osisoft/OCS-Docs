---
uid: community-accept-invite
---

# Step 1: Accept community invitation

When another tenant invites you to a community, you receive an email invitation that you can use to join. 

**Note:** Invitations are valid for 14 days before they expire. If you do not accept the invitation within that time, or you do not receive an invitation email, you must request a new invitation from the administrative tenant.

To accept an invitation:

1. Open and review the email invitation from AVEVA Data Hub.

1. Select the **VIEW COMMUNITY INVITE** link.

1. If prompted, enter the tenant ID or tenant alias for your tenant and select **Continue**.

  **Important!** If you have multiple tenants, verify that you are logging into the correct tenant.

1. If prompted, log in to AVEVA Data Hub.

  A page opens and displays that your tenant will join the community that issued the invitation.

1. Select **Join**.

  ![join](images/join-community.png)

  The tenant that invited you to the community is updated that you accepted their invitation.

1. Wait for a Community Administrator from the inviting tenant to confirm your tenant. Your tenant does not officially join the community until the inviting tenant confirms the invitation.

  ![await confirmation](images/await-confirmation.png)

  When the administrative tenant confirms your tenant, you receive a notification email.
 
1. After your tenant is confirmed for the community, select **Details** to set up Community Administrators and Community Members for your tenant.

  ![community details](images/community-details.png)

  A setup wizard opens.

1. From the **Welcome** page, select **Next**.

   ![Setup Wizard: Welcome](images/setup-wizard.png)

1. On the `Community Administrators` page, choose the [roles](xref:ccRoles) that are assigned [community administration permissions](xref:community-community-roles#community-administrators). Users assigned these roles can perform administration tasks within their own tenant, but not the entire community. You can either accept the default roles or add new ones. 
   
   - To add community administrator permissions to a user role, select **Add Roles** > **Add Role** ![Add Role](../_icons/branded/plus.svg) for any role that you want to function as community administrator.

   - To remove community administrator permissions from a user role, select **Remove Role** ![Remove Role](../_icons/branded/window-close.svg) for the role that you want to remove.

  **Tip:** You can edit the default roles that are listed. For more information, see <xref:communities-manage-default-admins>.

1. After you finish, select **Next**.

1. On the `Community Members` page, add [Community Members](xref:community-community-roles#community-member), which are members within your tenant that have read access to the community and its data.
      
  To add new Community Members, select **Add Members** > ![Add](../_icons/branded/plus.svg) for each user or group that you want to add.

  **Note:** Community Administrators are not automatically added as Community Members. If you want your Community Administrators to also be Community Members with access to shared resources, you must manually add them.

1. After you finish, select **Save & Close**.

## Next steps

Edit permissions for data streams to allow tenant data stewards to share them with the community. Continue to <xref:community-manage-sds-permissions-join>.
