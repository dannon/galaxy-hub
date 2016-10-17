---
title: Galaxy wrappers for NCBI BLAST, +,  BoF
---
PLACEHOLDER_INCLUDE(/Events/GCC2013/Header)



PLACEHOLDER_INCLUDE(/Events/GCC2013/LinkBox)
PLACEHOLDER_INCLUDE(/Events/GCC2013/BoF/LinkBox)

<div class='left'><a href='/Events/GCC2013/BoF'><img src='/Images/Logos/GCC2013BoFLogo.png' alt='' width="160" /></a></div>

This **BoF** [Birds of a Feather](/Events/GCC2013/BoF) meetup is being held at [GCC2013](../../../../Events/GCC2013).

Peter Cock wrote the original NCBI BLAST+ wrappers which are now in the Galaxy Tool Shed at http://toolshed.g2.bx.psu.edu/view/devteam/ncbi_blast_plus and http://toolshed.g2.bx.psu.edu/view/devteam/blast_datatypes but several additional people have already been contributing further additions. This purpose of this meeting is for this group to meet up in person to talk about planning, future development (should we use a dedicated repository on http://www.GitHub.com or http://www.BitBucket.org for example?), and so on.

## When and Where

The [time and location](/Events/GCC2013/BoF#bof-schedule) for this BoF will be lunch time on "Day 1" (Monday 1 July) in the Cantina.

## Who is Participating

If you are interested, please add your name below and/or send an email to [p.j.a.cock AT googlemail DOT com](Peter Cock).

* Peter Cock
* Jim Johnson
* John Chilton
* Nicola Soranzo
* Bjoern Gruening


## Questions?

Send them to  [p.j.a.cock AT googlemail DOT com](Peter Cock).


## Results

The developers present were all happy with git and hg as choices, but agreed that Peter will setup a dedicated repository on github (a move to hg/bitbucket in the future is possible if this becomes desirable with future Tool Shed developments). From here it will be easier for him to handle pull requests for future additions.

See https://github.com/peterjc/galaxy_blast/

Updating the BLAST+ version being wrapped is desirable, Peter is hoping 2.2.29+ comes out in the next month or so which would be ideal timing (barring any regressions). This will enable us to include the hit descriptions in the tabular output.

Regarding the -remote option to run searches on the NCBI servers, we discussed the negative implications for reproducibility. Given many of the BLAST options availability changes if this option is used, a second set of wrappers using the Remote calls might be preferable. We can minimise code duplication using the new macro support.

On obstacle to full test coverage is using local BLAST databases, which may require implementing upload support for these datatypes. Some of the compound datatypes used in R-Genetics may be useful guides.
