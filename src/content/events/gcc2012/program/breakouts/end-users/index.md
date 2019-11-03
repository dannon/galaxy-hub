---
title: Galaxy End Users
---
{{> Events/GCC2012/PageHeader }}



**A [GCC22012](/src/events/gcc2012/index.md) [Breakout Session](/src/events/gcc2012/program/breakouts/index.md)**

{{> Events/GCC2012/LinkBox }}
# Participants

* Jane Dorweiler
* Mo Heydarian
* Karen Reddy

 * 
* [Anton](/src/people/anton/index.md), [Dan](/src/people/dan/index.md), Rémi, and [Jen](/src/people/jennifer-jackson/index.md) from [Galaxy Team](/src/galaxy-team/index.md)

# Notes

These are a merged grouping of [Anton's](/src/people/anton/index.md), [Dan's](/src/people/dan/index.md), and [Jen's](/src/people/jennifer-jackson/index.md) notes from the breakout.  Please feel free to update, comment, correct or add in anything we didn't have a chance to address during our session.


## Platforms

* Galaxy [Main](/src/main/index.md) and [CloudMan](/src/cloudman/index.md)
* This group tends to not use Local instances

## How Galaxy currently facilitates research

* Galaxy [Main](/src/main/index.md)
  * to identify 'vetted' tools
  * to experiment with workflows before committing resources to Cloud instances
* [CloudMan](/src/cloudman/index.md)
  * to quickly access an instance with tools/reference data set-up and ready to go
  * for storage (S3)
* General Comments
  * The 'Big Plus' for end users: Amazon allows Galaxy to be used in highly controlled IT environments. 
  * "Galaxy better than commercial software" (the [Galaxy Team](/src/galaxy-team/index.md) says "thank-you"!!)
  * Trackster/Sweepster amazed everyone (shout-out to Jeremy!)
  * New end user community to be aware of: Mass spec

## What would be most helpful going forward

### Better methods to identify 'Vetted' and 'Best Practice' tools

* Applies to tools on [Main](/src/main/index.md), but in particular tools from [Tool Shed](/src/toolshed/index.md)
* Community currently relies on [Main](/src/main/index.md) for this type of information
* Extends to Libraries & other source Data, Workflows, Visualizations
* Ideas (some overlap):
  * Best practices as a way to adopt to correct tools
  * A need to explain what is needed for particular analysis goals
  * Tag tools/workflows based on publications, citations, peer-reviewed status
  * **DOI** would be the *ideal* tag
  * Methods to evaluate tools in the [Tool Shed](/src/toolshed/index.md)
  * [Tool Shed](/src/toolshed/index.md): Download counts/trends e.g. downloads this week week
  * [Tool Shed](/src/toolshed/index.md): Flag bad objects, like craigslist, to alert admin moderator

### Data integration between Main and CloudMan

* S3 bucket attachment
* Ease transfer of libraries/datasets/histories/workflows/pages/etc (primary objects) between [Main](/src/main/index.md) &harr; [CloudMan](/src/cloudman/index.md)

### Tool integration between Tool Shed and CloudMan

* Ease installation of tools on cloud instances

**ACTION:** For all above - Discuss/Prioritize

## Requests

* Add a free text "Header tool" that doesn't proliferate/duplicate datasets, or at least keeps to min. Alt actions on form: add line, remove/replace lines. E.g. UCSC custom tracks: track line for bedgraph file, browser line. May be two changes. **ACTION:** Needs clarification then bitbucket (Dan/Jen)
* Tools to do file conversions to/from GenomeSpace or was this a "Get Data' tool request? **ACTION:** Team discuss then bitbucket (Jen)

## Issues

* Genome access was hurdle to Local install - Dan mentioned rsync server & auto genome tool. **ACTION:** Communicate/wiki (Jen/Dan)
* [CloudMan](/src/cloudman/index.md) auto-scaling is not working well for long running jobs - e.g. Tophat. **ACTION:** Team discuss then bitbucket. (Jen)

## Support

* Mailing list &rarr; Forum
  * Galaxy-dev 1st. **ACTION:** Switch now (Dannon/Jen). Maybe add Google Searches (Dave).
  * Galaxy-user 2nd. **ACTION:** Dual Forum/List ~ 1 year, then transition to forum only. (Dannon/Jen/Dave).
  * Others no change.
* Trackster .... any data - rna, small genome region, etc. can be used as 'ref genome' with or without sequence. **ACTION:** Tutorial. (Jeremy/Jen)
* Multiple versions of tools in UI. **ACTION:** Tutorial. (Jen)
* Of interest: CloudMan Costs ~ $900 for 1 flow cell Hi-Seq analysis run. **ACTION:** Useful info to capture in wiki where users could share usage data? (Dave)

# Plan of Action

* See **ACTION** items inline above
* Others to be added

 * 

# Solutions

* Soon!

More to come ...
