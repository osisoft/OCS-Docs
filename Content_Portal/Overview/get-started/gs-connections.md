---
uid: gsConnections
---

# Get started with connections

There are two types of OSIsoft Cloud Services (OCS) connections that allow you to transfer data from external sources into OSIsoft Cloud Services:

- The PI to OCS Agent sends PI point data from an on-premises PI Data Archive server to an OCS namespace. To get started with PI to OCS Agent, see [PI System Connections](xref:gsPItoOCS).
- OSIsoft Message Format (OMF) enables OMF applications to send data to an OCS namespace. To get started with OSIsoft Messaging Format (OMF), see [OSIsoft Messaging Format](xref:gsOMF).

### PI Core counterpart

Connections do not have a direct equivalent in PI Core services, but they are similar to PI trusts in PI Data Archive because both are required for an application that writes data to the PI System.

PI to OCS Agent uses PI System connections that behave much like a PI-to-PI interface, in that they send PI data from one system to another.
