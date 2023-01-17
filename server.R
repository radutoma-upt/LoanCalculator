#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

## The PMT calculation Function:
## https://support.microsoft.com/en-us/office/pmt-function-0214da64-9a63-4996-bc20-214433fa6441
## PMT=(pv*rate)/(1-(1+rate)^(-nper))

PMT <- function(rate, nper, pv) {
        r <- rate/(12*100)
        t <- nper
        P <- (pv*r)/(1-(1+r)^(-t))
        return(P)
}

INTER <- function(rate, nper, pv) {
        r <- rate/(12*100)
        t <- nper
        I <- t*((pv*r)/(1-(1+r)^(-t)))-pv
        return(I)
}


# Define server logic required

shinyServer(
        function(input, output) {
                
                
                total_loan_amount <- reactive({
                        validate(
                                need(input$pv, 'Please enter a numeric value for all fields'),
                        )
                })
                
                
                output$payment <- renderPrint({
                        payment <- PMT(input$rate, input$nper, input$pv)
                     #   cat("")
                        cat(round(payment, 2))
                })
                
                output$interest <- renderPrint({
                        interest <- INTER(input$rate, input$nper, input$pv)
                        #   cat("")
                        cat(round(interest, 2))
                })
                
        }
)