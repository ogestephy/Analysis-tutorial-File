# Load required libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Create a data frame with the log2 fold change values
# Format: Gene, Mutant, log2FoldChange
data <- data.frame(
  Gene = rep(c("ARR1", "ARR2", "ARR3"), each = 3),
  Mutant = rep(c("UPF1", "UPF2", "UPF3"), 3),
  log2FoldChange = c(
    # ARR1 values for UPF1, UPF2, UPF3
    0.76, 0.74, 0.72,
    # ARR2 values for UPF1, UPF2, UPF3
    0.05, 0.11, 0.32,
    # ARR3 values for UPF1, UPF2, UPF3
    0.77, 0.78, 0.92
  )
)

# Set custom colors for each mutant
mutant_colors <- c("UPF1" = "#FF6B6B", # Red
                   "UPF2" = "#6BCB77", # Green
                   "UPF3" = "#4D96FF") # Blue

# Create the bar plot
plot <- ggplot(data, aes(x = Gene, y = log2FoldChange, fill = Mutant)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7) +
  
  # Add a horizontal line at y = 0
  geom_hline(yintercept = 0, linetype = "dashed", color = "black", size = 0.3) +
  
  # Customize the plot appearance
  scale_fill_manual(values = mutant_colors) +
  
  # Set axis labels and title
  labs(
    title = "Log2 Fold Change of ARR Genes in NMD Mutants",
    x = "Gene",
    y = "log2(Fold Change)"
  ) +
  
  # Customize the theme
  theme_light() +
  theme(
    panel.grid.major = element_line(color = "#EEEEEE"),
    panel.border = element_blank(),
    axis.line = element_line(color = "black"),
    legend.position = "right",
    legend.title = element_text(face = "bold"),
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title = element_text(face = "bold")
  ) +
  
  # Set y-axis limits
  scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, by = 0.25))

# Display the plot
print(plot)

# Optional: Save the plot as a high-resolution image
# ggsave("ARR_genes_log2fc.png", plot, width = 8, height = 6, dpi = 300)