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
  titlePanel("Finding the Greatest Common Denominator"),
  sidebarLayout(
    mainPanel(
      h5("Using the Euclidean Algorithm, we can find the greatest 
         common denominator between any 2 integers."),
      numericInput("num1", "Select the first number", 0),
      numericInput("num2", "Select the second number", 0)
      ),
    mainPanel(
      textOutput("output"),
      htmlOutput("output2")
    ))
))
