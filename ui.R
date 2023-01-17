#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyWidgets)

# Define UI for application
shinyUI(navbarPage(title = HTML("<h2><b>Loan Installment Calculator</b></h4>"),
                    tabPanel(h3("App"),
                             sidebarLayout(
                                     sidebarPanel(
                                             condition = "input.tabs==1",
                                             h2("Loan parameters"),
                                             helpText("Please enter the Loan Amount. The up/down buttons from the input field area increase/decrease the amount by 1 per click."),
                                             numericInputIcon(inputId = "pv", label = "Loan Amount:",  min = 0, value = 10000, icon = list(icon("euro-sign"), NULL)),
                                             HTML("<br/>"),
                                             
                                             helpText("Please select the loan term by using the slider below"),
                                             sliderInput(inputId = "nper", label ="Term (months):", min = 0, max = 120, value = 12),
                                             HTML("<br/>"),
                                             
                                             helpText("Please enter the annual interest rate. The up/down buttons from the input field area increase/decrease the rate by 0.1% per click."),
                                             numericInputIcon(inputId = "rate", label = "Annual interest rate:", min = 0, value = 7, step=0.1, icon = list(NULL, icon("percent"))),
                                             
                                             submitButton("Calculate")
                                     ),
                                     mainPanel(
                                             fluidRow(
                                                     column(
                                                             5,
                                                             HTML("<br/>"),
                                                             h4("Monthly Payment:"),
                                                             h4("Total interest to be paid:")
                                                     ),
                                                     column(
                                                             1, 
                                                             HTML("<br/>"),
                                                             h4(textOutput("payment")),
                                                             h4(textOutput("interest"))
                                                     )
                                             )
                                     )
                                     
                             )
                    ),
                    tabPanel(h3("About app & Documentation"),
                             mainPanel(
                                     HTML("<h3><b>About application</b></h4>"),
                                     h4("This application was created by Radu-Ionel Toma as an assignment in the Coursera' course titled 'Developing Data Products'."),
                                     h4("The application was developed using 'Shiny' library and 'RStudio' and implementing the 'PMT' function for calculating the monthly loan payment."),
                                     HTML("<h4><b>The presentation about the app can be found <a href='https://www.google.com'>here</a>.<b/></h4>"),
                                     HTML("<h4><b>The app files can be found <a href='https://www.google.com'>here</a>.<b/></h4>"),
                                     HTML("<br/>"),
                                     HTML("<h3><b>Instructions</b></h4>"),
                                     h4("For the calculation of the Monthly Installment to a loan and the Total interest to be paid, the user has to provide the following variables:"),
                                     tags$li(tags$span("Loan amount")),
                                     tags$li(tags$span("Loan Term in months")),
                                     tags$li(tags$span("Annual Interest Rate")),
                                     h4("The application has default values, but the user can change them. Once the new variables are provided, the 'Calculate' button should be pressed. "),
                             )
                    )
        )
)