
palette()

library(RColorBrewer)
display.brewer.all()

a <- c(1:20)
corDegrade <- colorRampPalette(c("white","darkgreen")) # Degrad? de vermelho para amarelo
corDegrade(20)
barplot(a, col=corDegrade(20))
corDegrade(20)

colorRampPalette("#1b5e20")

corDegrade <- colorRampPalette(c("#1b5e20","#1b5e20","#b71c1c","#b71c1c")) # Degrad? de vermelho para amarelo

cat(corDegrade(13),sep = "','")

barplot(a, col=corDegrade(13))
corDegrade(13)



color <- colorRampPalette(c("1b5e20","lightblue"))
color(10)
barplot(a, col=color(10))





library(RColorBrewer)
cores <- brewer.pal(10, "Dark2")
barplot(a, col=cores)

display.brewer.all()

cores <- brewer.pal(10, "Set2")
barplot(a, col=cores)


# paleta de core por imagem
library(jpeg)
library(magrittr)
library(tibble)
library(dplyr)
library(jpeg)
library(magrittr)
library(tibble)
library(dplyr)

criar_paleta <- function(img, num_cores){
  # transforma a imagem em uma matriz
  img_matrix <- apply(img, 3, as.numeric)
  # treina o algoritmo de k m?dias
  km <- kmeans(img_matrix, centers = num_cores)
  img_df <- tibble(
    r = img_matrix[,1], 
    g = img_matrix[,2], 
    b = img_matrix[,3],
    cluster = km$cluster
  )
  # calcula os centroides dos grupos
  centroides <- img_df %>%
    group_by(cluster) %>%
    summarise_all(mean)
  # transforma a cor em hexadecimal
  centroides <- centroides %>%
    mutate(cor = rgb(r, g, b))
  # vetor de cores
  sort(centroides$cor)
}

img <- readJPEG("COMPLEMENTO/20210911_143639.jpg")
plot(as.raster(img))
paleta <- criar_paleta(img, 10)
paleta
exibir(paleta)
barplot(a, col=paleta)


library(jpeg)
library(png)

paste(FILE00,"/",Lista_DB[i],sep = "")
img <- readPNG(paste(FILE00,"/",Lista_DB[i],sep = ""))
class(img)
plot((img))

rasterImage(img, 
            xleft=1, xright=2, 
            ybottom=1.3, ytop=1.7)
