# 18/03/2025

library(imageRy)
library(terra)
library(viridis)
im.list()

EN_01 = im.import("EN_01.png")  # dati NO2 prodotti da automobili, gennaio 2020
EN_01 = flip(EN_01)
plot(EN_01)

EN_13 = im.import("EN_13.png")
EN_13 = flip(EN_13)
plot(EN_13)

im.multiframe(1,2)
plot(EN_01)
plot(EN_13)

EN_dif = EN_01[[1]] - EN_13[[1]] # differenza immagine tra marzo e gennaio
plot(EN_dif)

plot(EN_dif)
plot(EN_dif, col=inferno(100))

# importo dati ghiacci in groenlandia, dati tif rappresentano le temperature
gr = im.import("greenland")

im.multiframe(1,2)
plot(gr[[1]], col=rocket(100))
plot(gr[[4]], col=rocket(100))

grdif = gr[[1]] - gr[[4]]
dev.off() 
plot(grdif)

# Exporting data
setwd("C:/Users/Utente/OneDrive/Desktop/Magistrale Geologia/Telerilevamento Geoecologico/file_export")
getwd() # controllo che la working directory sia giusta

plot(gr)

png("greenland_output.png")
plot(gr)
dev.off()

pdf("greenland_output.pdf")
plot(gr)
dev.off()

pdf("difgreen.pdf")
plot(grdif)
dev.off()

jpeg("difgreen.jpeg")
plot(grdif)
dev.off()
