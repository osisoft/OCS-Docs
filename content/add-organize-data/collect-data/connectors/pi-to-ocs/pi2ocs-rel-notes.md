---
uid: pi2ocs-rel-summary
---

# PI to OCS release summary

## Release 1.8.0: December 10, 2021


## Overview

This release covers the PI To OCS Agent, a component that is installed on-premises to replicate data and assets from the PI System to OSIsoft Cloud Services.

## Fixes and enhancements

This is a Lighthouse Release. Prior to this, select customers had access to the preview Lighthouse, early adopter access to this product.

### Fixes

*PI to OCS Agent*

**PI to OCS Agent Fails to register, and agent status remains in “Retrieving State”.**

The 1.6.1204.0 and 1.7.0.0 versions of the PI To OCS Agent will fail to register and fail to appear in the OSIsoft Cloud Service portal on new installations. The PI to OCS Configuration Utility will also display an agent status of "Retrieving State".

This has been fixed. Customers must upgrade to the latest version of the PI to OCS Agent to enable the fix.

**During installation, the agent description is not properly set in OCS.**

Previously, the agent description specified during PI to OCS Agent installation was not properly replicated to OCS. This has been fixed.

**Indexing Status may not change from "InProgress" to "Succeeded" after indexing is complete.**

This has been fixed.

### Enhancements

*PI to OCS Configuration Utility Improvements*

Several improvements were made to the PI to OCS Configuration Utility to improve the user experience, including the following items:
 
*	Only allow supported versions of PI Data Archive and AF Servers to be configured as data sources
*	Improve misleading error messaging
*	Add tool tips to provide more information about Agent Hostname, Description and Service Account 

**Known issues**

* Query search results that contain a very large number of PI points (> 1 million) will generate an exception error and not be processed. 
* The AF Server must have a default Data Archive server specified for PI to OCS to operate properly.
* The configuration utility can become unresponsive on some systems. There are two workaround options:
  - Download and install a newer version of .NET Desktop Runtime (3.1.21 or later) from here 
  - Go to C:\Program Files\OSIsoft\PIToOCS, right-click the PIToOcsConfigurationUtility.exe file and select **Properties** > **Compatibility** > **Change high DPI settings**, select "Use this setting to fix scaling problems for this program instead of the one in Settings", then select **Ok** > **Apply**.

## System requirements

This release supports Windows 10, Windows Server 2016 and Windows Server 2019.

Minimum requirements:

* 4GB of RAM
* Internet connectivity at least 10Mbit/sec
* Prior editions of Windows are not supported.

## Distribution Kit Files

| Product  | Software Version |
|------------- | ------------ |
| PI to OCS Agent Installation | 1.8.0 |

## Installation and upgrade

Run the PIToOCSAgent.exe setup kit. Instructions are provided on-screen.

## Uninstallation

In Windows go to **Settings** > **Apps**.
Uninstall the package "PI To OCS Agent".

## Security information and guidance

### OSIsoft's commitment

Because the PI System often serves as a barrier protecting control system networks and mission-critical infrastructure assets, OSIsoft is committed to (1) delivering a high-quality product and (2) communicating clearly what security issues have been addressed. This release of PI to OCS Agent is the highest quality and most secure version of the PI to OCS Agent released to date. OSIsoft's commitment to improving the PI System is ongoing, and each future version should raise the quality and security bar even further.

### Vulnerability communication

The practice of publicly disclosing internally discovered vulnerabilities is consistent with the [Common Industrial Control System Vulnerability Disclosure Framework](https://ics-cert.us-cert.gov/sites/default/files/ICSJWG-Archive/ICSJWG_Vulnerability_Disclosure_Framework_Final_1.pdf)  developed by the [Industrial Control Systems Joint Working Group (ICSJWG)](https://ics-cert.us-cert.gov/Industrial-Control-Systems-Joint-Working-Group-ICSJWG). Despite the increased risk posed by greater transparency, OSIsoft is sharing this information to help you make an informed decision about when to upgrade to ensure your PI System has the best available protection.
For more information, refer to [OSIsoft's Ethical Disclosure Policy](https://www.osisoft.com/ethical-disclosure-policy).

To report a security vulnerability, refer to [OSIsoft's Report a Security Vulnerability](https://www.osisoft.com/report-a-security-vulnerability).

### Vulnerability scoring
OSIsoft has selected the [Common Vulnerability Scoring System (CVSS)](https://www.first.org/cvss/v2/guide) to quantify the severity of security vulnerabilities for disclosure. To calculate the CVSS scores, OSIsoft uses the [National Vulnerability Database (NVD)](https://nvd.nist.gov/cvss.cfm?calculator&version=2) calculator maintained by the National Institute of Standards and Technology (NIST). OSIsoft uses High, Medium and Low categories to aggregate the CVSS Base scores. This removes some of the opinion related errors of CVSS scoring. As noted in the [CVSS specification](https://www.first.org/cvss/specification-document), base scores range from 0 for the lowest severity to 10 for the highest severity.

### Overview of new vulnerabilities found or fixed
This section is intended to provide relevant security-related information to guide your installation or upgrade decision. OSIsoft is proactively disclosing aggregate information about the number and severity of the PI to OCS Agent security vulnerabilities that are fixed in this release.

No security-related information is applicable to this release.

### Documentation overview

See the [PI to OCS documentation](https://docs.osisoft.com/bundle/ocs/page/add-organize-data/collect-data/connectors/pi-to-ocs/main-lp.html).

#### Technical Support and Resources

For technical assistance, contact OSIsoft Technical Support at +1 510-297-5828 or log a case through the [OSIsoft Customer Portal](https://customers.osisoft.com/).

Additionally, the [Contact Us](https://customers.osisoft.com/s/contactus)  page on the portal offers contact options for customers outside of the United States.

When you contact OSIsoft Technical Support, be prepared to provide this information:

* Product name, version, and build numbers
* Computer platform (CPU type, operating system,and version number)
* Time that the difficulty started
* Log files at that time
* Details of any environment changes prior to the start of the issue
* Summary of the issue, including any relevant log files during the time the issue occurred

The [PI Square](https://pisquare.osisoft.com/) community has resources to help you with your technical questions. [PI Developers Club](https://pisquare.osisoft.com/community/developers-club) program offers specific services to developers and system integrators.

OSIsoft, LLC 1600 Alvarado Street San Leandro, CA 94577 USA Tel: (01) 510-297-5800 Fax: (01) 510-357-8136 Web: https://www.osisoft.com 
PI to OCS Agent

&copy; 2021 by OSIsoft, LLC.

All rights reserved. No part of this publication may be reproduced, stored in a retrieval system, or transmitted, in any form or by any means, mechanical, photocopying, recording, or otherwise, without the prior written permission of OSIsoft, LLC.

OSIsoft, the OSIsoft logo and logotype, Managed PI, OSIsoft Advanced Services, OSIsoft Cloud Services, OSIsoft Connected Services, OSIsoft EDS, PI ACE, PI Advanced Computing Engine, PI AF SDK, PI API, PI Asset Framework, PI Audit Viewer, PI Builder, PI Cloud Connect, PI Connectors, PI Data Archive, PI DataLink, PI DataLink Server, PI Developers Club, PI Integrator for Business Analytics, PI Interfaces, PI JDBC Driver, PI Manual Logger, PI Notifications, PI ODBC Driver, PI OLEDB Enterprise, PI OLEDB Provider, PI OPC DA Server, PI OPC HDA Server, PI ProcessBook, PI SDK, PI Server, PI Square, PI System, PI System Access, PI Vision, PI Visualization Suite, PI Web API, PI WebParts, PI Web Services, RLINK and RtReports are all trademarks of OSIsoft, LLC.

All other trademarks or trade names used herein are the property of their respective owners.

U.S. GOVERNMENT RIGHTS

Use, duplication or disclosure by the US Government is subject to restrictions set forth in the OSIsoft, LLC license agreement and/or as provided in DFARS 227.7202, DFARS 252.227-7013, FAR 12-212, FAR 52.227-19, or their successors, as applicable.
