# 09-21-2023
# KMK

# install packages
library("dplyr")
library("tidyr")
install.packages("palmerpenguins")
library("palmerpenguins")

# explore the data
penguins_data <- penguins
class(penguins_data)
head(penguins_data)
str(penguins_data)
unique(penguins_data$species)

mean(penguins$body_mass_g)
#need to ignore NA
mean(penguins$body_mass_g, na.rm = TRUE)
# adding language
years_of_sampling <- paste("Year:", penguins_data$year)

# how to pull columns and rows using #filter and #select 
torgersen_penguins <- filter(penguins_data, island == "Torgersen")
adelie_penguins <- filter(penguins_data, species == "Adelie")

torgersen_penguins_sex_species <- select(torgersen_penguins, sex, species)

torgerson_penguins_one <- filter(penguins_data, island == "Torgersen") %>% 
  select(sex, species)

# modifying the data
torgersen_penguins <- torgersen_penguins %>% 
  mutate(rounded_bill_length = round(bill_length_mm)) %>% 
  select(species, sex, rounded_bill_length)

torgersen_penguins_summary <- torgersen_penguins %>% 
  group_by(species, sex) %>% 
  summarize(mean_bill_length = mean(rounded_bill_length, na.rm = TRUE))

torgersen_penguins_summary

penguin_counts <- penguins_data %>% 
  group_by(species, sex, island) %>% 
  summarize(n = dplyr::n())


            