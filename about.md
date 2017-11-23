---
layout: page
title: About
---

A blog focused on a platform independent software implementation of tasks that tap into key facets of human cognition, which have been demonstrated to be altered using tools from computational psychiatry.

<p align="center">
 <a href="https://de.wikiversity.org/wiki/Wikiversity:Fellow-Programm_Freies_Wissen" target="_blank">
  <img src="{{ site.baseurl }}/public/images/Fellow-Programm-Freies-Wissen-Logo.jpg" width="500">
 </a>
</p>

This blog is part of a project within the [Open Science Fellowship](https://de.wikiversity.org/wiki/Wikiversity:Fellow-Programm_Freies_Wissen). While in the process of creating the code be sure to find regular updates on features that need to be incorporated and the challenges I face by being as open as possible in the development of the software.


## A fragmented picture of mental disorders

Let's pretend you are interested in the neurobiological causes of a mental disorder to derive biomarkers or delineate mechanisms for targeted treatment. What you are most likely to find are marked differences across small studies culminating in low success rates in the replication of key results. Why, you ask? Reasons are manifold:
* small samples of selected non-representative patients 
* lack of routine publication of validated paradigms, analysis scripts, and verified datasets
* paradigms employed to study cognitive or motivational deficits are not standardized across labs or formally validated 

Open science enthusiasts may have already spotted it: Many reasons could be effectively addressed by facilitating the widespread use of open and well-maintained software running on different yet commonly available platforms.

## How to merge the pieces
Now how do I plan to overcome these problems letting open practices work their magic? 
To facilitate the widespread use in future research, the paradigms will be implemented using [Haxe](https://haxe.org/), a programming language intended for building cross-platform tools that can be directly exported to native apps for every major platform including Android and web-based HTML5. Ease of access has been a major limiting factor in collecting sufficient data required to describe individual behavior in detail. Furthermore, large-scale online testing enables tests for the dimensionality of mental disorders, which could be employed to identify individuals at risk or at an early stage of the disorder in the future. 

Accompanying this, a web interface will be implemented which provides an easily accessible summary of the individual results of the user relative to other individuals in the database or, alternatively, a comprehensive summary for researchers, who are using the task. This web interface will be implemented using [R Shiny](https://shiny.rstudio.com/), an open web application framework for [R](https://www.r-project.org/).

## Puzzled?
So, given that this approach also worked its magic on you: Comments, ideas, commits, suggestions for improvement or questions on anything remotely related to what is laid out here are highly welcome!
