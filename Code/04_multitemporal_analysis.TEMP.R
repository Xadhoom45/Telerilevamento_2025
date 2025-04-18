# time series analysis in R

library(terra)
library(imageRy)
library(ggridges) # for ridgeline plots
library(ggplot2) # for ridgeline plots
library(viridis) # for ridgeline plots

im.list()

# Importing data
EN01 <- im.import("EN_01.png")
EN13 <- im.import("EN_13.png")

difEN = EN01[[1]] - EN13[[1]]

# Example 2: ice melt in Greenland

gr <- im.import("greenland")
plot(gr[[1]])
plot(gr[[4]])

# Exercise: plot in a multiframe the first and last elements of gr
par(mfrow=c(1,2))
plot(gr[[1]])
plot(gr[[4]])

difgr = gr[[1]] - gr[[4]]
dev.off()
plot(difgr)


# Ridgeline plots
im.ridgeline(gr, scale=1)
im.ridgeline(gr, scale=2)
im.ridgeline(gr, scale=2, palette="inferno")

# NDVI phehnology
ndvi <- im.import("Sentinel2_NDVI_2020")
im.plotRGB(ndvi, 1, 2, 3)

im.ridgeline(ndvi, scale=2)

names(ndvi) <- c("02_Feb", "05_May", "08_Aug", "11_Nov")
im.ridgeline(ndvi, scale=1)
im.ridgeline(ndvi, scale=2)
im.ridgeline(ndvi, scale=2, palette="magma")

# Exercise: compose a RGB image with the years of Greenland temperature
im.plotRGB(gr, r=1, g=2, b=4)
# gr: 2000, 2005, 2010, 2015

# Ridgeline plots
# Example with NDVI data

# NDVI file
ndvi <- im.import("NDVI_2020")

plot(ndvi)

plot(ndvi[[2]],ndvi[[3]])
abline(0,1,col="red")
