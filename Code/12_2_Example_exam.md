# Presentation title

## Data gathering

Data were gathering from [Earth Observatory site](https://earthobservatory.nasa.gov/)

Packages used:

```r 
library(terra)
library(imageRy)
library(viridis)
```

Setting the working directory and importing the data:

``` r
setwd("~
plot(dust)
dust = flip(dust)
plot(dust)
```

The image looks like

![dust](https://github.com/user-attachments/assets/54bd6ad2-cb68-4d92-88b9-030883dc7b5e)


## Data analysis

Based on the data gathered, we can calculate the following index:

```r
dustindex = dust[[1]]-dust[[3]]
plot(dustindex)
```

(devo mettere questa immagine)

## Correlation of bands

Since the RGB is composed by visible bands a high correlation i expected

```r
pairs (dust)
```

this is also graphycallly apparent 

(immagine)

## Visualization of the image









