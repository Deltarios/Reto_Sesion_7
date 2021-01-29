# 3
library(dplyr)
library(DBI)
library(RMySQL)
library(ggplot2)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

# 4
dbListTables(MyDataBase)
dbListFields(MyDataBase, 'CountryLanguage') 
DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage") #Carga la base de datos

data <- DataDB %>% filter(Language == "Spanish")

data %>% ggplot(aes( x = Percentage, y=CountryCode, fill = IsOfficial )) + 
  geom_bin2d()