# This code helps exporting graphs to images

# Exporting data
setwd("C:/Users/Utente/OneDrive/Desktop/Magistrale Geologia/Telerilevamento Geoecologico/file_export") # seleziono la working directory in cui voglio salvae il mio file
getwd() # controllo che la working directory sia giusta

png("greenland_output.png") # selezioni il formato in cui voglio esportarla e gli do il nome, questo è il comando che mi permette di esportare l'immagine
plot(gr) # poi plotto l'immagine che sono interessato a esportare
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
