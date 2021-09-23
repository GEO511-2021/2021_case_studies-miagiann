## load packages
library(ggplot2) 
library(gapminder)
library(dplyr)
str(gapminder)
## create new gapminder without Kuwait data
new_gapminder = filter(gapminder, country!= 'Kuwait')
str(new_gapminder)

## Plot 1 (the first row of plots)
ggplot(data = new_gapminder, aes( x = lifeExp, y = gdpPercap, color = continent, size = pop/100000))+
  geom_point()+
  scale_y_continuous(trans = "sqrt")+
  facet_wrap(~year,nrow=1)+
  labs(title = "Life Expectancy Over Time", x = "Life Expectancy", y = "GDP per Capita", color = 'Continent', size = "Population (100k)")
## save plot
ggsave('plot3_1.png', width = 15)
## prepare data for second plot


gapminder_continent = gapminder %>%
  group_by(continent,year) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),pop = sum(as.numeric(pop)))

## Plot 2
ggplot(data= new_gapminder, aes(x = year, y = gdpPercap, color = continent, size = pop/100000))+
  geom_line(aes(group = country, size = 0.1))+
  geom_point()+
  geom_line(data = gapminder_continent, aes(x = year, y = gdpPercapweighted), color = "black", size = 0.5)+
  geom_point(data = gapminder_continent, aes(x = year, y = gdpPercapweighted), color = "black")+
  facet_wrap(~continent,nrow=1)+
  theme_bw()+
  labs( x = 'Year', y = "GDP per Capita", size = "Population (100k)")
  
## save plot
ggsave('plot3_2.png', width = 15)
