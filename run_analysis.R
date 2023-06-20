
library(ggplot2)
library(magick)
library(imager)
library(dplyr)
library(tibble)
library(jpeg)
library(png)
library(ggsci)
library(xkcdcolors)
library(colorspace)
source("Function_Color.R")


image <- readPNG("test.png")

color_palette<- Color_Extraction(image,num_cores=5)
df_cores<-data.frame("color_name"=nearest_named(color_palette)[[1]],
                     "hex_code"=color_palette )

# Calcule a luminância de cada cor
df_cores$luminancia <- sapply(df_cores$hex_code, calc_luminancia)

# Ordene o dataframe pela luminância
df_cores <- df_cores[order(df_cores$luminancia), ]

# Atualize a coluna 'espaco' para refletir a nova ordem das cores
df_cores$espaco <- seq_along(df_cores$color_name)

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
