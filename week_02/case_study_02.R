library(tidyverse)

dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.txt"
temp=read_table(dataurl, skip=3,
                na = '999.90',
                col_names = c("YEAR", "Jan", "Feb", "Mar",
                              "Apr", "May", "Jun", "Jul",
                              "Aug", "Sep",  "Oct", "Nov",
                              "Dec", "DJF", "MAM", "JJA",
                              "SON", "metANN"))
plot1 = ggplot(data = temp, aes(x = YEAR, y = JJA))+
  geom_line()+
  geom_smooth(fill="pink", col="blue")+
  ggtitle("Mean Summer Temperatures in Buffalo, NY")+
  labs(x = 'Year', y = 'Temp (C)')
plot1
ggsave("meansummertemp.png")
