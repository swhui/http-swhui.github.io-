#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# create the gcd function
gcd = function(bigger_number , smaller_number){
  if (bigger_number == smaller_number){
    return(bigger_number)
  }
  if (bigger_number < 0 | smaller_number < 0){
    bigger_number = abs(bigger_number)
    smaller_number = abs(smaller_number)
  }
  else if (bigger_number < smaller_number){
    big = smaller_number
    smaller_number = bigger_number
    bigger_number = big
  }
  while (smaller_number %% bigger_number != 0 ){
    divisor = floor( bigger_number / smaller_number)
    remainder = bigger_number -  smaller_number * divisor
    bigger_number = smaller_number
    smaller_number = remainder
  }
  return(bigger_number)
}

gcd2 = function(bigger_number , smaller_number){
  if (bigger_number == smaller_number){
    return(bigger_number)
  }
  if (bigger_number < 0 | smaller_number < 0){
    bigger_number = abs(bigger_number)
    smaller_number = abs(smaller_number)
  }
  else if (bigger_number < smaller_number){
    big = smaller_number
    smaller_number = bigger_number
    bigger_number = big
  }
  work = 'Showing work:'
  while (smaller_number %% bigger_number != 0 ){
    divisor = floor( bigger_number / smaller_number)
    remainder = bigger_number -  smaller_number * divisor
    temp = (paste0(bigger_number, ' = ', smaller_number, ' * ', divisor, ' + ', remainder))
    bigger_number = smaller_number
    smaller_number = remainder
    work = paste(work, temp, sep="<br/>")
  }
  final_result = paste0('The final result is ', bigger_number, '.')
  work = paste(work, final_result, sep="<br/>")
  return( work )
}

# Define server logic 
shinyServer(function(input, output) {
  output$output <- renderText({
    gcd(input$num1, input$num2)
    
  })
  
  output$output2 <- renderUI({
    HTML( gcd2(input$num1, input$num2) ) 
    
  })
  
})
