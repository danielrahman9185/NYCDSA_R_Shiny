#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel('Housing Prices'),
    sidebarLayout(
      sidebarPanel(
        selectInput('Columns', label = 'Choose column to display for scatter plot.', choices = colnames(housing_prices)[-1:-2]),
        checkboxGroupInput('Filter', label = 'Select column values to filter from.', choices = c(1,2,3,4,5,6)),
        selectInput('X_axis', label = 'Choose x-axis for bar plot.', choices = colnames(housing_prices)[-1:-2]),
        selectInput('Box', label = 'Choose x-axis for box plot.', choices = colnames(housing_prices)[-1:-2]),
        textInput('Minimum', label = 'Choose minimum price for the table.'),
        textInput('Maximum', label = 'Choose maximum price for the table.'),
        selectInput('Table_Col', label = 'Choose column to filter by on the table.', choices = colnames(housing_prices)[-1:-2]),
        checkboxGroupInput('Col_Filter', label = 'Select table column filters.', choices = c(1))
      ),
      mainPanel(
        img(src = 'https://thumbs.dreamstime.com/b/row-houses-clip-art-house-2268988.jpg', width = '50%'),
        img(src = 'https://thumbs.dreamstime.com/b/dollar-signs-money-clip-art-2184272.jpg', width = '25%'),
        plotOutput('scatterPlot'),
        plotOutput('BarPlot'),
        plotOutput('BoxPlot'),
        tableOutput('FilteredTable')
      )
    )

  )
)