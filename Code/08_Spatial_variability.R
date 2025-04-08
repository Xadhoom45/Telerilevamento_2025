# code for calculating spatial viìariability

library(terra)
library(imageRy)
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

# band 1 = NIR
# band 2 = red
# band = green 
# ex plot the image in RGB with the NIR ontop of the red component
