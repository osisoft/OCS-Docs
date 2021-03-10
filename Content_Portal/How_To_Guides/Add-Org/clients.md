# Clients

## Definition

Clients provide a way for users or applications to authenticate against OSIsoft Cloud Services (OCS) from applications other than the OCS portal. OCS supports three types of clients, each of which support different types of applications.

You must have the **Account Administrator** role to add and manage clients in a tenant.

## Client-credentials clients

Client-credentials clients are used for server-to-server communication where no user interaction is required. The client typically authenticates with the token endpoint using its client ID and secret. A secret is a unique key generated for each client to connect to OSIsoft assets, resources, and services for a time-limited period.

### Client-credentials PI Core counterpart

Client-credentials clients are very similar to Microsoft Windows service accounts that might be used to authenticate against PI Data Archive or PI AF server. Therefore, it is very important to keep secrets secure in the same way that it is important to keep service account passwords secure.

### Client-credentials best practices

1. Create a separate client-credentials client for each device or instance of an application that connects to OCS. This ensures that secrets can be discretely managed for individual applications and that you know which applications are connecting to OCS.

1. Ensure that client secrets are stored securely where they are used.

1. Use secrets that expire and rotate them on a schedule. When it is time to switch to a new secret, OSIsoft recommends that you create the new secret, redirect the application to use the new secret, and only delete the old secret from the client when it is no longer being used.

### Creating a client-credentials client

1. Click the menu icon and click **Users** (under Security).

1. From the **Client Type** dropdown list, select **Client-Credentials**. (This is the option that is displayed, by default.)

1. In the toolbar, click **Add Client**.

1. Enter a **Name** for the client. 
    Use this name to identify the device or application that will use this client.

1. Select the roles that are appropriate for the client. 
    By default, the client has the Account Member role which cannot be removed. Roles can be modified after the client is created.

1. (Optional) Set the **Token Lifetime**. 
    Token Lifetime represents the length of time (in seconds) the access token functions before it expires. The default, 3600 seconds (one hour), is the maximum length of time. The minimum value is 60 seconds.

1. Click **Continue**.

1. In the Add Secret window, enter a **Description** for the client secret. 

1. Enter a date that the secret expires.
    Ensure that the expiration date is valid for the secret. By default, the secret is set to expire one year after creation. You may specify that the secret does not expire by selecting the **Never Expires** checkbox. Secrets can be deleted later, including secrets that are set to never expire.

1. Click **Add**. 
    A window opens with the **Client Id** and **Client Secret**. 
    **IMPORTANT**: 
    Use the **Copy** buttons to the right of these fields to save the client secret and client ID. You will need to reference these in your applications. Once the window is closed, the **Client Secret** cannot be accessed or retrieved. 

1. Click **Close**. 
    Note: In the list of secrets, the **Client Id** is still visible. If you did not save the **Client Secret**, select the client in the list and use the **Details** pane to remove the old secret and add a new secret.

## Authorization code clients

Authorization code clients are used with customer web applications that use OCS as their backend. They provide a secure means of authenticating users of the website to view OCS assets. The authorization code client is paired with a client ID. The web application that is using the client to authenticate users must include the client ID in its code.

Authorization code clients are used to authenticate using any browser. Upon successful authentication, an authorization code is provided to the client. This authorization code is exchanged for an access token using PKCE (Proof Code for Code Exchange) which is a more secure authentication flow. No refresh token is provided.

### Authorization code client PI Core counterpart

Authorization code clients have no direct PI Core equivalent, but they are similar to the combined behavior of a trust and mappings in PI Data Archive. These clients are similar to trusts because they only allow users to access OCS if the application that uses them meets certain criteria, for example, the application must be served at a specific URL. However, like a mapping, authorization code clients require the user to authenticate as a known user account within the tenant.

### Authorization code client best practices

1. Use authorization code clients in web applications or with services where users must be authenticated and it is not possible to store a client secret securely.

1. Because refresh tokens are not generated in this flow, web applications should use an iframe to request a new token before the existing token expires. Otherwise, the user will have to explicitly log in again to get a new token once their token expires.

### Creating an authorization code client


1. From the **Client Type** dropdown list, select **Authorization Code**.

1. In the toolbar, click **Add Client**.

1. Enter a **Name** for the client. 
    Use this name to identify the device or application that will use this client.

1. Enter the URLs in the **Allowed Redirect URL(s)** text box.
    The application will specify one of the URLs in this list when it authenticates against OCS, and the OCS identity server will return the results of the authentication to this URL.

1. (Optional) Enter **Allowed Logout Redirect URL(s)**. Similar to normal redirect URL(s), this is specified by the application when logging out of OCS, and the OCS identity server will direct back to this URL after successfully logging out.

1. (Optional) Enter URLs in the **Allowed CORS Origin(s)** text box. 
    This can be used to designate other URL(s) from which the application is allowed to make requests against OCS. For example, this may be necessary if the user authenticates from an application running at `https://authenticate.com`, but the result of the authentication is sent to an application running at `https://application.com`.

1. (Optional) Set the **Token Lifetime**. 
    Token Lifetime represents the length of time (in seconds) the access token is valid before it expires. The default, 3600 seconds (one hour), is the maximum length of time. The minimum value is 60 seconds.

1. Click **Add**.
    The Client Successfully Created window displays the Client ID for the client.  The application must specify this Client ID when it makes an authentication request. After you close this window, you can also retrieve the **Client Id** from the list of clients.

## Hybrid clients

Hybrid clients are used by native and server-side web applications. Authentication can be performed using any browser. The server-side code retrieves an access token and a refresh token can also be provided.

### Hybrid client PI Core counterpart

Hybrid clients have no direct PI Core equivalent, but they are similar to the combined behavior of a trust and mappings in PI Data Archive. These clients are similar to trusts because they only allow users to access OCS if the application that uses them meets certain criteria, for example, the application must be served at a specific URL. However, like a mapping, hybrid clients require the user to authenticate as a known user account within the tenant.

### Hybrid client best practices

1. Use hybrid clients in web applications or services where users authenticate against OCS through a web browser, but a secure backend that stores the secrets performs the actual authentication.

1. Use caution when deciding whether to allow refresh tokens for your hybrid client. Where possible, it is a more secure practice to use an iframe to request a new token before the old token expires rather than use a refresh token.

### Creating a hybrid client

1. Click the menu icon and click **Users** (under Security).

1. From the **Client Type** dropdown list, select **Hybrid**.

1. In the toolbar, click **Add Client**.

1. Enter a **Name** for the client. 
    Use this name to identify the application that will use this client.


1. (Optional) Select the **Allow Refresh Token** check box if the application uses refresh tokens to keep users logged in to OCS.

1. Enter the **Allowed Redirect URL(s)** for the application. This will be specified by the application when authenticating against OCS, and the OCS identity server will direct back to this URL after successful authentication.

1. Optionally, enter **Allowed Logout Redirect URL(s)**. Similar to normal redirect URL(s), this is specified by the application when logging out of OCS, and the OCS identity server will direct back to this URL after successful logout.

1. (Optional) Set the **Token Lifetime**. 
    Token Lifetime represents the length of time (in seconds) the access token is valid before it expires. The default, 3600 seconds (one hour), is the maximum length of time. The minimum value is 60 seconds.

1. Click **Add**.
    The Client Successfully Created window displays the Client Id for the client.  The application must specify this Client Id when it makes an authentication request. You can copy the Client ID by clicking on the Copy icon, or after you close this window, you can also retrieve the **Client Id** from the list of clients.
