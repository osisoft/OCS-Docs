---
uid: gsHybridClients
---

# Get started with hybrid clients

Hybrid clients are used by native and server-side web applications. Authentication can be performed using any browser. The server-side code retrieves an access token and a refresh token can also be provided. For more information about hybrid clients, see [Hybrid clients](xref:ccClients#hybrid-client).

To create a hybrid client:

1. In the left pane, select **Security** > **Clients**.

1. In the **Client Type** dropdown list, select **Hybrid**.

1. In the toolbar, select **Add Client**.

   The `Add Client` window appears.

1.  In the **Name** field, enter a name to identify the device or application that will use this client.

1. (Optional) Select the **Allow Refresh Token** checkbox if the application uses refresh tokens to keep users logged in.

1. In the **Allowed Redirect URL(s)** field, enter a URL and select **+** to add it to the list.  
   
   The application specifies one of the URLs in this list when it authenticates against OCS, and the identity server returns the results of the authentication to this URL.

1. (Optional) In the **Allowed Logout Redirect URL(s)** field, enter a URL and select **+** to add it to the list.  
   
   The application specifies one of the URLs from this list when it logs a user out of OCS, and the identity server sends the user to that URL after a successful log out.

1. (Optional) In the **Token Lifetime** field, enter the length of time in seconds that the access token functions before it expires. 

   The default, 3600 seconds (one hour), is the maximum length of time. The minimum value is 60 seconds.

1. Select **Add**.  

   The `Client Successfully Created` window displays the client Id for the client. The application must specify this client Id when it makes an authentication request. To copy the client Id, select the **Copy** icon. After you close this window, you can also retrieve the client Id from the list of clients.

## Next step

Continue with either of the following: 

- [Get started with client-credentials clients](xref:gsClientCredentialsClients) 

- [Get started with authorization code clients](xref:gsAuthorizationCodeClients)

When all three are complete, continue with [Get started with assets](xref:gsAssets).
