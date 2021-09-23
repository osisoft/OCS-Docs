---
uid: remove-agent-portal
---

## Remove an agent

You remove a PI to OCS Agent by first uninstalling it from the host machine and then the OCS portal. There are two parts to removing an agent:

* Step 1: Uninstall the agent from the host machine
* Step 2: Remove the agent listing in OCS  

## Step 1: Uninstall the PI to OCS Agent on the host machine

To remove the PI to OCS Agent application from a host machine, you uninstall it from the **Apps & features** window and then follow the prompts in the `PI to OCS Agent` window.

1. Click the Windows Start button, then click the **Settings** button.

   **Result:** The **Windows Settings** window opens.

2. Double-click **Apps**.

   **Result:** The **Apps & features** window opens.

3. Scroll to and click **PI to OCS Agent** in the list of installed apps.
 
1. Click **Uninstall** twice, then click **Yes** in the **User Account Control** window.

   **Result:** The **PI to OCS Agent (Administrator)** window opens.

5. Select the **Uninstall** option, then click **Next**.

6. Click the **Unregister agent from OCS** option, then click **Next**.

   **Result:** The agent's associated client and connection information is also removed from OCS during the uninstall process.

   **Note:** After uninstalling the agent from the host machine, you still need to remove the agent from the OCS portal. 

7. Select the user account you wish to use to log on to OCS, then close the browser window.

   **Result:** You are returned to the **PI to OCS Agent** window.

8. Click **Uninstall**, then click **Close**.

   **Result:** The PI to OCS Agent application is uninstalled on the host machine.

## Step 2: Remove the PI to OCS Agent on the OCS portal

After uninstalling an agent from a host machine, you also need to remove it from the OCS portal.

1. Log on to the [OCS portal](https://cloud.osisoft.com).
 
1. Click the menu ![ ](../..\images\waffle-button.png) icon, then click **Data Collection > PI to OCS Agents**.

1. In the `PI to OCS Agents` window, select the agent you just uninstalled.

1. Click the **Remove Agent** button.

   **Result:** The **Remove Agent** dialog box opens.

1. Click **Remove**.

   **Result:** The agent is removed in OCS.
