---
uid: gpAuthorizationCodeClient
---

# Add an authorization code client

Authorization code clients provide a secure means of authenticating users to customer web applications that use OCS as their backend.

## Prerequisite

You must have the role of Tenant Administrator to add and manage clients.

## Procedure

To add an authorization code client:

1. In the left pane, select **Security** > **Clients**.

1. In the **Client Type** dropdown list, select **Authorization Code**.

1. In the toolbar, select **Add Client**.

   The `Add Client` window appears.

1. In the **Name** field, enter a name to identify the device or application that will use this client.

1. In the **Allowed Redirect URL(s)** field, enter a URL and select **+** to add it to the list.

   The application specifies one of the URLs in this list when it authenticates against OCS, and the OCS identity server returns the results of the authentication to this URL.

1. (Optional) In the **Allowed Logout Redirect URL(s)** field, enter a URL and select **+** to add it to the list.

   The application specifies a URL from this list when it logs out of OCS, and the OCS identity server sends the user to this URL after a successful log out.

1. (Optional) In the **Allowed CORS Origin(s)** field, enter a URL and select **+** to add it to the list.  

   Designate other URLs from which the application is allowed to make requests against OCS. For example, this may be necessary if the user authenticates from an application running at one URL but the result of the authentication is sent to an application running at a different URL.

1. (Optional) In the **Token Lifetime** field, enter the length of time in seconds that the access token functions before it expires.  

   The default, 3600 seconds (one hour), is the maximum length of time. The minimum value is 60 seconds.

1. Select **Add**.  

   The `Client Successfully Created` window displays the client Id for the client. The application must specify this client Id when it makes an authentication request. To copy the client Id, select the **Copy** icon. After you close this window, you can also retrieve the client Id from the list of clients.

## Related links

- [Authorization Code Clients](xref:identity-authorization-code-clients) API
