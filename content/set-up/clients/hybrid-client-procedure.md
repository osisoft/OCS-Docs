---
uid: gpHybridClient
---

# Add a hybrid client

Hybrid clients are used by native and server-side web applications. Authentication can be performed using any browser. The server-side code retrieves an access token and a refresh token can also be provided. Follow this procedure to add a hybrid client.

1. In the left pane, select **Security** > **Clients**.

1. In the **Client Type** field, select **Hybrid**. 

1. In the toolbar, click **Add Client**.

  The `Add Client` window appears.

1. In the **Name** field, enter a name to identify the application that will use this client.

1. (Optional) Select the **Allow Refresh Token** checkbox if the application uses refresh tokens to keep users logged in to the portal.

1. In the **Allowed Redirect URL(s)** box, enter a URL and select **+** to add it to the list.

   The application specifies one of the URLs in this list when it authenticates against OCS, and the OCS identity server returns the results of the authentication to this URL.

1. (Optional) In the **Allowed Logout Redirect URL(s)** box, enter a URL and select **+** to add it to the list. 

   The application specifies a URL from this list when it logs out of OCS, and the OCS identity server sends the user to this URL after a successful log out.

1. (Optional) In the **Token Lifetime** field, enter the length of time in seconds that the access token functions before it expires.  

   The default, 3600 seconds (one hour), is the maximum length of time. The minimum value is 60 seconds.

1. Select **Add**.  

  The `Add Secret` window opens.

1. (Optional) In the **Description** field, enter a description for the client secret.

1. In the **Expiration Date** field, enter a date and time that the secret expires. 

   Ensure that the expiration date is valid for the secret. By default, the secret is set to expire one year after creation. Select the **Never Expires** checkbox to specify that the secret does not expire. Secrets can be deleted later, including secrets that are set to never expire.

1. Select **Add**.  

   The `Client Successfully Created` window opens and displays the **Client Id** and **Client Secret**.

   **Important:** Select the **Copy** button to the right of each field to save the client secret and client Id. You need this information to connect your applications. Once the window is closed, the client secret cannot be accessed or retrieved.

   The `Client Successfully Created` window displays the client Id for the client. The application must specify this client Id when it makes an authentication request. Copy the client Id by clicking the **Copy** icon. Alternatively, after you close this window, you can also retrieve the client Id from the list of clients.

1. Select **Close**.  

   **Note:** In the list of secrets, the **Client Id** is still visible. If you did not save the client secret, select the client in the list and use the `Details` pane to remove the old secret and add a new secret.

## Related links

- [Hybrid Clients](xref:identityHybridClient) API
