# Collections in Azure Purview

Collections are Microsoft Purview's tool to manage ownership and access control across assets, sources and information.
They also organize your sources and assets into categories that are customized to match your management experience with your data.

### Pre-requisites:

- An *Azure account* with an *active subscription*
- A *Purview resource*

### Creating Collection:

1. Navigate to Data Map tab in your left pane. Go to **Collections** -> Select **Root Collection** (pvlab-{randomid}-purview) -> Add a Collection

   ![addCollection](./assets/2-1_add_collection "add collection")

2. Set your Collection's Display Name as ```Contoso```

   ![collectionName](./assets/2-2_collection_name "collection name")

3. In the Collection Admin, search by your name or email address and select.
   ```E.g: xxx@microsoft.com```

4. Click **Create**

5. User can also edit a collection by clicking **Edit** ✏️ option.

   ![edit](./assets/2-3_edit "edit")

6. Description and collection admin can be changed or added.

   ![edit2](./assets/2-4_edit_2 "edit 2")

### Creating Sub-collection:

1. Click on the **Contoso** Collection. Add a collection -> New Subcollection

   ![addSubcollection](./assets/2-5_add_subcollection "add subcollection")

2. Give a display name and add collection admin. Click **Create**.

   ![subcollectionName](./assets/2-6_subcollection_name "subcollection name")

> Now that you have collection created. We can add role assignments to the collections and manage the access.

## Role Assignments:

Select Role Assignments tab to see all the roles in a collection.

- **_Collection admins_**: 
  Collection admins can edit the collection, its details, and add subcollections. They can also add data curators, data readers, and other Microsoft Purview roles to a collection scope. Collection admins that are automatically inherited from a parent collection can't be removed.

- **_Data source admins_**:
  Data source admins can manage data sources and data scans.

- **_Data curators_**:
  Data curators can perform create, read, modify, and delete actions on catalog data objects and establish relationships between objects.

- **_Data readers_**:
  Data readers have access to read catalog data objects.

- **_Data share contributors_**:
  Data share contributors can share data within an organization and with other organizations using Data share capabilities. They can view, create, update, and delete sent and received shares.

- **_Insights readers_**:
  A role that provides read-only access to data estate insights reports.

- **_Policy authors_**:
  Policy authors can create, view, update and delete policies through the Policy management app.

- **_Workflow admins_**:
  Workflow admins can perform create, read, modify, and delete action on workflow definitions and the associated workflow runs. Workflow admins can also bind workflow definition with supported business objects.

- **_Restrict inherited permissions_**:
  Collection permissions are inherited automatically from the parent collection. 
  Any permissions on the root collection will be inherited by all collections below it.
  Restricting access will remove inherited permissions from this collection and any subcollections.
  Collection admin permissions won't be affected.

### Adding Role Assignments:

Click on Edit Role Assignments -> Add role -> Give username or email id

![editRole](./assets/2-7_edit_role "edit role")

### Restricting Inheritance:

Toggle on the **Restrict Inherited Permissions** option. Click **Restrict Access** in the pop-up shown.

![restrict](./assets/2-8_restrict "restrict")

![toggle](./assets/2-9_toggle "toggle")

You can see that the user has been removed from the inherited roles in data source admins, data curators, data readers, data share contributors, insights readers, policy authors and workflow admins.

### Removing Role Assignments:

Click on a Role -> Click the ``x`` icon. The user will be removed.

![addOrRemove](./assets/2-10_add_or_remove "add or remove")
