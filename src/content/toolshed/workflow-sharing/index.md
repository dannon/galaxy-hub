---
title: ToolShed Workflow Sharing
---
<div class='center'> <a href='http://toolshed.g2.bx.psu.edu'>![Galaxy Main ToolShed](/src/images/logos/ToolShed.jpg)</a> </div>



# Importing a workflow via a URL

The Galaxy ToolShed plays a beneficial role in enabling sharing of exported Galaxy workflows between different Galaxy instances. In the past, importing a workflow was functional only if all of the tools required by the workflow were available in the Galaxy instance into which it was being imported. Now workflows can be imported into Galaxy instances that are missing required tools. Let's take a look at what happens if we try importing one of the workflows available in the published paper titled [**Dynamics of mitochondrial heteroplasmy in three families investigated via a repeatable re-sequencing study**](http://main.g2.bx.psu.edu/heteroplasmy). Clicking the **Workflow** link in the top Galaxy menu bar in our local Galaxy instance displays the following page which includes a feature labeled **Upload or import workflow**.

![](/src/toolshed/workflow-sharing/workflow_main.png)

Selecting the **Upload or import workflow** option in the page above displays the **Import an exported Galaxy workflow** page where we can enter the URL where the workflow is located and import it.

![](/src/toolshed/workflow-sharing/import_workflow.png)

Clicking the **Import** button in the page above imports the workflow into Galaxy. In doing this, the workflow import utility determines that our Galaxy instance does not have all of the tools required by the workflow, and so the following message is displayed. Here we are presented with the list of ToolSheds that are accessible from our Galaxy instance.

![](/src/toolshed/workflow-sharing/tools_missing.png)

When the link to any of the accessible ToolSheds is clicked, a search of that ToolShed is performed in an attempt to locate the list of tools required by the workflow, but not available in our Galaxy instance. In our scenario, suppose that we have repositories in our BX ToolShed that include all of the tools required by the workflow, but are not available in our Galaxy instance. If this is the case, clicking the link to our BX ToolShed displays the following list of repositories that include at least one of the tools for which we are searching.

![](/src/toolshed/workflow-sharing/matching_repositories.png)

Selecting all of the repositories and clicking **Install** displays the following page where we can select a section in the tool panel in which to install the tools.

![](/src/toolshed/workflow-sharing/select_tool_panel_section.png)

Selecting a tool panel section and clicking **Install** installs all of the repositories onto the server which hosts our Galaxy instance and then displays the following message. Since the repositories have all been installed and all of the tools that they contain have been loaded into our Galaxy instance, the workflow we imported can now be executed with input data that we choose.

![](/src/toolshed/workflow-sharing/tools_installed.png)

# Finding workflows in ToolShed repositories

The **Search** section of the left ToolShed menu panel includes an option labeled **Search for workflows**. Clicking on the **Search for workflows** menu item will display the following page. You can search repositories for workflows by entering a workflow name. Here we are searching for all workflows whose name contains the string **genome** (we are not matching on the exact strings).

![](/src/toolshed/workflow-sharing/find_workflows.png)

Clicking the **Search repositories** button will display a list of all repositories in the ToolShed that matched our criteria (i.e., the repository contains at least 1 exported workflow whose name contains the string **genome**).

![](/src/toolshed/workflow-sharing/matched_repositories1.png)

Clicking on the repository name link in the above page will display the information for that repository and associated change set revision, including a section labeled **Preview tools and inspect metadata by tool version**. Since the repository matching our search contains an exported Galaxy workflow, this section includes not only the list of tools included in the repository, but also the workflow. Information about the workflow, including the number of steps, the format-version and annotation is displayed.

![](/src/toolshed/workflow-sharing/repository_tools_and_workflow.png)

Clicking the workflow's name link displays an SVG graphic of the workflow (your browser must support svg graphic display for the image to be rendered). Boxes in the graphic that represent tools required by the workflow which are available in the repository are displayed with a brown background while boxes representing tools required by the workflow but that are not available in the repository have a red background.

![](/src/toolshed/workflow-sharing/workflow_svg.png)

The **Repository Actions** popup menu includes options for importing just the workflow into your local Galaxy instance or installing the complete repository.

![](/src/toolshed/workflow-sharing/workflow_repository_options_popup.png)

Selecting the **Import workflow to local Galaxy** option in the **Repository Actions** pop-up menu in the page above will make the workflow available in the Workflow interface. If your local Galaxy instance is missing any of the tools that the workflow requires, a message is displayed that includes links to all accessible ToolSheds enabling you to search for the missing tools. This behavior is the same as that described in the previous topic section.

Selecting the **Install repository to local Galaxy** option in the **Repository Options** pop-up menu in the page above will install the repository into your local Galaxy using the process described in the previous topic section titled **Automatic installation of Galaxy ToolShed repository tools into a local Galaxy instance**.

# Importing a workflow from an installed ToolShed repository

Let's assume we installed the ToolShed repository named nextgen\_variant\_identification that we found in the previous topic section when we searched the main Galaxy ToolShed for workflows whose name included the string "genome". When we select the **Manage installed ToolShed repositories** from the **Administration** menu, this repository will be included in the list of installed ToolShed repositories.

![](/src/toolshed/workflow-sharing/installed_repositories.png)

Clicking on the name link of the installed nextgen\_variant\_identification repository will display the following page where we can view information about the repository and make desired changed to the description.

![](/src/toolshed/workflow-sharing/view_found_repository.png)

The **Repository Actions** pop-up menu in the page above includes options to browse the repository and get updates for the repository from the ToolShed from which it was installed. Selecting the **Browse repository** option from this menu displays the following page.

![](/src/toolshed/workflow-sharing/nextgen_variant_identification_repository.png)

The pop-up menu associated with the workflow name in the page above provides the ability to import the workflow into your Galaxy instance. If your Galaxy instance is missing any of the tools that the workflow requires, a message is displayed that includes links to all accessible ToolSheds enabling you to search the ToolSheds for the missing tools. This behavior is the same as that described in the previous topic section titled **Enabling workflow sharing: importing a workflow via a URL**.
