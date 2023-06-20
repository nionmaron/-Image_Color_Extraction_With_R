
# <p align="center" style="color:red;">R Color Palette Extraction and Sentiment Analysis Project</p>
<hr style="border-top: 2px solid blue;">


<div style="color: darkblue;">
This repository contains an R project that processes an image and extracts the color palette, provides complementary color suggestions, and performs a sentiment analysis based on the predominant colors. The project also includes a Shiny app that allows the user to upload an image and generate a report in HTML and PDF with the results.
</div> <br>

*Este repositório contém um projeto em R que processa uma imagem e extrai a paleta de cores, fornece sugestões de cores complementares e realiza uma análise de sentimentos baseada nas cores predominantes. O projeto também inclui um aplicativo Shiny que permite ao usuário carregar uma imagem e gerar um relatório em HTML e PDF com os resultados.*



## **Features / Características**

Color palette extraction/ *Extração de paleta de cores: A partir de qualquer imagem fornecida, o código irá processar a imagem e extrair a paleta de cores predominantes*

Complementary color suggestions:/ Sugestões de cores complementares: Com base nas cores extraídas, o código irá sugerir cores complementares que harmonizam bem com as cores da imagem. Based on the extracted colors, the code will suggest complementary colors that harmonize well with the image colors.

Análise de sentimentos de cores / *Color sentiment analysis*: Cada cor pode evocar diferentes sentimentos e emoções. Este código irá classificar as cores predominantes em categorias de sentimentos como "Alegria", "Tranquilidade", "Energia", etc. *Each color can evoke different feelings and emotions. This code will classify the predominant colors into sentiment categories like "Joy", "Tranquility", "Energy", etc.*

Aplicativo Shiny / *Shiny app*: Um aplicativo Shiny interativo está incluído, que permite ao usuário carregar uma imagem e obter os resultados acima. Os resultados podem ser baixados como um relatório em HTML ou PDF. *An interactive Shiny app is included, which allows the user to upload an image and get the above results. The results can be downloaded as a report in HTML or PDF.*

## **How to use / Como usar**

1) Clone este repositório no seu computador local. / *Clone this repository to your local computer.*

2) Instale todas as dependências necessárias (consulte o arquivo install.R para uma lista das bibliotecas necessárias). / *Install all necessary dependencies (see the install.R file for a list of required libraries).*

3) Execute o script R run_analysis.R para processar uma imagem e obter a paleta de cores, sugestões de cores complementares e análise de sentimentos. Você pode modificar o script para analisar sua própria imagem alterando o caminho do arquivo da imagem. / *Run the R script run_analysis.R to process an image and get the color palette, complementary color suggestions, and sentiment analysis. You can modify the script to analyze your own image by changing the image file path.*

4) Inicie o aplicativo Shiny executando runApp() no diretório do aplicativo Shiny para iniciar o servidor. Em seguida, carregue sua imagem e clique em 'Analisar' para obter os resultados. Você pode baixar um relatório dos resultados clicando em 'Baixar Relatório'. / Start the Shiny app by running `run

## **Application / Aplicação**

- **Design de UI/UX:** A ferramenta pode ser extremamente útil para designers de UI/UX. Ao entender a paleta de cores de interfaces existentes ou ao planejar novas, é possível criar designs mais eficazes e agradáveis, que melhorem a experiência do usuário e conduzam à realização de ações desejadas. / *The tool can be incredibly useful for UI/UX designers. By understanding the color palette of existing interfaces or planning new ones, more effective and appealing designs can be created that enhance user experience and drive desired actions.*

- **Análise de Sentimento / sentiment analysis:** A análise de sentimentos das cores pode ser usada para entender como as cores em uma imagem ou design afetam o sentimento do público. Isso pode ser especialmente útil para profissionais de marketing, psicólogos e criadores de conteúdo. / *Color sentiment analysis can be used to understand how the colors in an image or design affect the audience's sentiment. This can be especially useful for marketing professionals, psychologists, and content creators.*

- **Edição de Imagem / Image Editing:** Fotógrafos e editores de imagem podem utilizar a ferramenta para analisar e ajustar a paleta de cores em suas imagens, melhorando o sentimento geral ou a resposta emocional que desejam evocar. / *Photographers and image editors can use the tool to analyze and adjust the color palette in their images, enhancing the overall sentiment or emotional response they want to evoke.*

- **Realidade Aumentada / Augmented Reality:** Na realidade aumentada, a harmonia e a psicologia das cores são fundamentais para criar uma experiência imersiva. Essa ferramenta pode ajudar os criadores a escolherem cores que melhorem a imersão e a interação do usuário. / *In augmented reality, color harmony and psychology are key to creating an immersive experience. This tool can help creators choose colors that enhance user immersion and interaction.*

## **License / Licença**
This project is licensed under the MIT License. See the LICENSE.md file for more details. / *Este projeto é licenciado sob a Licença MIT. Veja o arquivo LICENSE.md para mais detalhes.*

