


library(magrittr)
library(tibble)
library(dplyr)
library(jpeg)
library(magrittr)
library(tibble)
library(dplyr)
library(ggplot2)

library(jpeg)
library(png)


# Função
Color_Extraction <- function(img, num_cores){
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


# Escolher tipo de imagem: png ou jpg

img <- readJPEG("COMPLEMENTO/20210911_143639.jpg")
img <- readPNG("test.png")


plot(as.raster(img))
paleta <- Color_Extraction(img, 10)
paleta
df_cores<-data.frame("nomes_cores"=paleta,"cores_hex"=paleta )

# Função para calcular a luminância de uma cor RGB
calc_luminancia <- function(cor_hex) {
  cor_rgb <- col2rgb(cor_hex)
  luminancia <- 0.2126 * cor_rgb[1,] + 0.7152 * cor_rgb[2,] + 0.0722 * cor_rgb[3,]
  return(luminancia)
}

# Calcule a luminância de cada cor
df_cores$luminancia <- sapply(df_cores$cores_hex, calc_luminancia)

# Ordene o dataframe pela luminância
df_cores <- df_cores[order(df_cores$luminancia), ]

# Atualize a coluna 'espaco' para refletir a nova ordem das cores
df_cores$espaco <- seq_along(df_cores$nomes_cores)

# Calcule as cores de texto complementares novamente
df_cores$cor_texto <- sapply(df_cores$cores_hex, complementar_cor)

# Faça o gráfico
ggplot(df_cores, aes(x = espaco, y = 1, fill = cores_hex)) +
  geom_tile(color = "black", size = 0.5, width = 1) +
  scale_fill_identity() +
  geom_text(aes(label = nomes_cores, color = cor_texto), size = 4) +
  scale_color_identity() +
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  labs(title = "Paleta de Cores") +
  coord_flip()


