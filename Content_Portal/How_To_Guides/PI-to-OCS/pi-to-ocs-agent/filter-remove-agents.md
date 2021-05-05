---
uid: remove-agents
---

# Filter, uninstall or remove an agent

You can search for PI to OCS Agents that have been installed on host machines at your organization.  The global filter feature allows you to search for Agents by name, status, version number, hostname, PI Data Archive or AF server name, region, and namespace.  

Use the global filter feature to filter down a large list of agents to only ones of interest.  For example, you may want to remove or uninstall older agents.

* [Search for an agent](#search-for-an-agent)
* [Uninstall an agent](#uninstall-an-agent)
* [Remove an agent](#remove-an-agent)

## Search for an agent

1. Log on to the [OCS portal](https://cloud.osisoft.com).

2. Click the menu ![ ](../../images/waffle-button.png) icon, then click **PI to OCS Agents** (under Data Collection).

   The `PI to OCS Agents` window opens.

3. In the **Filter Agents** text box, enter the first few characters of the agent's name or version number.  

   If there is a match, any agents that meet the filter criteria are displayed in the list of agents.

## Uninstall an agent

You may want to remove a PI to OCS Agent from a host machine. To uninstall an agent, open the `Apps & features` window and then follow the prompts in the `PI to OCS Agent` window.

#### Procedure

1. Click the Windows Start button, then click **Settings**.

   The **Windows Settings** window opens.
2. Double-click **Apps** to open the `Apps & features` window.
3. Scroll to and click **PI to OCS Agent** in the list of installed apps.
4. Click **Uninstall** twice, then click **Yes** in the `User Account Control` window.

   The `PI to OCS Agent (Administrator)` window opens.

5. Select the **Uninstall** option, then click **Next**.
6. Click the **Unregister agent from OCS** option, then click **Next**.

   The agent's associated client and connection information is removed in OCS.
7. Select the user account you wish to use to log on to OCS.
   
   You are returned to the `PI to OCS Agent` window.
8. Click **Uninstall**, then click **Close**.
   
   The PI to OCS Agent is uninstalled and removed from the host machine.

## Remove an agent

You can remove an unneeded agent in the PI to OCS Agents page.

1. Log on to the [OCS portal](https://cloud.osisoft.com).
2. Click the menu ![ ](../../images/waffle-button.png) icon, then click **PI to OCS Agents** (under Data Collection).

3. In the `PI to OCS Agents` window, select an agent in the list.

4. Click the **Remove Agent** button above the list of agents.
   
   The `Remove Agent` dialog box opens.
   ![](../../images/remove-agent.png)

5. Click **Remove**.
 
   The agent is removed from the list and deleted from OCS.