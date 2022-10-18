# Maintaining Glossary by Creating and Importing Terms

A glossary provides vocabulary for business users. 
It consists of business terms that can be related to each other and allows them to be categorized so that they can be understood in different contexts.
These terms can be then mapped to assets like a database, tables, columns, etc.
This helps in abstracting the technical jargon associated with the data repositories and allows the business user to discover and work with data in the 
vocabulary that is more familiar to them.
A business glossary is a collection of terms. 
Each term represents an object in an organization and it is highly likely that there are multiple terms representing the same object. 
These multiple terms havea relationship with each other.

In this demo you learn how to create terms using a system and custom term template. 
You'll also learn how to import and export terms. Lastly, you learn about linking terms to data assets, 
which helps to relate technical metadata to business metadata.

## Prerequisites

* An *Azure account* with an *active subscription*.
* A **import-terms-sample.csv** file in the **pvlab{randomid}adls** storage account.
* User should have *Data Curator* and *Data Reader* Roles.

## Objectives

* **Create a Term** in the Glossary using the **System Default Term Template**.
* **Create a Term** in the Glossary using a **Custom Term Template**.
* **Bulk Import Terms** into the Glossary via a CSV file.
* **Bulk Export Terms** from the Glossary into a CSV file.
* **Assign a Term** to an Asset in the Data Catalog.
* **Update an existing Term** with Related Terms and Contacts.
* **Unassign a Term**.

## Create a Term (System Default Term Template)

1. Open the **Microsoft Purview Governance Portal** and from the **Data catalog**, click **Glossary** (or) Open the **Manage Glossary** tile.

   ![glossary](./assets/6-1_Glossary.jpg "glossary")

2. Click **New term**.

   ![newTerm](./assets/6-2_new_term.jpg "new term")

3. Select the **System default** term template and click **Continue**.

   A **Term Template** determines the attributes for a term. The **System default** term template has basic fields only (e.g. Name, Definition, Status, etc). **Custom** term templates on the other hand, can be used to capture additional custom attributes.

   ![systemTemplate](./assets/6-3_System_template.jpg "system template")

4. Change the **Status** of the term to `Approved` and then fill the values below into the appropriate field, then click **Create**.
   Field | Definition
   --- | ---
	 Name | ``Contoso Parent``
   Definition | ``This will be the parent term``
   Acronym | ``CP``
   Resource Name | ``Microsoft Purview``
   Resource Link | ``https://aka.ms/Azure-Purview``

   ![name](./assets/6-4_name.jpg "name")
   
   ![addResource](./assets/6-5_add_resource.jpg "add resource")

## Create a Term (Custom Term Template)

1. Click **New term**.

   ![newTerm](./assets/6-2_new_term.jpg "new term")

2. Click **New term template**.

   ![newTemplate](./assets/6-6_new_template.jpg "new template")

4. Specify a **Template name** (e.g. ""``Contoso Template``"") and click **New attribute**.

   ![7name](./assets/6-7_name.jpg "7 name")

5. Populate the attribute fields as per the examples below and click **Apply**.
   Field | Definition
   --- | ---
	 Attribute Name | ``Business Unit``
   Field Type | ``Single Choice``
   Choices | ``Sales, Marketing, Finance, Human Resources, IT``
   
   ![apply](./assets/6-8_apply.jpg "apply")

	> Field Type Options:
	> Single Choice- Can select only one in the given choice list
	> Multiple Choice- Can select multiple fields
	> Text- Include text
	> Date- Can select a date
	> In this demo, we are using **single choice**.

6. Click **Create**.

   ![create](./assets/6-9_create.jpg "create")

7. Select **Contoso Template** and click **Continue**.

   ![select](./assets/6-10_select.jpg "select")

8. Change the **Status** of the term to `Approved` and then **copy** and **paste** the values below into the appropriate field, then click **Create**.
   Field | Definition
   --- | ---
	 Name | ``Contoso Child``
   Definition | ``This will be the child term``
   Acronym | ``CC``
   Parent | ``Contoso Parent``
   Business Unit | ``Marketing``
	
   ![newTerm](./assets/6-11_new_term.jpg "new term")
   
9. From the **Glossary** screen, change the view to **Hierarchical view** to see the hierarchical glossary.

   ![heirarchical](./assets/6-12_hierarchial.jpg "heirarchical")

## Bulk Import Terms

1. Download a copy of **import-terms-sample.csv** to your local machine from the **pvlab{randomid}adls** storage account.

   Go to **pvlab{randomid}adls** -> **raw** -> **import-terms-sample.csv** -> **Download**

   ![download](./assets/6-15_download.jpg "download")

2. From the **Glossary** screen, click **Import terms**.

   ![import](./assets/6-13_import.jpg "import")

3. Select the **System default** term template and click **Continue**.

   ![14select](./assets/6-14_select.jpg "14select")

4. Click **Browse** and open the local copy of **import-terms-sample.csv**.

   ![browse](./assets/6-16_browse.jpg "browse")

5. Click **OK**.

6. Once complete, you should see 50 additional terms beneath the parent (Workplace Analytics). 

   You can quickly find specific types of terms using the filters at the top (e.g. Status = Approved, Expired, Draft).

   ![view](./assets/6-17_view.jpg "view")

## Bulk Export Terms

1. From the **Glossary** screen, we want to select ALL terms (top check box) and then de-select terms that do not belong to Workplace Analytics (i.e. Contoso Parent, Contoso Child). **All Workplace Analytics terms** should be selected. Click **Export terms**. 

   ![export](./assets/6-18_export.jpg "export")

2. If the export was successful, you should find a **CSV** file has been copied to your local machine (e.g. Downloads).

   ![downloads](./assets/6-19_downloads.jpg "downloads")

## Assign a Term to an Asset

1. Perform a wildcard search by typing asterisk (**\***) into the search bar and hitting the Enter key to submit the query. Click on an asset title (e.g. `QueriesByState`) to view the details.

   ![search](./assets/6-20_search.jpg "search")

2. Click **Edit**.

   ![edit](./assets/6-21_edit.jpg "edit")

3. Open the **Glossary terms** drop-down menu and select a glossary term (e.g. `Contoso Child`). Click **Save**.

   ![save](./assets/6-22_save.jpg "save")

4. Click on the hyperlinked term name to view the glossary term details.

   ![hyperlink](./assets/6-23_hyperlink.jpg "hyperlink")

5. Click **Refresh** to view the **Catalog assets** the term is assigned to.

   ![viewAsset](./assets/6-24_view_asset.jpg "view asset")

## Update an Existing Term

1. From the **Glossary** screen, open an existing term (e.g. `Aggregation`).

   ![update](./assets/6-27_update.jpg "update")

2. Navigate to the **Related** tab and click **Edit**.

   ![28edit](./assets/6-28_edit.jpg "28edit")

3. Use the drop-down menu to assign two glossary terms as **Synonyms**.

   **Synonyms** are other terms with the same or similar definitions. Whereas **Related terms** are other terms that are related but have different definitions.

   ![synonyms](./assets/6-29_synonyms.jpg "synonyms")

4. Use the drop-down menu to assign two glossary terms as **Related terms**.

   ![related](./assets/6-30_related.jpg "related")

5. Navigate to the **Contacts** tab, click **edit** and assign an **Expert** and a **Steward**. Click **Save**.

   Glossary terms can be related to two different types of contacts. **Experts** are typically business process or subject matter experts. Where as **Stewards** define the standards for a data object or business term. They drive quality standards, nomenclature, rules.

   ![contacts](./assets/6-31_contacts.jpg "contacts")

## Un-Assign a Term to an Asset 

	⚠️ After trying un-assignment of terms make sure you add them back as this will be used later in search and browse demo

   1. Perform a wildcard search by typing asterisk * into the search bar and press Enter key to submit the query.
   
      ![search](./assets/6-20_search.jpg "search")
      
   2. Click **Edit**.
   
      ![edit](./assets/6-21_edit.jpg "edit")

   3. Open the Classification drop-down and unselect World cities, Glossary terms drop-down and unselect a glossary term (e.g. Contoso Child). Click Save.

      ![unselect](./assets/6-25_unselect.jpg "unselect")

   4. Click on the hyperlinked term name to view the glossary term. You can see that **No Glossary Terms** available.

      ![check](./assets/6-26_check.jpg "check")
      
   [⏮️ Previous Module](../04_searching-and-editing-assets/documentation.md) - [Next Module ⏭️ ](../06_approval-workflow-for-business-terms/documentation.md)
