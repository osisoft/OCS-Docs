---
uid: bpOMFConnection
---

# OMF Connections Best Practices

The most important considerations with OSIsoft Message Format (OMF) connections are to ensure applications use the correct client credentials and security is correctly configured for OMF connections.

- Each type of application or system that sends OMF data to OCS should have its own defined OMF connection, with the name and description referencing the data source.

- Each application instance or each device that sends OMF data to OCS should have its own client credentials client and its own secret. Connections allow a list of clients to be defined. When each application instance or device has its own client, security is improved because secrets can be managed at a granular level.

  <!-- David Moler: not only does client/device allow better security, it allows individual devices to be identified (which we couldn't otherwise). OMF definition should be lead things, not in 2nd bullet. --><!-- Derek/Doug: Can you resolve this with David? -->

- The client credentials client should have the minimum roles and access in OCS. For example, a client may be granted access to write data, but it does not have permissions to delete data. Note, however, the permissions associated with the OMF connection are separate from the client's permissions, and restrictions on the client do not impact permissions on OMF messages.  <!-- Laureen: I edited the last sentence per Konstantin's comment and your suggested revision.--> <!--Doug: Please verify that my edits are ok. -->

- For use cases that involve a large number of source applications or source devices, the OCS API can be used to automatically assign a new client credentials client and secret whenever a new device is brought online.
