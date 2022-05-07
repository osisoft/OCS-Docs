---
uid: gpClientCredentialsClient
---

# Add a client-credentials client

Client-credentials clients are used for server-to-server communication where no user interaction is required.

## Prerequisite

You must have the role of Tenant Administrator to add and manage clients.

## Procedure

To add a client-credentials client:

1. In the left pane, select **Security** > **Clients**.

1. In the **Client Type** field, select **Client-Credentials**. This option is displayed by default.

1. In the toolbar, select **Add Client**.

   The `Add Client` window appears.

1. In the **Name** field, enter a name to identify the device or application that will use this client.

1. In the **Roles** tab, select the roles that are appropriate for the client.  

   By default, the client has the `Tenant Member` role which cannot be removed. Roles can be modified after the client is created.

1. (Optional) In the **Token Lifetime** field, enter the length of time in seconds that the access token functions before it expires.

   The default, 3600 seconds (one hour), is the maximum length of time. The minimum value is 60 seconds.

1. Select **Continue**.

   The `Add Secret` window opens.

1. (Optional) In the **Description** field, enter a description for the client secret.

1. In the **Expiration Date** field, enter a date and time that the secret expires.

   Ensure that the expiration date is valid for the secret. By default, the secret is set to expire one year after creation. Select the **Never Expires** checkbox to specify that the secret does not expire. Secrets can be deleted later, including secrets that are set to never expire.

1. Select **Add**.  

   The `Client Successfully Created` window opens and displays the **Client Id** and **Client Secret**.

   **Important:** Select the **Copy** button to the right of each field to save the client secret and client Id. You need this information to connect your applications. Once the window is closed, the client secret cannot be accessed or retrieved.

1. Select **Close**.  

   **Note:** In the list of secrets, the **Client Id** is still visible. If you did not save the client secret, select the client in the list and use the `Details` pane to remove the old secret and add a new secret.

## Related links

- [Client Credential Clients](xref:identityClientCredentialClient) API