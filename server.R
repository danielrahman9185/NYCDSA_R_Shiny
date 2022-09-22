#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)

source('global.R', local = TRUE)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  col_filter = reactive({
    for (i in colnames(housing_prices)[-1:-2]) {
      if (input$Columns == i) {
        return(housing_prices)
      }
    }
  })
  
  
  
  observe({
    inpt <<- input$Columns
    
    col_vals = sort(unique(housing_prices[[inpt]]))
    
    updateCheckboxGroupInput(session, 'Filter', label = 'Select column values to filter from.', choices = col_vals)
  })
  
  
  filter_vals = reactive({
    
    if (is.null(input$Columns)) {
      return(NULL)
    }
      
    new_data = housing_prices %>%
      filter(!!sym(inpt) %in% input$Filter)
        
      return(new_data)
      
  })
  
  x_axis = reactive({
    for (i in colnames(housing_prices)[-1:-2]) {
      if (input$X_axis == i) {
        return(housing_prices)
      }
    }
  })
  
  box_inpt = reactive({
    for (i in colnames(housing_prices)[-1:-2]) {
      if (input$Box == i) {
        return(housing_prices)
      }
    }
  })
  
  #tab_select = reactive({
  #  for (i in colnames(housing_prices)[-1:-2]) {
  #    if (input$Table_Col == i) {
  #      return(housing_prices)
  #    }
  #  }
  #})
  
  observe({
    inpt_2 <<- input$Table_Col
    min_range <<- as.numeric(input$Minimum)
    max_range <<- as.numeric(input$Maximum)
    
    col_vals_2 = sort(unique(housing_prices[[inpt_2]]))
    
    updateCheckboxGroupInput(session, 'Col_Filter', label = 'Select column values to filter from.', choices = col_vals_2)
    updateTextInput(session, 'Minimum', value = min_range)
    updateTextInput(session, 'Maximum', value = max_range)
  })
  
  table_filter = reactive({
    if (is.null(input$Table_Col)) {
      return(NULL)
    }
    
    newer_data = housing_prices %>%
      filter((!!sym(inpt_2) %in% input$Col_Filter) & (price > min_range) & (price < max_range)) %>%
      arrange(desc(price))
    
    return(newer_data)
  })
  
    output$scatterPlot <- renderPlot({
      ggplot(data = filter_vals(), aes(x = area, y = price)) + geom_point(aes_string(color = input$Columns)) 
    })
    
    output$BarPlot <- renderPlot({
      ggplot(data = x_axis(), aes_string(x = input$X_axis)) + geom_bar(fill = 'blue')
    })
    
    output$BoxPlot <- renderPlot({
      ggplot(data = box_inpt(), aes_string(x = input$Box)) + geom_boxplot(aes(y = price))
    })
    
    output$FilteredTable <- renderTable({
      table_filter()
    })
})
