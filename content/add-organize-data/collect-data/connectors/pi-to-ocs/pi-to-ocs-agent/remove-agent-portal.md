---
uid: remove-agent-portal
---

## Remove an agent

You remove a PI to OCS Agent by first uninstalling it from the host machine and then the portal. There are two parts to removing an agent:

* Step 1: Uninstall the agent from the host machine

* Step 2: Remove the agent listing in OCS  

## Step 1: Uninstall the PI to OCS Agent on the host machine

To remove the PI to OCS Agent application from a host machine, you uninstall it from the **Apps & features** window and then follow the prompts in the `PI to OCS Agent` window.

1. Click the Windows Start button, then click the **Settings** button.

   **Result:** The **Windows Settings** window opens.

1. Double-click **Apps**.

   **Result:** The **Apps & features** window opens.

1. Scroll to and click **PI to OCS Agent** in the list of installed apps.
 
1. Click **Uninstall** twice, then click **Yes** in the **User Account Control** window.

   **Result:** The **PI to OCS Agent (Administrator)** window opens.

1. Select the **Uninstall** option, then click **Next**.

1. Click the **Unregister agent from OCS** option, then click **Next**.

   **Result:** The agent's associated client and connection information is also removed from OCS during the uninstall process.

   **Note:** After uninstalling the agent from the host machine, you still need to remove the agent from the portal. 

1. Select the user account you wish to use to log on, then close the browser window.

   **Result:** You are returned to the **PI to OCS Agent** window.

1. Click **Uninstall**, then click **Close**.

   **Result:** The PI to OCS Agent application is uninstalled on the host machine.

## Step 2: Remove the PI to OCS Agent on the portal

After uninstalling an agent from a host machine, you also need to remove it from the portal.

1. In the left pane, select **Data Collection** > **PI to OCS Agents**.

1. In the `PI to OCS Agents` window, select an agent in the list.

1. Click the **Remove Agent** button above the list of agents.

   **Result:** The **Remove Agent** dialog box opens.

1. Click **Remove**.

   **Result:** The agent is removed in the portal.
