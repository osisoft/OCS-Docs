---
uid: community-view-shared-streams
---

# View shared streams 

After a community is established, you can view which data streams are shared into it. You can view both the streams that your tenant is sharing, as well as the streams that other tenants are sharing. View shared data streams in one of two ways: from the `Communities` page or `Sequential Data Store`. Your access to view shared data stream information depends upon your assigned user roles and permissions.

## To view shared streams

You can view shared streams from both the `Communities` page and `Sequential Data Store`. Select one of the tabs for more information on how to view which data streams are shared.

## [Communities](#tab/communities)

From the `Communities` page **Tenants** tab, you can view which data streams each tenant has shared with the community.

1. From the left panel, select **Data Management** > **Communities**.

1. Browse to the applicable community and select **Details**.
    
1. From the **Tenants** tab, select a tenant to view which streams that it shares with the community.

    Details for the community open in the right pane.

    <details>
        <summary><strong>Stream column notes:</strong></summary>
        <div>
            <img src="images/streams-column.png"></img>
            <p>The <strong>Streams</strong> column usually displays the number of streams shared into the community, but you may encounter the following states:</p>
            <ul>
                <li><p>If the <strong>Info</strong> <img src="../_icons/information.svg"/> icon displays, you cannot view the number of streams displayed because you are not a Community Member. For information on adding a user a Community Member, see <xref:community-manage-users>.</p></li>
                <li><p>If the <strong>Warning</strong> <img src="../_icons/warning.svg"/> icon displays, you are a Community Member, but there is an issue with stream permissions. For more information on setting stream permissions, see <xref:community-enable-stream-sharing-permissions>.</p></li>
            </ul>
        </div>
    </details>

1. From the right pane, select the **Streams** tab.
    
    ![Tenant shared streams](images/communities-shared-streams.png)

    The **Streams** tab lists each data stream that the tenant shares with the community. 

    **Tip:** Want to view more details about one of the shared streams? Select the **Launch** icon ![Launch icon](../_icons/launch.svg) to open it within `Sequential Data Store`.

## [Sequential Data Store](#tab/sds)

When working from `Sequential Data Store`, you can view which data streams are shared within communities, sorting by either stream or community.

### View shared streams by community

1. From the left panel, select **Data Management** > **Sequential Data Store**.

1. If necessary, enable the **Filter Communities** panel by selecting the **Filter** icon ![filter icon](../_icons/filter.svg).

1. Select a community to filter for.

    ![Filter communities](images/filter-pane.png)

    The page is filtered to list only data streams shared in the selected communities.

### View communities for a shared stream

While viewing individual data streams in `Sequential Data Store`, you can view each community that the stream is shared with.

1. From the left panel, select **Data Management** > **Sequential Data Store**.

1. (Optional) Select one or more community to filter for.

1. Select a single data stream. Details for the community open in the right pane.

1. From the right pane, select the **Sharing** tab.

    ![Sharing tab](images/communities-sharing-tab-sds.png)

    The communities that the stream is shared to are listed. 

    **Tips:** Want to view a community that the selected stream is shared to? Select the **Launch** icon ![Launch icon](../_icons/launch.svg) for the community.

***
