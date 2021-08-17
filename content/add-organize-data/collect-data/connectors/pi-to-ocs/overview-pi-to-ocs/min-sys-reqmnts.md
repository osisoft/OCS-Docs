---
uid: min-sys-reqmnts
---

# PI to OCS minimum system requirements

These are the requirements to transfer data from an on-prem PI Server to OCS:

* [System requirements](#system-requirements)
* [Administrator privileges](#administrator-privileges)
* [Configure access to PI Data Archive Security tables and PI point data](#configure-access-to-pi-data-archive-security-tables-and-pi-point-data)

## System requirements

The following table list the system requirements of PI to OCS.

| System component | Requirement |
| ------------- | ----------------- |
| PI Server | <ul><li>Minimum version: PI Data Archive 2016 R2; For full support of PI to OCS features, use PI Data Archive 2017 R2 or later.</li><li>See the PI Data Archive release notes for all other minimum system requirements.</li></ul> |
| PI to OCS Agent | <ul><li> Install on a different computer than your PI Data Archive deployment.</li><li>Use a domain account on a machine registered to the same domain.<br>**Note:** Windows Active Directory (AD) is required.</li> |
|Operating system: |<ul><li>64-bit version of Windows (v. 1809) or 64-bit version of Windows Server 2016 Standard (v. 1803)<br>**Note:** 32-bit operating systems are not supported.</li><li>Processor: 1 gigahertz (GHz) or faster compatible processor or System on a Chip (SoC)</li><li>RAM: 2 gigabyte (GB for 64-bit)</li><li>Hard drive size: 32GB or larger hard disk</li><li>An Internet connection and a secure network connection to the PI Data Archive computer</li></ul> |
| Specific PI to OCS features | <ul><li>Transfer out of order (OOO) events to OCS: PI Data Archive 2017 SP2 or later and PI AF 2017 R2 or later |

## Administrator privileges

The PI to OCS Agent must be installed on a local machine by a user account with the following permissions: 

1. Administrator privileges on the local machine
2. Assigned to the OCS Tenant Administrator role
3. A domain account and a machine registered to the domain when using PI to OCS

During the PI to OCS Agent installation, you need to log on to the OCS portal with the Tenant Administrator credentials. 

## Configure access to PI Data Archive Security tables and PI point data

The PI to OCS Agent requires the Windows service to "run as user". You must have read access to the following PI Data Archive data:

* Archive data (the PIARCDATA Security table)
* The PI points configuration table (PIPOINT Security table)
* The PI points and data to be transferred
