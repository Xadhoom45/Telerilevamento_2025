# R code for classifying images

#install.packages("patchwork")

library(terra)
library(imageRy)
library(ggplot2) # lo usiamo per creare dei grafici
library(patchwork)


im.list()

mato1992 = im.import("matogrosso_l5_1992219_lrg.jpg")
mato1992 = flip(mato1992)
plot(mato1992)

mato2006 = im.import("matogrosso_ast_2006209_lrg.jpg")
mato2006 = flip(mato2006)
plot(mato2006)

mato1992c = im.classify(mato1992, num_cluster=2) #im.calssify (nome, cluster-> classificazione che crea delle classi)
# Classe 1 = human ; classe 2 = foresta // ha fatto una unsupervised calssification, noi gli abbiamo detto di creare solo due gruppi 

mato2006c = im.classify(mato2006, num_cluster=2)
# Classe 1 = forest ; classe 2 = human 
# é casuale l'assegnazione delle classi ogni volta che chiamo la funzione, posso usare l'argomento "seed" della funzione per fare in modo che
# la classificazione sia uguale per tutti 

# Come calcolo le percentuali, prima devo calcolare le frequenze
f1992 = freq(mato1992c)
tot1992 = ncell(mato1992c)
prop1992= f1992 / tot1992
perc1992 = prop1992 * 100

# human = 17%, forest = 83%
tot2006 = ncell(mato2006c)
perc2006 = freq(mato2006c) * 100 / tot2006
# human = 54%, forest = 46%

# Creating dataframe
class = c("Forest","Human")
y1992 = c(83,17)
y2006 = c(45,55)
tabout = data.frame(class, y1992, y2006)

p1 = ggplot(tabout, aes(x=class, y=y1992, color=class)) + 
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100))

p2 = ggplot(tabout, aes(x=class, y=y2006, color=class)) + 
  geom_bar(stat="identity", fill="white") + #geom_bar funzione per definire il tipo di grafico (a punti, linee)
  ylim(c(0,100))

# pacchetto patcheark -> può unire dei grafici creati con ggplot
p1 + p2 # mette a confronto i due grafici, i due grafici hanno scale diverse, dobbiamo riscalarle
p1 / p2 # metto due grafici uno sopra all'alto e non uno accanto all'altro
p0 = im.ggplot(mato1992)
p00 = im.ggplot(mato2006)

p0 + p00 + p1 + p2 # plotto i 4 grafici

