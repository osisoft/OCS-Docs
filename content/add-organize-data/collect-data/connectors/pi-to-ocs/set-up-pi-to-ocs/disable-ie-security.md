---
uid: disable-ie-security
---

# Disable IE enhanced security

If Internet Explorer Enhanced Security Configuration (IE ESC) is turned on, you will receive an error message to disable this setting before you can log on and register the PI to OCS Agent. To avoid this issue, you can switch to another web browser during agent installation.

To turn off Internet Explorer Enhanced Security Configuration:

1. On the computer where the agent is installed (Windows Server operating system), enter **Server Manager** in Windows search to start Server manager application.

1. Select **Local Server**.

1. In the **Properties** section, locate the **Internet Explorer Enhanced Security Configuration** setting, then select the current setting to open the property page.
 
   The `Internet Explorer Enhanced Security Configuration` dialog box opens. 

1. Under **Administrators**, select the **Off** option.

1. Select **OK**.

You can now complete the PI to OCS Agent install and registration.

**Note:** You can turn on IE Enhanced Security Configuration after you complete the PI to OCS Agent installation. See [FAQ about IE ESC](https://docs.microsoft.com/en-us/troubleshoot/developer/browsers/security-privacy/enhanced-security-configuration-faq) for more information.
