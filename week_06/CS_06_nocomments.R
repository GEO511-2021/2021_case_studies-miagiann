library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)

data(world)  #load 'world' data from spData package

world = filter(world, subregion != "Antarctica")
## transform world to sp format
as(world, "Spatial")

## download and load WorldClim
tmax_monthly <- getData(name = "worldclim", var="tmax", res=10)
plot(tmax_monthly)
## convert to Celsius
gain(tmax_monthly) <- 0.1
plot(tmax_monthly)

## create new object called tmax_annual
tmax_annual = max(tmax_monthly)
names(tmax_annual)<- "tmax"
plot(tmax_annual)

## calculate max temp in each country
max_temp_country = raster::extract(tmax_annual, world, fun=max, na.rm=T, small=T, sp=T)
## transform to sf format
max_temp_country = st_as_sf(max_temp_country)

## communicate your results
ggplot(data = max_temp_country)+
  geom_sf(aes(fill= tmax))+
  scale_fill_viridis_c(name = "Annual\nMaximum\nTemperature (C)")+
  theme(legend.position = "bottom")

## create a summary
library(dplyr)
hottest_country = max_temp_country %>%
  group_by(continent)%>%
  top_n(tmax, n=1)%>%
  select(name_long, continent, tmax)%>%
  arrange(desc(tmax))%>%
  st_set_geometry(NULL)
hottest_country
