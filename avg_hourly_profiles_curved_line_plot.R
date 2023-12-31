dat1 <- read.csv("C:/Users/ismai/Downloads/Database.csv")
dat1$Time <- ymd_hm(dat1$Time)


dat1 <- dat1 %>%
  mutate(Hour = hour(Time), 
         Day = day(Time),
         Month = month(Time),
         Year = year(Time))
dat1 <- dat1[, 5:ncol(dat2)]


dat1 <- dat1 %>%  
  group_by(Year, Month, Day, Hour) %>%
  summarise(across(DHI:Electric_demand, mean))

dat1 <- dat1 %>%
  mutate(Datetime = paste(Year, Month, Day, Hour, "00", "00", sep = "-")) %>%
  mutate(Datetime = as.POSIXct(Datetime, format = "%Y-%m-%d-%H-%M-%S"))


FROM_GeoJson("data/13_202103_ilceler.geojson")
