# Code to calculate spectral indices from satellite images

library(imageRy) # beloved package developed at unibo
library(terra)
library(viridis)

im.list()

mato1992 = im.import("matogrosso_l5_1992219_lrg.jpg")
mato1992 = flip(mato1992)
plot(mato1992)

# Bande dell'immagine mato1992
# 1 = NIR
# 2 = red
# 3 = green

im.plotRGB(mato1992, r=1, g=2, b=3)
im.plotRGB(mato1992, r=2, g=1, b=3)
im.plotRGB(mato1992, r=2, g=3, b=1)

# Import the 2006 image of the Mato Grosso area
mato2006 = im.import("matogrosso_ast_2006209_lrg.jpg")
mato2006 = flip(mato2006)
plot(mato2006)

im.multiframe(1, 2)
im.plotRGB(mato1992, r=2, g=3, b=1, title="Mato Grosso 1992")
im.plotRGB(mato2006, r=2, g=3, b=1, title="Mato Grosso 2006")

# Radiometric resolution
plot(mato1992[[1]], col=inferno(100))
plot(mato2006[[1]], col=inferno(100))

# DVI: Difference Vegetation Index  --> DVI = NIR - red

# Tree:           NIR=255, red=0, DVI=NIR-red=255-0=255
# Stressed tree:  NIR=100, red=20, DVI=NIR-red=100-20=80

# calculate dvi for 1992 --> Valore di ogni singola cella da 0 a 255 (8bit), creo una immagine
dvi1992 = mato1992[[1]] - mato1992[[2]] # NIR - red
plot(dvi1992)

# range DVI
# maximum: NIR - red = 255 - 0 = 255
# minimum: NIR - red = 0 - 255 = -255

plot (dvi1992, col=magma(100))

# calculate dvi for 2006

dvi2006 = mato2006[[1]] - mato2006[[2]] # NIR - red
plot(dvi2006, col=magma(100))

# different radiometrci resolution 

# DVI 8 bit: range (0,255)
# maximum: NIR - red = 255 - 0 = 255
# minimum: NIR - red = 0 - 255 = -255

# DVI 4 bit: range (0,15)
# maximum: NIR - red = 15 - 0 = 15
# minimum: NIR - red = 0 - 15 = -15

#NDVI 8 bit: range (0-255)
#maximum: (NIR - red) / ( NIR + red) = (255-0)/(255+0)=1
#minimum: (NIR - red) / ( NIR + red) = (0-255)/(0+255)=-1

#NDVI 4 bit: range (0-15)
#maximum: (NIR - red) / ( NIR + red) = (15-0)/(155+0)=1
#minimum: (NIR - red) / ( NIR + red) = (0-15)/(0+15)=-1 
# NDVI è svingolato dalla risoluzione radiometrica in entrata quinid qaundo ho differenti risoluzioni uso NDVI

ndvi1992 = (mato1992[[1]] - mato1992[[2]]) / (mato1992[[1]] + mato1992[[2]])
# ndvi1992 = dvi1992 / (mato1992[[1]] + mato1992[[2]]
plot(ndvi1992)

ndvi2006 = (mato2006[[1]] - mato2006[[2]]) / (mato2006[[1]] + mato2006[[2]])
plot(ndvi2006)

# function from imageRy
dvi1992auto = im.dvi(mato1992, 1, 2)
dev.off()
plot(dvi1992auto)

dvi2006auto = im.dvi(mato2006, 1, 2)
dev.off()
plot(dvi2006auto)

ndvi1992auto = im.ndvi(mato1992, 1, 2)
dev.off()
plot(ndvi1992auto)

ndvi1992auto = im.ndvi(mato1992, 1, 2)
dev.off
plot(ndvi1992auto)

im.multiframe(1,2)
plot(ndvi1992)
plot(ndvi1992auto)






