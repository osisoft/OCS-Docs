# Clients

## Definition

Clients provide a way for users or applications to authenticate against OSIsoft Cloud Services (OCS) from applications other than the OCS portal. OCS supports three types of clients, each of which support different types of applications.

You must have the **Account Administrator** role to add and manage clients in a tenant.

## Client-Credentials

Client-credentials clients are used for server-to-server communication where no user interaction is required. The client typically authenticates with the token endpoint using its client ID and secret. A secret is a unique key generated for each client to connect to OSIsoft assets, resources, and services for a time-limited period.

### Client-Credentials PI Core Counterpart

Client-credentials clients are much like Windows service accounts that might be used to authenticate against the PI Data Archive or PI AF Server, and it is thus very important to keep the secret secure in much the same way it is important to keep service account passwords secure.

### Client-Credentials Best Practices

1. Create a separate Client-credentials client for each separate device or instance of an application that will connect to to OCS. This will ensure that it is possible to manage secrets discretely for individual applications and to know which applications are connecting to OCS.

1. Ensure that client secrets are stored securely where they are used.

1. Use secrets that expire, and rotate them on a scheduled basis. When it is time to switch to a new secret, it is best to create a new secret, switch the application to use the new secret, and then delete the old secret from the client once it is no longer in use.

### Creating a Client-Credentials Client

Find the Clients page in the OSIsoft Cloud Services portal [here](https://cloud.osisoft.com/users).

1. From the **Client Type:** dropdown, select **Client-Credentials**. (This is also the default selected option)

1. In the toolbar, click **Add Client**.

1. Enter a **Name** for the client to indicate what device or application it will be used by.

1. Enable the appropriate roles for the client. By default the client will have the Account Member role, which cannot be removed. Roles can still be modified after the client is created.

1. Optionally, set the **Token Lifetime**. This represents how long the access token will function before it expires. The default (and maximum) value is 3600 seconds (one hour). The minimum value is 60 seconds (one minute).

1. Click **Continue**.

1. You are now prompted to add a secret for the client. Optionally, you can enter a **Description** for the client secret.

1. Ensure that the expiration date is valid for the secret. By default, the secret expires after one year. It is also possible to specify that the secret **Never Expires**. Note that even in this case the secret can be manually deleted from the client later.

1. Click **Add**. You will be prompted with a dialog listing the **Client Id** and **Client Secret**. **IMPORTANT**: The **Client Secret** will no longer be accessible once you close the dialog. Use the **Copy** buttons to the right of these fields to save the values.

1. Click **Close**. Note that **Client Id** is still visible, and if you forgot to save the **Client Secret**, you can select the client from the list and use the **Details** tab to remove the old secret and add a new secret.

## Authorization Code

Authorization Code Clients are used for customer web applications that use OCS as their backend. They provide a secure means of authenticating users of the website to view OCS assets. Creating an Authorization Code Client results in the generation of a Client ID, which must be specified in the web application using the client to authenticate users.

Authorization code clients are used to authenticate using any browser, and an authorization code is provided to the client upon successful authentication. The authorization code is exchanged for an access token using PKCE (Proof Code for Code Exchange), which is a more secure authentication flow. No refresh token is provided.

### Authorization Code PI Core Counterpart

Authorization Code clients have no direct equivalent, but are similar to a combination of a Trust and Mappings in the PI Data Archive. These clients are similar to Trusts since they only allow users to access OCS if the application using them meets certain criteria, such as being served at a specific URL. However, like a mapping, they also require authentication as a known user account within the tenant.

### Authorization Code Best Practices

1. Use Authorization Code clients in web applications or services where users need to authenticate and it is not possible to store a client secret securely.

1. Since a refresh token is not provided in this flow, web applications should use an iframe to request a new token before the token expires. Otherwise, the user will have to explicitly log in again to get a new token once their token expires.

### Creating an Authorization Code Client

Find the Clients page in the OSIsoft Cloud Services portal [here](https://cloud.osisoft.com/users).

1. From the **Client Type:** dropdown, select **Authorization Code**.

1. In the toolbar, click **Add Client**.

1. Enter a **Name** for the client to indicate what application it will be used by.

1. Enter the **Allowed Redirect URL(s)** for the application. This will be specified by the application when authenticating against OCS, and the OCS identity server will direct back to this URL after successful authentication.

1. Optionally, enter **Allowed Logout Redirect URL(s)**. Similar to normal redirect URL(s), this is specified by the application when logging out of OCS, and the OCS identity server will direct back to this URL after successful logout.

1. Optionally, enter **Allowed CORS Origin(s)**. This can be used to designate other URL(s) from which the application is allowed to make requests against OCS. For example, this may be necessary if the user authenticates from an application running at `https://authenticate.com`, but is then sent to an application running at `https://application.com`.

1. Optionally, set the **Token Lifetime**. This represents how long the access token will function before it expires. The default (and maximum) value is 3600 seconds (one hour). The minimum value is 60 seconds (one minute).

1. Click **Save**. Note the **Client Id** from the list, which must be specified when the application makes an authentication request. The client is now ready to use.

## Hybrid

Hybrid clients are used by native and server-side web applications where you authenticate using any browser, and an access token is retrieved using the server-side code. A refresh token can also be provided.

### Hybrid PI Core Counterpart

Hybrid clients have no direct equivalent, but are similar to a combination of a Trust and Mappings in the PI Data Archive. These clients are similar to Trusts since they only allow users to access OCS if the application using them meets certain criteria, such as being served at a specific URL. However, like a mapping, they also require authentication as a known user account within the tenant.

### Hybrid Best Practices

1. Use Hybrid clients in web applications or services where users can use a browser to authenticate against OCS, but a secure backend that can store a secret is used to perform the actual authentication process.

1. Use caution when determining whether to allow a refresh token for your Hybrid client. If possible, it is more secure to use an iframe to request a new token before the old token expires.

### Creating a Hybrid Client

Find the Clients page in the OSIsoft Cloud Services portal [here](https://cloud.osisoft.com/users).

1. From the **Client Type:** dropdown, select **Hybrid**.

1. In the toolbar, click **Add Client**.

1. Enter a **Name** for the client to indicate what application it will be used by.

1. Optionally, check the box **Allow Refresh Token** if the application will use refresh tokens to keep users logged in to OCS.

1. Enter the **Allowed Redirect URL(s)** for the application. This will be specified by the application when authenticating against OCS, and the OCS identity server will direct back to this URL after successful authentication.

1. Optionally, enter **Allowed Logout Redirect URL(s)**. Similar to normal redirect URL(s), this is specified by the application when logging out of OCS, and the OCS identity server will direct back to this URL after successful logout.

1. Optionally, set the **Token Lifetime**. This represents how long the access token will function before it expires. The default (and maximum) value is 3600 seconds (one hour). The minimum value is 60 seconds (one minute).

1. Click **Save**. Note the **Client Id** from the list, which must be specified when the application makes an authentication request. The client is now ready to use.
