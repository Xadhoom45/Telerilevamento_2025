# This code helps exporting graphs to images

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
