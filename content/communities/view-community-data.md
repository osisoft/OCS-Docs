---
uid: view-community-data
---

# View shared streams 

After a community has been established, any member within that community can view which data streams are shared within the community. You can view which data streams are shared one of two ways: from the **Community details** page or from the **Sequential Data Store** page.

## To view shared streams from Community details

You can view data streams shared within a community by browsing to its **Community Details** page, choosing a community, and viewing its **Streams** tab.

1. From the left panel, select **Data Management** > **Communities**.

    The **Communities** page opens, listing a card for each community.

1. Browse to the community that you want to shared streams for and click **Details**.

    The **Community details** page opens for the community. 
    
    **Note:** If the **Details** button is unavailable, you may require an invitation to the community. Contact your community administrator for an invitation.
    
1. From the **Tenants** tab, select the community tenant that you want to view data for.

    Details for the community open in the right pane.

1. From the right pane, select the **Streams** tab.

    ![Tenant shared streams](images/communities-shared-streams.png)

**Result:** The **Streams** tab lists each data stream that the tenant is sharing with the community. To view shared streams and their details in the **Sequential Data Store** explorer, select a stream and then click the **launch** icon ![launch icon](images/launch_black_18dp.svg). 

## To view shared streams from Sequential Data Store

When viewing the **Sequential Data Store** page, each stream lists whether it is shared within a community. Additionally, you can use the **Filter Communities** panel to filter for streams shared within one or more community.

1. From the left panel, select **Data Management** > **Sequential Data Store**.

1. (Optional) Toggle the **Filter Communities** panel by clicking the **filter** icon ![filter icon](images/filter_alt_black_18dp.svg) and select a community to filter for.

    Filtering the page by communities displays only streams that are shared within the selected communities.
    
    ![Filter communities](images/filter-pane.png)

1. Select a stream.

**Result:** Additional details about the stream display in each tab of the right panel, including **Details**, **Metadata and Tags**, and **Sharing**. If the selected stream is not shared within any community, the **Sharing** tab is unavailable.
