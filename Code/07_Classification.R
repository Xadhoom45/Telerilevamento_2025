# R code for classifying images

library(terra)
library(imageRy)

im.list()

mato1992c = im.import("matogrosso_l5_1992219_lrg.jpg")
mato1992c = flip(mato1992c)
plot(mato1992c)

mato2006c = im.import("matogrosso_ast_2006209_lrg.jpg")
mato2006c = flip(mato2006c)
plot(mato2006c)

im.classify(mato1992c, num_cluster=2) #im.calssify (nome, cluster-> classificazione che crea delle classi)
# Classe 1 = human ; classe 2 = foresta // ha fatto una unsupervised calssification, noi gli abbiamo detto di creare solo due gruppi 

im.classify(mato2006c, num_cluster=2)
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
