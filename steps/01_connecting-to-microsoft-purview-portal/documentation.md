# Connecting to the Microsoft Purview Account

In this lab, users will learn how to connect to the Microsoft Purview Portal.

## Pre-requisites:

- An *Azure account* with an *active subscription*.
- Users should have *User Admin Access* in order to set Managed Identity within resources.

## Procedure:

1. Go to the resource group deployed in the Azure Portal and check the resources.

	- Azure Data Factory
	- Disk
	- Key Vault
	- Microsoft Purview Account
	- Network Interface
	- Network Security Group
	- Public IP Address
	- SQL Database
	- SQL Server
	- SQL Virtual Machine
	- Storage Account
	- Synapse Workspace
	- Virtual Machine
	- Virtual Network

2. Amongst the list of resources, open the Purview Account that goes with **pvlab-{randomid}-purview**.

3. Scroll down, and click on the **Open Purview Studio Tile**.
				(or)
   Browse to https://web.purview.azure.com, select your Purview account, and sign in to the workspace.

4. After landing on to the Purview Workspace. Your Home Page looks like below.

5. After landing on to the Purview Workspace. Go to **Data Map** tab on your left pane.

6. Select **Collections** -> click on your root collection [**pvlab-{randomid}-purview**] -> Role Assignments tab -> Check whether username is added to all the roles.
   If not, click on Add role and give your microsoft account id or name.
