---
uid: pi2ocs-rel-summary
---

# PI to OCS release summary

## Release 2.0: May 13, 2022

## Overview

This release covers the PI To OCS Agent, a component that is installed on-premises to replicate data and assets from the PI System to OSIsoft Cloud Services.

## Fixes and enhancements

### Enhancements

*Edit a transfer*

PI to OCS now allows you to edit a transfer’s settings and add or remove AF elements and PI point references.

*Health events*

Easy access to both PI to OCS Agent and transfer health events is available.

*Alternate display name*

The ability to use an alternative server name is now supported in the PI to OCS Configuration Utility. Users can enter an alternate name in the Alternate Display Name field. This text will replace an on-premises Data Archive server names in stream IDs, as well as AF server names that appears in the PI to OCS Agents window.
 
**Note:** Stream IDs are immutable. If a transfer is in progress, new streams are created based on the current transfer’s configuration settings.

*AF element replication*

PI to Data Hub now supports replication of AF elements to AVEVA™ Data Hub, the rebranded version of OCS on the AVEVA™ Connect cloud platform. AF elements are created as assets in AVEVA Data Hub. Existing PI to OCS users will need to migrate to PI to Data Hub to take advantage of this new feature. Please contact your account manager to learn how to switch from OCS to AVEVA Data Hub.

### Fixes

None

### Known issues

* Query search results that contain a very large number of PI points (> 1 million) will generate an exception error and not be processed.

* The AF Server must have a default Data Archive server specified for PI to OCS to operate properly.

* Streams with AF elements and referenced PI points are not deleted even when the `Automatically remove Streams and Assets` option has been selected; this exception includes instances of assets not created for AF elements due to errors (for example, attribute errors).

* Configuring two transfers in the same namespace, where the transfers references the same AF element(s), results in the asset properties of one transfer being overridden/replaced by the second transfer.

## System requirements

This release supports Windows 10, Windows Server 2016 and Windows Server 2019.

Minimum requirements:

* 4GB of RAM
* Internet connectivity at least 10Mbit/sec
* Prior editions of Windows are not supported.

## Distribution Kit Files

| Product  | Software Version |
|------------- | ------------ |
| PI to OCS Agent Installation | 2.0 |

## Installation and upgrade

Run the `PIToOCSAgent.exe` setup kit. Instructions are provided on-screen.

## Uninstallation

1. Select the Windows **Start** button, then select **Settings**.

1. In the `Settings` window, select **Apps**.

1. Under the **Apps & features** list, navigate to and select **PI to OCS Agent**, then select **Uninstall** twice.

## Security information and guidance

### AVEVA's commitment

Because the PI System often serves as a barrier protecting control system networks and mission-critical infrastructure assets, AVEVA is committed to (1) delivering a high-quality product and (2) communicating clearly what security issues have been addressed. This release of PI to OCS Agent is the highest quality and most secure version of the PI to OCS Agent released to date. AVEVA's commitment to improving the PI System is ongoing, and each future version should raise the quality and security bar even further.

### Vulnerability communication

The practice of publicly disclosing internally discovered vulnerabilities is consistent with the [Common Industrial Control System Vulnerability Disclosure Framework](https://www.cisa.gov/uscert/sites/default/files/ICSJWG-Archive/ICSJWG_Vulnerability_Disclosure_Framework_Final_1.pdf) developed by the [Industrial Control Systems Joint Working Group (ICSJWG)](https://www.cisa.gov/uscert/ics/Industrial-Control-Systems-Joint-Working-Group-ICSJWG). Despite the increased risk posed by greater transparency, AVEVA is sharing this information to help you make an informed decision about when to upgrade to ensure your PI System has the best available protection.

To report a security vulnerability to AVEVA, contact productsecurity@aveva.com. Also see AVEVA's [Cyber Security Updates](https://www.aveva.com/en/support-and-success/cyber-security-updates/).

### Vulnerability scoring

AVEVA has selected the [Common Vulnerability Scoring System (CVSS)](https://www.first.org/cvss/v2/guide) to quantify the severity of security vulnerabilities for disclosure. To calculate the CVSS scores, AVEVA uses the [National Vulnerability Database (NVD)](https://nvd.nist.gov/vuln-metrics/cvss/v2-calculator?calculator&.0) calculator maintained by the National Institute of Standards and Technology (NIST). AVEVA uses High, Medium and Low categories to aggregate the CVSS Base scores. This removes some of the opinion related errors of CVSS scoring. As noted in the [CVSS specification](https://www.first.org/cvss/specification-document), base scores range from 0 for the lowest severity to 10 for the highest severity.

### Overview of new vulnerabilities found or fixed

This section is intended to provide relevant security-related information to guide your installation or upgrade decision. AVEVA is proactively disclosing aggregate information about the number and severity of the PI to OCS Agent security vulnerabilities that are fixed in this release.

No security-related information is applicable to this release.

### Documentation overview

See the [PI to OCS documentation](xref:main-lp).

© 2022 AVEVA Group plc and its subsidiaries.