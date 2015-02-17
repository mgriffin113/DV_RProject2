library("dplyr")

# Display subset of data using dplyr tbl_df function to transform data frame for viewing.

bus_sample_data %>% tbl_df %>% print()