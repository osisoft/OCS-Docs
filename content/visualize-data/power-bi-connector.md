---
uid: PowerBI
---

# OSIsoft Cloud Services Power BI Connector

The OSIsoft Cloud Services Power BI Connector retrieves data views from OCS and makes them available in Microsoft Power BI for advanced data visualization and analysis.

## Install OSIsoft Cloud Services Power BI Connector
<!-- WI 217906 and 237964-->
1. Download the OCSPowerBIConnector.exe file from the [OSIsoft Customer portal](https://customers.osisoft.com/s/products).

1. Install OSIsoft Cloud Services Power BI Connector by either the setup wizard or silent installation.

    1. Setup wizard
        1. Double click the `OCSPowerBIConnector.exe` file and select **Next**.
        1. Optional: To install the connector to an on-premises data gateway, select `On-premises data gateway installation` and enter the directory where you want to install the connector.<br>

    1. Silent installation
        1. Open a command prompt window and type following command.<br>
        `.\OCSDataConnectorInstaller.exe -Y INSTALLDIR="<install path>" /quiet`

           **Note:** OSIsoft Cloud Services Power BI Connector supports silent installation for on-premises data gateway installations.

## Use OSIsoft Cloud Services Power BI Connector with Microsoft Power BI

1. In Microsoft Power BI, in the entry field of the **Get Data** window, type *OSI*.<br>The **OSIsoft Cloud Services Data Views** connector file displays in the **All** pane.

   ![Get Data](./images/get-data.png)

1. Click the **OSIsoft Cloud Services Data Views** connector file, and then click **Connect**.

1. Click **Continue** in the **Connecting to a third-party service** warning.

1. In the **OSIsoft Cloud Services Data Views** window, enter the OCS tenant and namespace for the data views you want to access, and then click **OK**.<br>The OSIsoft Cloud Services sign-in window displays if you have not already signed into OCS.

    - If you have not already signed into OCS, click **Sign in as different user** and complete the OCS user authentication process.

1. In the **OSIsoft Cloud Services Data Views** sign-in window, click **Connect**.<br>The **Navigator** pane displays.

1. In the **Navigator** pane, select the checkbox for the first data view you want to work with in Microsoft Power BI.

   ![Select Data Views](./images/click-data-view-box.png)

1. Specify a Start Index, End Index, and Interval for the selected data view, and click **Apply** to apply the values you have specified. Repeat steps 9-10 for each additional data view you want to work with in Power BI.

    **Note**: If a data view has default values defined for Start Index, End Index, and Interval, enter new values or click **Apply** to accept the defaults.

1. Click **Load** at the bottom of the **Navigator** pane to load all selected data views. The selected data view data is now available in the Microsoft Power BI **Visualizations** pane.

1. Select visualization options from the **Visualizations** pane to select visualizations you want to create.
