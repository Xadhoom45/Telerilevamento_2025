# code for calculating spatial viìariability
# guarda file in duccio rocchini, repository telerilevamento_2025, papers, mee_2021 -> spiegazione finestra pixel calcolo dvs su immagini 

library(terra)
library(imageRy)
library(viridis)
library(patchwork)

install.packages("RStoolbox")
library(RStoolbox)
# dobbiamo introdurre la deviazione standard

# esempio con età
23,22,23,49

m=(23+22+23+49)/4
# m = 29.25

num = ((23-29.25)^2)*2 + (22-29.25)^ 2+ (49-29.25)^2 # scarto quadratico, o chiamo num pk sarà il numeratore della formula finale
# num = 520.75

den = 4
variance = num/den 
# variance = 130.1825
stdev = sqrt(variance)
#stdev =11.41

sd(c(23,22,23))
sd(c(23,22,23,49))

#---

im.list()

sent=im.import("sentinel.png")
sent=flip(sent)

# band 1 = NIR
# band 2 = red
# band = green 

# ex plot the image in RGB with the NIR ontop of the red component
im.plotRGB(sent, r=1, g=2, b=3)

# EX: make three plots with NIR ontop of each component: r,g,b

im.multiframe(1,3)
im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=2, g=1, b=3)
im.plotRGB(sent, r=3, g=2, b=1)

#associamo la prima banda ad un oggetto che chiamiamo NIR

nir = sent[[1]]

dev.off()
plot(nir)

# ex plot the NIR band with the inferno ramp palette, se non ho il pacchetto viridis mi da errore

plot(nir, col="inferno"(100))
sd3 = focal(nir, w=c(3,3), fun=sd)      # utilizzo la funzione focal; ?focal su R per avere la descrizione della funzione
  # w=3 finestra mobile di 3 pixel per calcolare la funzione

im.multiframe(1,2)
im.plotRGB(sent, r=1, g=2, b=3)
plot(sd3)
  # calculate sdv of the nir band with a moving window of 5x5 pixels
sd5 = focal(nir, w=c(5,5), fun=sd)
plot(sd5)

  # EX: USE ggplot to plot the sdv
im.ggplot(sd5)

  #plot the two sd maps(3 e 5) one beside the other with ggplot
p1 = im.ggplot(sd3)
p2 = im.ggplot(sd5)
p1 + p2 # questo è possibile grazie alla libreria patchwork

  #EX: with ggplot, plot the original set in RGB (ggRGB) together with sd with 3 and 5 pixels; uso pacchetto RToolbox per ggRGB
p3 = ggRGB(sent, r=1, g=2, b=3)
p1 + p2 + p3
p3 + p1 + p2




