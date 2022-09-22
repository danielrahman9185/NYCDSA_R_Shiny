Overview:


* This repository focuses on an interactive R Shiny app that is used to help users find what house they are looking for based on the price and other characteristics like bedrooms and air conditioning. There is an interactive scatter plot, which compares the area of the house to the price of the house, which also includes an interactive legend for a selectable column to use to see where they fit in all of this. I also included an interactive bar plot and an interactive box plot where the x-axis can be selected for both through drop down menus. The bar plot measures the frequency for each category in a column while the box plot measures the price for each category in a column while including statistical information like the average price. One last thing that I included in this app was an interactive table which works by having the user input the minimum and maximum price range to search for houses within that range. The user then chooses the column to filter by and then can select different entries from that column through the checkbox group input. What the visualizations are supposed to do is to make it easier for the user to find out what they are looking for in a house and how expensive houses with their preference would be and the table is used to find out all the information with their preferences.
* Findings:
   * Discovered that as the area of houses increases, so does the price.
   * Discovered that if a house has more to offer, then it is more likely to be higher priced with the exception of 6 bedroom houses and 3 parking spaces which I believe is the case because of there being a small amount of them, meaning that most of them may have less to offer.


Files:


* Housing.csv: A CSV file that contains all the information about the available houses with the price and other characteristics.
* global.R: This file takes care of some data manipulation tasks with those tasks being loading Housing.csv as well as changing the categorical data types to factor and ordinal types. This script is run at the beginning of the app.
* server.R: This script runs all of the interactivity based on the inputs generated from ui.R and changes the output charts and table as well as changes what category filters on the checkbox are generated based on the inputs from certain drop down menus.
* ui.R: This script displays the images and outputs generated in server.R to the user as well as displays different types of inputs that the user can use to change what is displayed based on their preferences.


Data Dictionary:


* price: type int, the price of the available house.
* area: type int, the area (size) of the available house.
* bedrooms: type int, the number of bedrooms that are in the house.
* bathrooms: type int, the number of bathrooms inside the house.
* stories: type int, the number of stories (floors) that the house contains.
* mainroad: type chr, determines whether or not the house is part of the main road.
* guestroom: type chr, does the house have a guest room or not?
* basement: type chr, does the house have a basement or not?
* hotwaterheating: type chr, does the house have hot water heating?
* airconditioning: type chr, is there air conditioning in the house?
* parking: type int, the number of parking spaces in the house.
* prefarea: type chr, is the house in a preferred area?
* furnishingstatus: type chr, what amount of furnishing does the house have?


Required R Libraries:


* shiny
* dplyr
* ggplot2


Note: To install R libraries, open up RStudio and enter this command in the console:
* install.packages(‘libraryName’)


Substitute libraryName with the name of the R library you want to install.


The actual app can be accessed from the below link:
https://danielrahman9185.shinyapps.io/Housing_Prices_App/?_ga=2.47347299.57557838.1663796827-1444279106.1659971170