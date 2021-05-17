
rm(list=ls(all=TRUE)) #Borra la memoria
#Llama las librerias
#install.packages('knitr', dependencies = TRUE)
library(zoo)
library(quantmod)
library(xts)
library(tseries)
library(forecast)
library(timeSeries)
library(tframePlus)
library(ggplot2)
library(dplyr)
library(plotly)
library(hrbrthemes)
library(ggthemes)
library(tidyverse)
library(dygraphs)
library(gridExtra)
library(GGally)
library(MASS)
library(timeDate)
library(astsa)
library(rugarch)
library(aTSA)
library(FinTS)

###SELECCIONAR LOS DATOS BAJÁNDOLOS DE INTERNET###

A<-TickerList<- c("A","AA","AAC","AAIC","AAIC^B","AAIC^C","AAN","AAP","AAT","AB","ABB","ABBV","ABC","ABEV","ABG","ABM","ABR")
View(A)

s<-data.frame(A)
LosPreciosQueQuiero<- NULL
for (Ticker in TickerList)
  LosPreciosQueQuiero <- cbind(LosPreciosQueQuiero,
                               getSymbols(Ticker, from="2013-01-01", to="2021-01-15", auto.assign =F ,src='yahoo') [,4]) #Mantiene solo el precio de cierre

View(LosPreciosQueQuiero)



TickerList<- c("AAC"),"AAIC","AAIC^B","AAIC^C","AAN","AAP","AAT","AB","ABB","ABBV","ABC","ABEV","ABG","ABM","ABR")   # hat = gorrito, LOS INDICE SIEMPRE LLEVAN HAT
LosPreciosQueQuiero<- NULL
for (Ticker in TickerList)
  LosPreciosQueQuiero <- cbind(LosPreciosQueQuiero,
                               getSymbols(Ticker, from="2013-01-01", to="2021-01-15", auto.assign =F ,src='yahoo') [,4]) #Mantiene solo el precio de cierre

View(LosPreciosQueQuiero)

 

# Quita todos los NA (en caso de que no haya cotizado el activo)

PreciosCierre <- LosPreciosQueQuiero[apply(LosPreciosQueQuiero ,1,function(x) all(!is.na(x))),]
View(PreciosCierre)
