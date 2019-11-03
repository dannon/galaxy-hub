---
title: A single tool or a suite of tools per repository
---
<div class='center'> <a href='http://toolshed.g2.bx.psu.edu'>![Galaxy Main Tool Shed](/images/logos/ToolShed.jpg)</a> </div>

The recommended practice has undergone several iterations over the years. Initially, the recommendation was to create one repository for each tool one is creating. However, the creation and widespread adoption of [Planemo](http://planemo.readthedocs.io/en/latest/writing_standalone.html) for tool development obviates a substantial portion of that.

## The benefits of a single tool per repository

* Restricting a repository to include a single tool provides more flexibility to Galaxy administrators to install only those specific tools in which their users have interest. Sometimes installing a suite of tools in order to get only one or two of them is not optimal.

* A feature under development is the ability for a Galaxy administrator to determine a list of repositories that provide tools that imported workflows depend on. When this list is compiled, the administrator will then be able to install the specific tools required by that workflow. For example, assume a user imported a workflow into their local Galaxy instance that was developed by someone else in a different Galaxy instance. The Galaxy administrator's interface will provide a feature that determines which toolshed contains the tools required by the imported workflow that are not available in the Galaxy instance. Restricting repository contents to single tools would enable installation of only those missing tools required by the workflow.

* Tool shed repositories that include tools have certain mercurial change set revisions that are installable into a local Galaxy instance. These revisions are defined by the versions of the tools included in the repository. Repositories that are restricted to contain a single tool will ensure that a new revision installation will be required only when that tool version changes. Repositories that include multiple tools require a new installation revision when the version of any one of the tools changes, possibly resulting in multiple versions of the same tool installed into a single Galaxy instance. Of course, Galaxy will load only a single instance of a tool version into the tool panel, but the tool and related files will still be installed on disk multiple times.

* If tools are not intended to provide meaningful analyses on their own, but are designed to function with other tools, restricting a repository to a single tool will require a Galaxy administrator to install multiple repositories in order to provide all necessary tools to their users. However, the tool shed provides a feature that we call **simple repository dependencies** that streamline this process. Repositories in the tool shed can contain a file named **repository\_dependencies.xml** that define dependency relationships between repositories. For example, the current **emboss\_datatypes** repository in the main Galaxy tool shed is defined as a required repository for the current **emboss\_5** repository in the same tool shed via the inclusion of the file named **repository\_dependencies.xml** in the **emboss\_5** repository. So when the **emboss\_5** repository is installed into Galaxy, the **emboss\_datatypes** repository will be automatically installed along with it if the Galaxy administrator elects to do so.

* In some cases multiple tools are not intended to provide meaningful analyses on their own, but are designed to function with other tools in the suite. In these cases, it makes sense for all tools to be installed into a Galaxy instance, and thus, the tools may all be included in a single repository. In these cases, the tool shed provides the ability to define a suite of repositories that will be installed by installing the single repository that contains only one file named **repository\_dependencies.xml** which defines multiple separate repositories that should be installed. Each of these repositories could contain a single tool, allowing a Galaxy administrator to install each tool separately. If the administrator chooses to install the "tool suite" repository, each separate repository would be automatically installed, providing the entire suite of tools with the single installation. This feature eliminates the benefits of including a suite of tools in a single repository.

# Related pages

* [Tool shed features for Galaxy tools](/src/toolshed/tool-features/index.md) - the primary intent of the tool shed is for sharing Galaxy tools, workflows and other useful Galaxy utilities. Galaxy tools are generally developed within a local Galaxy environment, proven to be functionally correct within that environment, and then uploaded to a tool shed for sharing. With a couple of exceptions, tool features are defined within the Galaxy framework, and have nothing to do with the tool shed. This document describes those exceptions.

* [Including installation information or 3rd-party tool dependency licensing information in your repository](/src/toolshed/readme-files/index.md) - this document provides the details for a simple feature of the tool shed that enables displaying the license information (or possibly other kinds of information) for tools included in a repository.

* [Tool shed features for Galaxy datatypes](/src/toolshed/datatypes-features/index.md) - this document provides information for how to include your proprietary Galaxy datatypes (upon which your Galaxy tools depend) in a repository in the tool shed.

* [Defining repository dependencies](/src/toolshed/defining-repository-dependencies/index.md) - this document provides information about how to define dependencies [for a repository] on any number of additional, separate repositories.

* [Including functional test for your tools](/src/testing-installed-tools/index.md) - this document provides details for including input and output datasets in your repository for functional tests defined in tool config files included in the repository.

* [Enabling workflow sharing](/src/toolshed-workflow-sharing/index.md) - this document describes how the tool shed enables sharing Galaxy workflows.
