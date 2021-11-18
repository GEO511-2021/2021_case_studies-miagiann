library(spData)
library(sf)
library(tidyverse)
library(units)
#this one is optional, but can help with unit conversions.

#load 'world' data from spData package
data(world)  
# load 'states' boundaries from spData package
data(us_states)
# plot(world[1])  #plot if desired
# plot(us_states[1]) #plot if desired

albers="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"
# transform world dataset
world = st_transform(world, albers)
# filter and buffer Canada
Canada = world%>%
  filter(name_long == 'Canada')

Canada_buffer = st_buffer(st_geometry(Canada), dist = 10000)

# transform us_states
us_states = st_transform(us_states, albers)
# filter to include only new york
newyork = us_states%>%
  filter(NAME == 'New York')

# create a border object
ny_canada = st_intersection(newyork, Canada_buffer)

# plot the border area
ggplot(ny_canada)+
  geom_sf(data = newyork)+
  geom_sf(data = ny_canada,fill = 'red')+
  ggtitle('New York Land within 10km')
 

# calculate area and change units to km^2
area_nycanada = st_area(ny_canada)%>%
  set_units(km^2)
area_nycanada
