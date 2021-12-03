---
uid: ShareStreams
---

# Share and unshare streams

Use these procedures to share or stop sharing streams of data with other communities.

**Note:** To share or unshare a stream, your role must have the Manage Permission privilege for that stream. By default any user who creates a stream has the Manage Permission privilege. To manage permissions for a role, use the **Sequential Data Store** > **Streams** feature.

## Share streams

You can share streams with other tenants from the **Sequential Data Store** page. Choose the streams that you want to share and the communities that you want to share them with.

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. Optional: Click the **Change Namespace** button in the upper-right toolbar, then select the desired namespace.

1. If it is not already selected, select **Streams** at the top left.

1. Select one or more streams to share.

    Select each stream that you want to share, and then click **Share Streams**.

    **Tip:** Use the **Search for streams** field to search for specific streams. Use the wildcard operator (`*`) to return results that start or end with a particular phrase. For more information, see [Search in SDS](xref:sdsSearching).

1. Select one or more community to share your streams with.

    Click the **Select Communities** dropdown button. From the dialog that opens, select one or more community that you want to share the stream with, then click **Continue**.

    **Tip:** Use the **Filter Communities** field to find a specific community.

1. Confirm that you want to share the streams with the chosen communities.

    Click **Share**. From the **Share stream** dialog that opens, click **Confirm**. Then click **Close**.

**Result:** The chosen streams are shared with the chosen communities. All members of the selected communities are able to read data from the shared streams.

## Unshare streams from Community Details

1. In the left pane, select **Data Management** > **Communities**.

1. Find the community where you are sharing streams and click **Details**.

1. On the `Community Details` page, click the **Tenants** tab.

1. Select your own tenant.

   **Result:** A pane opens on the right.

1. Select the **Streams** tab. Then select the streams you want to unshare and click **Unshare Streams**. When prompted for confirmation, click **Unshare**.

**Result:** The streams are unshared from the community. Other tenants in the community can no longer view them.

## Unshare streams from the Sequential Data Store

In addition to unsharing streams, the Sequential Data Store provides many capabilities for managing streams. For more information, see [Manage streams](xref:manage-streams).

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. Optional: Click the **Change Namespace** button in the upper-right toolbar, then select the namespace that contains the stream you want to share.

1. Filter the page to display only the streams that are shared within a community.

    Ensure that the **Filter Tenants** icon is enabled, which displays the **Filter Communities** pane. From the **Filter Communities** pane, select one or more community from which to unshare streams.

1. Unshare the streams. 

    From the list of streams, select one or more to streams unshare. Then select **More Options** ![More Options](images/more-options.png "More Options") > **Unshare Stream**. When prompted for confirmation, click **Unshare**.

    **Tip:** You can also unshare streams using the **Unshare Streams** buttons available in the right pane.
