library(tidyverse)
library(gridExtra)
library(grid)

# read csv and change col names
df <- read_csv('data/msds-orientation-survey.csv')
names(df) <- c('Timestamp','uva_id','github_user','os','cpu_cycle','cpu_cores','ram','hard_drive','gpu','gpu_cores')

# change timestamp to datetime field
df$Timestamp <- as.Date(df$Timestamp, format = '%m/%d/%y %H:%M')

# filter to 2025 cohort
df <- df %>%
  filter(Timestamp >= '2024-06-13')

# write to data folder
write.csv(df, 'data/msds-orientation-survey-manipulated.csv')

# ram
ram_plot <- ggplot(df, aes(x = ram)) +
  geom_histogram(bins = 15, color = 'black', fill = 'grey') +
  labs(x = 'RAM (in GB)', y = 'Count', title = 'RAM (in GB)') +
  theme_minimal()

# cpu cores
cpu_core_plot <- ggplot(df, aes(x = cpu_cores)) +
  geom_histogram(bins = 15, color = 'black', fill = 'grey') +
  labs(x = 'CPU Cores', y = 'Count', title = 'CPU Cores') +
  theme_minimal()

# hard drive
hard_drive_plot <- ggplot(df, aes(x = hard_drive)) +
  geom_histogram(bins = 15, color = 'black', fill = 'grey') +
  labs(x = 'Hard Drive Size (in GB)', y = 'Count', title = 'Hard Drive Size (in GB)') +
  theme_minimal()

# cpu_cycle_rate
cpu_cycle_plot <- ggplot(df, aes(x = cpu_cycle)) +
  geom_histogram(bins = 15, color = 'black', fill = 'grey') +
  labs(x = 'CPU Cycle Rate (in GHz)', y = 'Count', title = 'CPU Cycle Rate (in GHz)') +
  theme_minimal()

# gpu cuda cores
gpu_cores_plot <- ggplot(df, aes(x = gpu_cores)) +
  geom_histogram(bins = 15, color = 'black', fill = 'grey') +
  labs(x = 'GPU Cuda Cores', y = 'Count', title = 'GPU Cuda Cores') +
  theme_minimal()

plot_final <- grid.arrange(ram_plot, 
                           cpu_core_plot, 
                           cpu_cycle_plot,
                           hard_drive_plot,
                           gpu_cores_plot,
                           ncol=2, 
                           top = textGrob('2025 MSDS Hardware Specs')
)
