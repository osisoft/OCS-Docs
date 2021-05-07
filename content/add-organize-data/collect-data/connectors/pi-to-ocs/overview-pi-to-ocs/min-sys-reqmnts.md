---
uid: min-sys-reqmnts
---

# Minimum system requirements

The following system requirements are needed to transfer data from your on-premises PI Server to OCS using the PI to OCS Agent:

| System component | Requirement | 
| ------------- | ----------------- | 
| PI Server | <ul><li>PI Data Archive 2017 R2 (v.3.4.405.1198) or later.</li><li> PI AF 2017 R2</li><li>See the PI Data Archive and PI AF release notes for all other minimum system requirements.</li></ul> |
| PI to OCS Agent | <ul><li> Install on a different computer than your PI Data Archive deployment.</li><li>Operating system: 64-bit version of Windows (v. 1809) or 64-bit version of Windows Server 2016 Standard (v. 1803)<br>**Note.** 32-bit operating systems are not supported.</li><li>A computer with adequate CPU performance and 8 GB RAM</li><li>An Internet connection and a secure network connection to the PI Data Archive computer</li></ul> |
|Specific PI to OCS features| <ul><li>Transfer elements and out of order (OOO) events to OCS: PI AF 2017 R2 or later

## Administrative privileges

The PI to OCS Agent must be installed on a local machine by a user account with the following permissions: 

1.	Administrative privileges on the local machine
2.	Assigned to the OCS Account Administrator role

During the PI to OCS Agent installation, you will be prompted to log on to the OCS portal. 

**Note:** Make sure to log on to OCS with the correct Account Administrator credentials. 


The PI to OCS Agent requires the Windows service to "run as user". You must have read access to the following data on PI Data Archive:

* Archive data (the PIARCDATA Security table)
* The PI points configuration table (PIPOINT Security table)
* The PI points and data to be transferred