# Define server function required to create the scatterplot
library(tidyverse)
library(shiny)
library(dplyr)
library(googlesheets)
library(DT)
library(ggthemes)
library(shinyWidgets)
library(tableHTML)
sheets_url="https://docs.google.com/spreadsheets/d/1GHVI16SqZos_hdy8gdH4JMjlMZqNFoRE-HD-_u3b_38/edit?usp=sharing"


 function(input, output) {
 ss<-gs_url(sheets_url)
 df<-gs_read(ss)


   

  
  # Create the scatterplot object the plotOutput function is expecting
  output$plot1 <- renderPlot({
    
    ggplot(data = df, aes_string(x = input$x, y=input$x,fill=input$y )) +
      geom_bar(stat = "identity")+
      theme(axis.title.x = element_text( size=18))+
      theme(axis.title.y = element_text( size=18))+
      theme(legend.text=element_text(size=14),legend.title=element_text(size=14))+
      coord_flip()+
      theme_solarized()+
      scale_fill_manual(values=c('#fde0dd','#fa9fb5','#DE6FA1'))+
      theme(text = element_text(size=18))+
      theme(axis.text.x=element_blank())
    
    
    
    
  })
  
  output$plot2 <-renderPlot({
    ggplot(data = df, aes_string(x = input$x, fill= input$z,alpha=0.7)) +
      geom_bar()+
      theme(axis.title.x = element_text( size=18))+
      theme(axis.title.y = element_text( size=18))+
      theme(legend.text=element_text(size=14),legend.title=element_text(size=14))+
      theme_solarized()+
      scale_fill_economist()+
      theme(axis.text.x = element_text(angle = 90, hjust = 1))+
      theme(text = element_text(size=18))
    
    
    
  })
  
  output$dataTable <- DT::renderDataTable({
    df
  })
  
  output$img1 <- renderUI({   #This is where the image is set 
    if(input$y == "Q1"){            
      img(src = "original1.jpg",  width="100%")
    }                                        
    else if(input$y == "Q2"){
      img(src = "original1.jpg",  width="100%")
    }
    
    else if(input$y == "Q3"){
      img(src = "original1.jpg",  width="100%")
    }
    else if(input$y == "Q4"){
      img(src = "bluebackground.jpg", width="100%")
    }
    else if(input$y == "Q5"){
      img(src = "redbackground.jpg", width="100%")
    }
    else if(input$y == "Q6"){
      img(src = "yellowbackground.jpg",  width="100%")
    }
    else if(input$y == "Q7"){
      img(src = "smile.jpg", width="100%")
    }
  })
  
}

