---
uid: TokenManagement
---

# Introduction to token management
The token that results from a successful authentication process and contains some predefined fields. This is sent as part of the Authorization header with all requests to OSIsoft resources and services. Clients can be configured to generate access tokens with varying expiration between 60 seconds and one hour. The default access token lifespan is one hour. There is no limit on the number of access tokens a client can be issued at any given time. 

## Token management with client credential clients

The application must be running in a device/virtual machine that you either own or have provisioned and must be a secure environment (for example, only authorized persons can access the application and its associated Secrets).

A valid access token grants its possessor access to protected resources. As such, they are as critical as passwords and secrets and should be treated the same way.

## Token management with authorization code clients

The application will be running in a browser. The OWASP foundation suggests storing the access token in the browser session Storage container.
