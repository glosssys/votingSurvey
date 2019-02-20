library(tidyverse)
library(shiny)
library(dplyr)
library(googlesheets)
library(DT)
library(ggthemes)
library(shinyWidgets)
library(tableHTML)
#fetching googlesheet and convert to data frame


#shiny app
samplesize=45  
text="Sample Size:"

fluidPage(
  setBackgroundColor("#FDF6E3"),
  tags$style(HTML('table.dataTable.hover tbody tr:hover, table.dataTable.display tbody tr:hover {background-color: pink !important;}')),
  
  # Sidebar layout with a input and output definitions
  sidebarLayout(
    
    # Inputs
    sidebarPanel(width=3,
                 tags$style(make_css(list('.well', 'border-width', '0px'))),
                 h1("Image-based Voting Behaviour"),
                 h3(paste(text,samplesize)),
                 
                 # Select variable for y-axis
                 selectInput(inputId = "x", 
                             label = "Demographic A:",
                             choices = c("Gender"="Gender",
                                         "Age"="Age",
                                         "Country"="Country",
                                         "Political Identity"="Political_Identity",
                                         "Voted Before?"="Voted_before"), 
                             selected = "Gender"),
                 selectInput(inputId = "z", 
                             label = "Demographic B:",
                             choices = c("Gender"="Gender",
                                         "Age"="Age",
                                         "Country"="Country",
                                         "Political Identity"="Political_Identity",
                                         "Voted Before?"="Voted_before"), 
                             selected = "Gender"),
                 
                 radioButtons(inputId = "y", 
                              label = " Question",
                              choices = c("What political orientation do you think this politician have?"="Q1",
                                          "Would you vote for him?"="Q2" ,
                                          "Text with Image or Image only"="Q3",
                                          "Blue or Grey?"="Q4",
                                          "Red or Grey?"="Q5",
                                          "Yellow or Grey"="Q6",
                                          "Smile or Content?"="Q7"
                              ), 
                              selected = "Q1"),
                 
                 
                 uiOutput("img1")
                 
    ),
    
    
    
    # Outputs
    mainPanel(
      tabPanel("Plot",
               fluidRow(
                 column(8, plotOutput("plot1", height=800)),
                 column(4, plotOutput("plot2",height=800)),
                 column(12,  dataTableOutput(outputId = "dataTable"))
               ))    
    )))


