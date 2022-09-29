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


































