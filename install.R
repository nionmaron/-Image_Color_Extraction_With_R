
# Lista de pacotes necessários
# List of required packages
pacotes <- c("ggplot2", "shiny", "gridExtra")

# Função para instalar o pacote se ele não estiver instalado
# Function to install the package if it is not installed
instalar_pacote <- function(pacote) {
  if (!require(pacote, character.only = TRUE)) {
    install.packages(pacote, dependencies = TRUE)
  }
}

# Instalar todos os pacotes na lista
# Install all packages in the list
sapply(pacotes, instalar_pacote)
