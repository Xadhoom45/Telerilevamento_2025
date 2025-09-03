# R code for classifying images

#install.packages("patchwork")

library(terra)
library(imageRy)
library(ggplot2) # lo usiamo per creare dei grafici
library(patchwork)  # permette di combinare diversi oggetti ggplot in un singolo grafico


im.list()

mato1992 = im.import("matogrosso_l5_1992219_lrg.jpg")
mato1992 = flip(mato1992)
plot(mato1992)

mato2006 = im.import("matogrosso_ast_2006209_lrg.jpg")
mato2006 = flip(mato2006)
plot(mato2006)

mato1992c = im.classify(mato1992, num_cluster=2) #im.classify (nome, cluster-> classificazione che crea delle classi)
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

# Creating dataframe ---> come creare una tabella di dati
class = c("Forest","Human")  # nome delle classi
y1992 = c(83,17) # dati anno 1992
y2006 = c(45,55)
tabout = data.frame(class, y1992, y2006) # data.frame --> funzione per creare una tabella di dati

p1 = ggplot(tabout, aes(x=class, y=y1992, fill="class", color=class)) + 
  geom_bar(stat="identity", fill="white") +  # geom.bar stabilisce che deve creare un grafico a barre; stat ="identity" gli sto dicendo che i valori per l'asse y glie li fornisco io
  ylim(c(0,100))                            # dal dataframe 

p2 = ggplot(tabout, aes(x=class, y=y2006, color=class)) + 
  geom_bar(stat="identity", fill="white") + #geom_bar funzione per definire il tipo di grafico (a punti, linee)
  ylim(c(0,100))

# pacchetto patchwork -> può unire dei grafici creati con ggplot
p1 + p2 # mette a confronto i due grafici, i due grafici hanno scale diverse, dobbiamo riscalarle
p1 / p2 # metto due grafici uno sopra all'alto e non uno accanto all'altro
p0 = im.ggplot(mato1992)
p00 = im.ggplot(mato2006)

p0 + p00 + p1 + p2 # plotto i 4 grafici

#----- Solar Orbiter

im.list()

solar = im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# EX classify the image in 3 classes - im.classify()

solarc = im.classify(solar, num_cluster=3)

# EX plot the original images beside teh classified one

im.multiframe(1,2)
plot(solar)
plot(solarc)

# 3 = low
# 1 = medium
# 2 = high

solarcs = subst(solarc, c(3 , 1 , 2), c("c1_low", "c2_medium", "c3_high"))  # classify suddivide in classi in modo casuale, con questa funzione posso assegnare le varie clssi e rioordinarle
plot(solarcs)

# Ex calculate the percentuages fo the sun energy classes with one line of code

percsolar = freq(solarcs) * 100 / ncell(solarcs)  # non funziona perchè moltiplica * 100 anche il parametro del nome, devo dirgli di
  # prendere la colonnina solo del count

percsolar = freq(solarcs)$count * 100 / ncell(solarcs)# così è corretto, moltiplica solo il campo count e non il campo value( dove è riportato il nome

# 37.92693 41.04342 21.02965

# create dataframe
class = c("c1_low","c2_medium","c3_high")
perc = c(38,41,21)
tabsol = data.frame(class, perc)

# final ggplot

p1 = ggplot(tabsol, aes(x=class, y=perc, fill=class, color=class)) + 
  geom_bar(stat="identity")

  



