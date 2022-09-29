# Module 02A - Register & Scan ADLS Gen2 Account

## Introduction
To populate Microsoft Purview with assets for data discovery and understanding, you must register sources that exist across our data estate so that we can leverage the out of the box scanning capabilities. Scanning enables Microsoft Purview to extract technical metadata such as the fully qualified name, schema, data types, and apply classifications by parsing a sample of the underlying data.

In this module, you'll walk through how to register and scan ADLS Gen2 account. You'll register a ADLS Gen2 account and configure scanning. By the end of this module you'll have technical metadata, such as schema information, stored in Purview. You can use this to start linking to business terms, allowing your team members to easier find data.

## Prerequisites

1.	An Azure account with an active subscription.
2.	An Azure Data Lake Storage Gen2 Account.
3.	An Azure Microsoft Purview account.
4.	Upload BingCoronavirusQuerySet files to Gen2 storage in Azure Purview.


## Objectives

* Register and scan an Azure Data Lake Storage Gen2 account using the Microsoft Purview managed identity.

## 1. Grant the Microsoft Purview Managed Identity Access

1. Navigate to your Azure Data Lake Storage Gen2 account (e.g. `pvlab{randomId}adls`) and select **Access Control (IAM)** from the left navigation menu. Click **Add role assignment**.

    ![role](./assets/4-6_role.jpg "role")
  
2. Filter the list of roles by searching for `Storage Blob Data Reader`, click the row to select the role, and then click **Next**.

    ![addrole](./assets/4-7_add_role.jpg "addrole")

3. Under **Assign access to**, select **Managed identity**, click **+ Select members**, select **Microsoft Purview account** from the **Managed Identity** drop-down menu, select the managed identity for your Microsoft Purview account (e.g. `pvlab-{randomId}-pv`), click **Select**. Finally, click **Review + assign**.

    ![managed_identity](./assets/4-8_managed_identity.jpg "managed_identity")
    
    ![addpurview](./assets/4-9_add_purview.jpg "addpurview")

4. Click **Review + assign** once more to perform the role assignment.

    ![review](./assets/4-10_review.jpg "review")

5. To confirm the role has been assigned, navigate to the **Role assignments** tab and filter the **Scope** to `This resource`. You should be able to see that the Microsoft Purview managed identity has been granted the **Storage Blob Data Reader** role.

    ![confirm](./assets/4-10_confirm.jpg "confirm")
    
## 2. Upload Data to Azure Data Lake Storage Gen2 Account

This Step is already done for you. To confirm the file is present inside ADLS Gen2 Storage account, Navigate to your Azure Data Lake Storage Gen2 account (e.g. `pvlab{randomId}adls`) and select **Containers** from the left navigation menu. Click on **raw** container. Inside you will see a folder with the name **BingCoronavirusQuerySet**.

![files](./assets/4-0_raw.jpg "files")
    

## 3. Register a Source (ADLS Gen2)

1. Open the **Microsoft Purview Governance Portal**, navigate to **Data Map** > **Sources**, and click on **Register**.

    ![register](./assets/4-1_register.jpg "register")

2. Search for `Data Lake`, select **Azure Data Lake Storage Gen2**, and click **Continue**.

    ![adlsgen2](./assets/4-2_adls_gen2.jpg "adlsgen2")

3. Select the **Azure subscription**, **Storage account name**, **Collection**, and click **Register**.

    ![registeradls](./assets/4-3_register_adls.jpg "registeradls")


## 4. Scan a Source with the Microsoft Purview Managed Identity

1. Open the **Microsoft Purview Governance Portal**, navigate to **Data Map** > **Sources**, and within the Azure Data Lake Storage Gen2 tile, click the **New Scan** button.

    ![scan](./assets/4-5_scan.jpg "scan")

2. Click **Test connection** to ensure the Microsoft Purview managed identity has the appropriate level of access to read the Azure Data Lake Storage Gen2 account. If successful, click **Continue**.

    ![scan](./assets/4-11_scan.jpg "scan")

3. Expand the hierarchy to see which assets will be within the scans scope, and click **Continue**.

    ![scope](./assets/4-12_select_scope.jpg "scope")

4. Select the system default scan rule set and click **Continue**.

    ![scanrule](./assets/4-13_scan_rule.jpg "scanrule")

5. Select **Once** and click **Continue**.

    ![triggeronce](./assets/4-14_trigger.jpg "triggeronce")

6. Click **Save and Run**.

    ![saverun](./assets/4-15_review.jpg "saverun")

7. To monitor the progress of the scan run, click **View Details**.

    ![details](./assets/4-16_details.jpg "details")

8. Click **Refresh** to periodically update the status of the scan. Note: It will take approximately 5 to 10 minutes to complete.

    ![scanstatus](./assets/4-17_scan_status.jpg "scanstatus")
    


































