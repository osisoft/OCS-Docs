---
uid: LeastPrivilege
---

# Least Privilege

When creating new Users or Client Credential clients, configure them using the principle of [Least Privilege](https://us-cert.cisa.gov/bsi/articles/knowledge/principles/least-privilege). A User or Client should be assigned the lowest privileged role necessary to access resources in OSIsoft resources.
Ensure that Clients which are not being used are either deleted or disabled by setting the Enabled property to false.
To limit the potential consequences of Client credential theft, OSIsoft advise against assigning Client Credentials Clients the Administrator role. Any actions that require Administrator privileges should be done through the OCS portal, when possible. 

## One Client Per Application
OSIsoft suggests that a Client is created in OCS for each instance of a running application. This makes identification easier and decreases the attack surface from a leaked secret. In such an event, only one application needs to be updated.
