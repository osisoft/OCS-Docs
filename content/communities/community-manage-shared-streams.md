---
uid: community-manage-shared-streams
---

# Manage shared streams 

Users assigned share permissions for data streams in `Sequential Data Store`—also known as _data stewards_—can share those streams into communities where they are a member. These same users can unshare data streams from communities as well.

## Prerequisites

[!include[prereq-share-streams](includes/prereq-share-streams.md)]

## Share streams

User with permissions to share a data stream within a community can do so from the Sequential Data Store page. To share streams with other communities:

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. If it is not already selected, select **Streams** at the upper left.

1. Select each stream that you want to share, and then select **More Options** ![More Options](../_icons/default/dots-vertical.svg) > **Share Stream**.

    **Tips:** 

    * Use the **Search for streams** field to search for specific streams. Use the wildcard operator (`*`) to return results that start or end with a particular phrase. For more information, see [Search in SDS](xref:sdsSearching).

    * When sharing a large numbers of streams, edit the **Items per page** dropdown to a value that accommodates the number of streams that you want to share.

1. Select one or more community to share your streams with.

1. Select **Select Communities**.

1. From the list of communities, select the communities with which you want to share streams and select **Continue**. 

    **Tip:** Use the **Filter Communities** field to find a specific community.
    
1. To confirm that you want to share the streams with the chosen communities, select **Share**. From the **Share stream** window, select **Confirm**. Then select **Close**.

The chosen streams are shared with the chosen communities. All members of the selected communities are able to read data from the shared streams.

## Unshare streams

When you want to stop sharing streams with a community, you can unshare them from either the `Communities` page or `Sequential Data Store`.

### [Communities](#tab/communities)

To stop sharing streams with a community from the `Communities` page:

1. In the left pane, select **Data Management** > **Communities**.

1. Find the community where you are sharing streams and select **Details**.

1. On the `Community Details` page, select the **Tenants** tab.

1. Select your own tenant. A pane opens on the right.

1. On the **Streams** tab, select the streams you want to stop sharing, then select **Unshare Streams**. When prompted for confirmation, select **Unshare**.

The streams are unshared from the community. Other tenants in the community can no longer view them.

### [Sequential Data Store](#tab/sds)

To stop sharing streams with a community from `Sequential Data Store`:

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. If it is not already selected, select **Streams** at the upper left.

1. Ensure that the **Filter Communities** pane is displayed. Enable it by selecting the **Filter Tenants** ![Filter Tenants](../_icons/branded/filter.svg) icon. 

1. From the **Filter Communities** pane, select one or more community from which to unshare streams.

    **Note:** This pane only lists communities where you are a Community Member.

1. From the list of streams, select one or more to streams unshare. 

1. Select **More Options** ![More Options](../_icons/default/dots-vertical.svg) > **Unshare Stream**. 

    **Tip:** You can also unshare streams using the **Unshare Streams** buttons available in the right pane.

1. When prompted for confirmation, select **Unshare**.

The streams are unshared from the community. Other tenants in the community can no longer view them.

***
