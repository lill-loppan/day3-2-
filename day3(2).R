require(data.table)

mydata = fread(file = "Airpassengers.txt", data.table=F)


require(tidyr)
mydata2 = pivot_longer(data = mydata, cols= -Year)
names(mydata2)=c("Year","Months", "Passengers")

# mydata2$Months = factor(mydata2$Months, levels = c("Jan", "Feb", ...))
mydata2$Months = factor(mydata2$Months, levels = c(unique(mydata2$Months)))
mydata2

require(ggplot2)
ggplot(data = mydata2,
       aes(x=Months, y=Year,
           fill=Passengers,
           label=Passengers)) +
  geom_tile(color="white", size=1) +
  scale_fill_gradientn(colors = c("red", "yellow", "white")) +
  labs(title = "Number of Passengers per year and month") +
  geom_text() +
#  scale_fill_distiller(palette = rev("Reds"),direction=1)
  scale_fill_distiller(palette = "Reds")


ggplot(data = mydata2,
       aes(x=Months, y=Year,
           color=Passengers,
           fill=Passengers,
           label=Passengers)) +
  scale_fill_gradientn(colors = c("red", "yellow", "white")) +
  labs(title = "Number of Passengers per year and month") +
  geom_text(fontface="bold", size=6) +
  theme_dark() +
  scale_color_gradientn(colors=c("yellow", "white"))
