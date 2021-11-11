---
uid: min-sys-reqmnts
---

# PI to OCS minimum system requirements

These are the requirements to transfer data from an on-prem PI Server to OCS:

* [System requirements](#system-requirements)
* [Administrator privileges](#administrator-privileges)
* [Ensure write access to stream and asset collections](#ensure-write-access-to-stream-and-asset-collections)
* [Configure access to PI Data Archive Security tables and PI point data](#configure-access-to-pi-data-archive-security-tables-and-pi-point-data)

## System requirements

The following table list the system requirements of PI to OCS.

| System component | Requirement |
| ------------- | ----------------- |
| PI Server | <ul><li>Minimum version: PI Data Archive 2016 R2; For full support of PI to OCS features, use PI Data Archive 2017 R2 or later.</li><li>PI AF 2017 R2 or later<br>**Note:** PI AF is only required if you wish to connect to an AF server.</li></ul> |
| PI to OCS Agent | <ul><li> Install on a different computer than your PI Server deployment.</li><li>Use a domain account on a machine registered to the same domain.<br>**Note:** Windows Active Directory (AD) is required.</li> |
|Operating system: |<ul><li>64-bit version of Windows (v. 1809 or later) or 64-bit version of Windows Server 2016 Standard (v. 1803)<br>**Note:** 32-bit operating systems are not supported.</li><li>Processor: 1 gigahertz (GHz) or faster compatible processor or System on a Chip (SoC)</li><li>RAM: 2 gigabyte (GB for 64-bit)</li><li>Hard drive size: 32GB or larger hard disk</li><li>An Internet connection that allows outbound connections over port 443 and a secure network connection to the PI Data Archive computer</li></ul> |
| Specific PI to OCS features | <ul><li>Transfer out of order (OOO) events: PI Data Archive 2017 SP2 or later and PI AF 2017 R2 or later |

## Administrator privileges

The PI to OCS Agent must be installed on a local machine by a user account with the following permissions: 

1. Administrator privileges on the local machine
2. Assigned to the Tenant Administrator role
3. A domain account and a machine registered to the domain when using PI to OCS. The computer must be a member of a domain; workgroups are not supported at this time.

## Ensure write access to stream and asset collections 

The PI to OCS Agent has write permission to the streams collection in OCS. Write permission is provided by default through the Tenant Contributor role on the automatically generated PIToOcs Agent Client User. Write permission to this collection is required to enable stream creation.

**Note:** If write access is removed, stream creation will fail.

Write permission on the assets collection is also required for creation.

## Configure access to PI Data Archive Security tables and PI point data

The PI to OCS Agent requires the Windows service to "run as user". You must have read access to the following PI Data Archive data:

* Archive data (the PIARCDATA Security table)
* The PI points configuration table (PIPOINT Security table)
* The PI points and data to be transferred
* Read permission to the AF server, elements, and attribute data
