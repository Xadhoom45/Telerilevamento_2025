# 18/03/2025
install.packages("ggridges") #This is needed to create ridgeline plots
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

# ridgeline plots
im.ridgeline(gr, scale=1)
im.ridgeline(gr, scale=2)
im.ridgeline(gr, scale=2, palette="inferno")

im.list()

# Exercise import the NDVi data from sentinel 

ndvi = im.import("Sentinel2_NDVI")

im.ridgeline(ndvi, scale=2, palette="inferno")  # in questo momento il nome dei file è ndvi per tutti, se faccio ridgeline me ne plotta solo 1, 
# devo cambiare nome ai dataset

# Changing names
# sources    :Sentinel2_NDVI_2020-02-21.tif  
#             Sentinel2_NDVI_2020-05-21.tif  
#             Sentinel2_NDVI_2020-08-01.tif  
#             Sentinel2_NDVI_2020-11-27.tif 



                 
names(ndvi) = c("02_Feb", "05_May", "08_Aug", "11_Nov")

im.ridgeline(ndvi, scale=2)
im.ridgeline(ndvi, scale=2, palette="inferno")

pairs(ndvi)

plot(ndvi[[1]], ndvi[[2]])
# y = x # may y, feb x 
# y = a + bx
# a=0, b=1
# y = a + bx = 0 + 1x = x

abline(0, 1, col="red")

plot(ndvi[[1]], ndvi[[2]], xlim=c(-0.3,0.9), ylim=c(-0.3,0.9))
abline(0, 1, col="red")

im.multiframe(1,3)
plot(ndvi[[1]])
plot(ndvi[[2]])
plot(ndvi[[1]], ndvi[[2]], xlim=c(-0.3,0.9), ylim=c(-0.3,0.9))
abline(0, 1, col="red")


