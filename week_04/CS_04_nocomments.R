library(tidyverse)
library(nycflights13)
 #open nycflights13
nycflights13::flights
# create farthest airport table, arrange by descending distance
#use slice to keep first row
farthest_airport = flights %>%
  arrange(desc(distance))%>%
  slice(1)%>%
  inner_join(airports, by=c("dest"="faa"))%>%
  select(name)%>%
# convert data frame into single character value
  as.character()

View(farthest_airport)
# using left join instead of inner join
farthest_airport = flights %>%
  select(distance, dest)%>%
  arrange(desc(distance))%>%
  slice(1)%>%
  left_join(airports, by=c("dest"="faa"))%>%
  select(name)%>%
  as.character()

#extra time
airports %>%
  distinct(lon,lat) %>%
  ggplot(aes(lon, lat)) +
  borders("world") +
  geom_point(col="pink") +
  coord_quickmap()
  

