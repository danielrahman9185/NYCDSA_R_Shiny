housing_prices = read.csv('Housing.csv')

housing_prices$bedrooms = factor(housing_prices$bedrooms, order = TRUE)
housing_prices$bathrooms = factor(housing_prices$bathrooms, order = TRUE)
housing_prices$stories = factor(housing_prices$stories, order = TRUE)
housing_prices$parking = factor(housing_prices$parking, order = TRUE)
housing_prices = as.data.frame(unclass(housing_prices), stringsAsFactors = TRUE)