---
uid: LeastPrivilege
---

# Introduction to least privilege

When creating new users or client credential clients, configure them using the principle of [Least Privilege](https://us-cert.cisa.gov/bsi/articles/knowledge/principles/least-privilege). A user or client should be assigned the lowest privileged role necessary to access resources in OSIsoft resources.
Ensure that clients which are not being used are either deleted or disabled by setting the **Enabled** property to false.
To limit the potential consequences of client credential theft, OSIsoft advise against assigning client credentials clients the Administrator role. Any actions that require Administrator privileges should be done through the OCS portal, when possible. 

## One client per application
OSIsoft suggests that a client is created in OCS for each instance of a running application. This makes identification easier and decreases the attack surface from a leaked secret. In such an event, only one application needs to be updated.
