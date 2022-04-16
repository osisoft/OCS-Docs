---
uid: community-create-community
---

# Part 1: Create a community

[!include[create-community-intro](includes/create-community-intro.md)]

## Prerequisites

[!include[prereq-administrative-tenant](includes/prereq-administrative-tenant.md)]

## To create a community

To create a community, follow these steps:

1. In the left pane, select **Data Management** > **Communities**.

1. Select **Add Community**.

    The **Create Community** wizard opens to the `Details` page.
    ![Create Community](images/create-community.png)

1. On the `Details` page, enter a **Name** and **Description**. Then select **Next**.

1. On the `Community Administrators` page, choose the [roles](xref:ccRoles) that are assigned [community administration permissions](xref:community-community-roles#community-administrators). Users assigned these roles can perform administration tasks for both their own tenant and the entire community. You can either accept the default roles or add new ones.

    <details>
        <summary><strong>To add roles</strong></summary>
        <img src="./images/create-community-add-role.gif"/>
    </details>
    <details>
        <summary><strong>To remove roles</strong></summary>
        <img src="./images/create-community-remove-role.gif"/>
    </details>

    **Tip:** You can edit the default roles that are listed. For more information, see <xref:communities-manage-default-admins>.

1. After you finish, select **Next**.

1. On the `Community Members` page, add [Community Members](xref:community-community-roles#community-member), which are users within your tenant that have read access to the community and its data.
    
    **Note:** Community Administrators are not automatically added as Community Members. If you want your Community Administrators to also be Community Members with access to shared resources, you must manually add them.
    
    <details>
        <summary><strong>To add members</strong></summary>
        <img src="./images/create-community-create.gif"/>
    </details>

1. After you finish, select **Create**.

    The community is created and added to the `Communities` page.
    
    ![Tile for new community](images/confirmed.png)

## Next steps

Invite tenants to your community. Continue to <xref:community-invite>.
