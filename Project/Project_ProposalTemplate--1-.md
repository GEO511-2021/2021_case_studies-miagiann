Project Proposal Template
================
Mia Giannini

# Introduction to problem/question

For my project, I’m hoping to show the correlation between the median
income of the different boroughs of New York City and the number of
trees in each borough. Lower income neighborhoods tend to have less tree
cover than wealthier neighborhoods. The presence of trees in a
neighborhood increases the air quality and shades the surfaces leading
to a community that is less affected by hot temperature and the effects
of climate change. (Depending on how well this displays my results, I
might also plot the income of each borough against the tree species
diversity of each borough in a similarly styled graph.)

# Problem / Question

Is there a relationship between median income and tree cover in NYC
buroughs?

# Inspiring Examples

## Example 1

![](https://s3.amazonaws.com/cdn.freshdesk.com/data/helpdesk/attachments/production/35039286564/original/7LkNQ1nxZun8ZTdM7Pn6sDTIoD3HBfjFyw.png?1553153577)

## Example 2

![](https://community.tibco.com/sites/default/files/barchart_example.png)

Examples 1 and 2 show a graph similar to the one I want to make. I want
to create a bar graph that is colored by the range in which the median
income falls in, and the y axis will be the number of trees present in
each borough.

## Example 3

![](https://img.pagecloud.com/O6D9p2pe-nONzqQeqC04ZntkWQA=/1872x0/filters:no_upscale()/simplexct/images/BlogPic-zcd6b.jpg)

This is an example bar chart from excel, but it has the same idea that I
want for my legend to be ranges of a single variable.

# Proposed data sources

The data I’m using will be the 2015 Street Tree Census from NYC Open
Data
(<https://data.cityofnewyork.us/Environment/2015-Street-Tree-Census-Tree-Data/uvpi-gqnh>)
as well as 2015 median income data for each county of the boroughs of
NYC from the US Census
Bureau(<https://data.census.gov/cedsci/table?g=0400000US36_0500000US36005&d=ACS%205-Year%20Estimates%20Data%20Profiles&tid=ACSDP5Y2015.DP03&hidePreview=true>)
The income data was not available as a single data table so I’ll be
downloading the data from each of the five counties and compiling it
into a dataset of my own.

# Proposed methods

My project will be using mainly dplyr and ggplot 2. I’ll be using dplyr
to filter and arrange the tree census data for each borough and also to
remove any blank or missing data. Dplyr will help me shape the data to
make it easier to work with. I’ll use ggplot to create the overall graph
and to assign the different income ranges to different colors.

# Expected results

I’m expecting a clear bar graph depicting the correlated relationship
between income and tree cover in each borough of NYC (and possibly that
second graph of income and tree species diversity).
