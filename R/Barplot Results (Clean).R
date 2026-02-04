# Load libraries ----
library(ggplot2)
library(forcats)  # to reorder categorical variables

# Set theme for the plot
theme_set(theme_minimal(base_size = 16))

# Read in the data 
# NOTE: replace 'path/to/file' with actual file path
NP_forest_gain <- read.csv("/path/to/file/NP_forest_gain.csv")
NP_forest_loss <- read.csv("/path/to/file/NP_forest_loss.csv")

# Create identifier column for gain vs loss
NP_forest_gain$type <- "Gain"
NP_forest_loss$type <- "Loss"

# Bind the objects together
forest_change <- rbind(NP_forest_gain, NP_forest_loss)

(forest_barplot <- ggplot(forest_change, aes(x = NAME, y = sum/GIS_AREA, 
                                             fill = fct_rev(type))) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(x = NULL, y = "Forest change (% of park area)\n") +
    # Expanding the scale removes the emtpy space below the bars
    scale_y_continuous(expand = c(0, 0)) +
    theme(text = element_text(size = 16),  # makes font size larger
          legend.position = c(0.1, 0.85),  # changes the placement of the legend
          legend.title = element_blank(),  # gets rid of the legend title
          legend.background = element_rect(color = "black", 
                                           fill = "transparent",   # removes the white background behind the legend
                                           linetype = "blank")))

# Save the plot
# NOTE: replace 'path/to/file' with actual file path
ggsave(forest_barplot, filename = "/path/to/file/forest_barplot.png",
       height = 5, width = 10)