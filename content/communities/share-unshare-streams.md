---
uid: ShareStreams
---

# Share and unshare streams

Use these procedures to share or stop sharing streams of data with other communities.

**Note:** To share or unshare a stream, your role must have the Manage Permission privilege for that stream. By default any user who creates a stream has the Manage Permission privilege. To manage permissions for a role, use the **Sequential Data Store > Streams** feature.

## Share streams

To perform this procedure you must have already defined streams.

1. On the navigation bar, click **Sequential Data Store**.

2. If necessary, select a namespace at top left.

    ![Select a namespace and streams](images\select-namespace-streams.png "Select a namespace and streams")

3. If it is not already selected, select **Streams** at top left.

4. Select one or more streams to share.

    To search for a particular stream, enter a search term in the **Search for streams** text box. If necessary, use a wildcard operator "*" to return results that start or end with a particular phrase. For more information, see [Search in SDS](xref:sdsSearching).

5. Select **More Options** ![More Options](images\more-options.png "More Options") and select **Share Stream** from the dropdown list.

    If you selected multiple streams in the previous step, a pane appears for managing streams. You can select **Share Streams** on that pane.

6. Click **Select Communities**.

    A list of communities appears.

7. Select the communities with which you want to share streams and click **Continue**. If necessary, you can filter the list of communities by typing in the **Filter Communities** box.

8. Click **Continue**. and then click **Share**. When prompted for confirmation, click **Confirm**.

    All members of the selected communities are able to read data from the shared streams.

## Unshare streams from `Community Details`

1. On the `Communities` overview page, find the community where you are sharing streams and click **Details**.

2. On the `Community Details` page, click the **Tenants** tab.

3. Select your own tenant.

    If you have shared streams, a **Streams** tab appears at right.

4. On the **Streams** tab, select the streams you want to unshare and click **Unshare Streams**. When prompted for confirmation, click **Unshare**.

## Unshare streams from the `Sequential Data Store`

1. On the navigation bar, click **Sequential Data Store**.

2. If necessary, select a namespace or community from the **Change Namespace or Community** dropdown list.

    ![Select a namespace or community](images\select-namespace-community.png "Select a namespace or community")

3. Use the toggle switches to filter streams by namespace or community.

    ![Filter by namespace or community](images\namespace-communities-switches.png "Filter by namespace or community")

4. From the list, select a namespace or a community.

    To search for a particular stream, enter a search term in the **Search for streams** text box. If necessary, use a wildcard operator "*" to return results that start or end with a particular phrase. For more information, see [Search in SDS](xref:sdsSearching).

5. From the list of streams, select one or more to unshare.

6. Select **More Options** ![More Options](images\more-options.png "More Options") and select **Unshare Stream** from the dropdown list.

    If you selected multiple streams in the previous step, a pane appears for managing streams. You can select **Unshare Streams** on that pane.

7. When prompted for confirmation, click **Unshare**.
