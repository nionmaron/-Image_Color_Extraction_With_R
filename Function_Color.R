# Extracts the main colors from an image using the k-means algorithm
# 
# Args:
#   img: An image in a suitable format for conversion into a numerical matrix
#   num_cores: The number of main colors to be extracted from the image
#   maxColorValue: The maximum value of the image's RGB color scale
#
# Returns:
#   A vector of hexadecimal color codes representing the main colors of the image

Color_Extraction <- function(img, num_cores = 5, maxColorValue = 255) {
  
  # Check if img can be converted into a numerical matrix
  if (!is.array(img)) {
    stop("The image should be an array that can be converted into a numerical matrix.")
  }
  
  # Check if num_cores is a positive integer
  if (!is.numeric(num_cores) || num_cores <= 0 || round(num_cores) != num_cores) {
    stop("num_cores must be a positive integer.")
  }
  
  # Check if maxColorValue is a positive integer
  if (!is.numeric(maxColorValue) || maxColorValue <= 0 || round(maxColorValue) != maxColorValue) {
    stop("maxColorValue must be a positive integer.")
  }
  
  # Transform the image into a numerical matrix
  img_matrix <- apply(img, 3, as.numeric)
  
  # Train the k-means algorithm
  km <- kmeans(img_matrix, centers = num_cores)
  
  # Create a data frame grouping the pixels by the k-means clusters
  img_df <- tibble(
    r = img_matrix[,1], 
    g = img_matrix[,2], 
    b = img_matrix[,3],
    cluster = km$cluster
  )
  
  # Calculate the centroids of the groups
  centroids <- img_df %>%
    group_by(cluster) %>%
    summarise_all(mean)
  
  # Transform the color of the centroids into hexadecimal format
  centroids <- centroids %>%
    mutate(color = rgb(r, g, b))
  
  # Return a vector of colors in alphabetical order
  sort(centroids$color)
}

################################################################################

# Função para calcular a luminância de uma cor RGB
calc_luminancia <- function(cor_hex) {
  cor_rgb <- col2rgb(cor_hex)
  luminancia <- round(0.2126 * cor_rgb[1,] + 0.7152 * cor_rgb[2,] + 0.0722 * cor_rgb[3,],2)
  return(luminancia)
}


################################################################################

interpret_color_psychologically <- function(color_hex) {
  # Define a basic color psychology dictionary
  color_dict <- list(
    "#FF0000" = "Red often symbolizes excitement, energy, passion, and love.",
    "#FFFF00" = "Yellow is associated with happiness, optimism, and creativity.",
    "#008000" = "Green can symbolize nature, growth, harmony, and freshness.",
    "#0000FF" = "Blue is often associated with stability, trust, wisdom, and confidence.",
    "#800080" = "Purple can represent luxury, power, and ambition.",
    "#000000" = "Black often symbolizes power, elegance, mystery, or death.",
    "#FFFFFF" = "White can symbolize purity, innocence, and simplicity."
  )
  
  # If color is in dictionary, return its interpretation
  if (color_hex %in% names(color_dict)) {
    return(color_dict[[color_hex]])
  } else {
    return("No interpretation available for this color.")
  }
}


# Define a function to find the closest color to a given color
closest_color <- function(color) {
  
  color_dict <- data.frame(
    name = c("red", "yellow", "green", "blue", "purple", "black", "white"),
    hex = c("#FF0000", "#FFFF00", "#008000", "#0000FF", "#800080", "#000000", "#FFFFFF"),
    stringsAsFactors = FALSE
  )
  
  # Calculate color distances
  color_distances <- colorspace::cie2000_distance(color, color_dict$hex)
  
  # Find the index of the smallest distance
  closest_index <- which.min(color_distances)
  
  # Return the closest color name
  color_dict$name[closest_index]
}



# Define a function to calculate the average color of an image
average_color <- function(image) {
  # Convert image to data frame
  img_df <- as.data.frame(image)
  
  # Calculate average color
  avg_color <- colMeans(img_df)
  
  # Return average color as hexadecimal
  rgb(avg_color[1], avg_color[2], avg_color[3], max = 255)
}

