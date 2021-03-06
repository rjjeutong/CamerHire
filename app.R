#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(DT)
library(shinythemes)
library(readxl)

Entertainment <- read_excel("CamerHire.xlsx", sheet = "Entertainment")
Education <- read_excel("CamerHire.xlsx", sheet = "Education")
Youtube <- read_excel("CamerHire.xlsx", sheet = "Youtube")
Online <- read_excel("CamerHire.xlsx", sheet = "Online")
All_auto <- read_excel("CamerHire.xlsx", sheet = "All Auto")
real_estate <- read_excel("CamerHire.xlsx", sheet = "Real Est Agent")
containers <- read_excel("CamerHire.xlsx", sheet = "Conteners")
food <- read_excel("CamerHire.xlsx", sheet = "Food")
hair <- read_excel("CamerHire.xlsx", sheet = "Hair")
Other <- read_excel("CamerHire.xlsx", sheet = "Other")

ui <- navbarPage(
  
  theme = shinytheme(theme = "cosmo"), title = h3("Camer Hire"),
  
  tabPanel(
    h4('About'), icon = icon('question'),
    h2('This platform was created to inform the Cameroonian commuinity in North America about
       goods and services offered by their fellow citizens.'),
    h2('Click on each tab above to navigate the platform'),
    h2('If you want to update or add your business, email us at rjeutong@gmail.com or
       at stephanefokou@gmail.com')
  ),
  tabPanel(
    h4('Entertainment'), icon = icon('play'),
    h2("If you have an event, do not look elsewhere... These guys are talented."), br(),
    br(),
    dataTableOutput(outputId = 'entertainment')
  ),
  tabPanel(
    h4('Containers'), icon = icon('ship'),
    h2("Want to ship goods to Cameroon? Check these guys out."),
    br(),
    dataTableOutput(outputId = 'containers')
  ),
  tabPanel(
    h4('Education'), icon = icon('book-open'),
    h2("See what cameroonians have to offer in education... These might be of interest to you
       or your children. Even the most younger ones can benefit from some of these services.
       Check them out."),
    br(),
    dataTableOutput(outputId = 'education')
  ),
  tabPanel(
    h4('YouTube'), icon = icon('youtube-square'),
    h2("Subscribe to these channels. You might find something here useful"),
    br(),
    dataTableOutput(outputId = 'youtube')
  ),
  tabPanel(
    h4('Online'), icon = icon('laptop'),
    h2("Online services and stores. Check them out"),
    br(),
    dataTableOutput(outputId = 'online')
  ),
  tabPanel(
    h4('All Auto'), icon = icon('car'),
    h2("Probably one of the most important. Need a car? Need car repairs? These guys can help"),
    br(),
    dataTableOutput(outputId = 'auto')
  ),
  tabPanel(
    h4('Real Estate'), icon = icon('home'),
    h2("Thinking of buying a house, give agents in our community a chance"),
    br(),
    dataTableOutput(outputId = 'real_estate')
  ),
  tabPanel(
    h4('Food'), icon = icon('utensils'),
    h2("Food the way you like. From pickup to catering, we got it. All cameroonian"),
    br(),
    dataTableOutput(outputId = 'food')
  ),
  tabPanel(
    h4('Hair'), icon = icon('hair'),
    h2("Everything Hair"),
    br(),
    dataTableOutput(outputId = 'hair')
  ),
  tabPanel(
    h4('Other Businesses'), icon = icon('dollar-sign'),
    h2("Don't ignore this. There are important goods and services here"),
    br(),
    dataTableOutput(outputId = 'other')
  )
)

server <- function(input, output) {
  
  output$entertainment <- DT::renderDataTable(
    Entertainment %>% 
      datatable(options = list(pageLength = 25,
                               escape = F,
                               #autoWidth = T,
                               #scrollX=TRUE,
                               #scrollY=400,
                               #scrollCollapse=TRUE,
                               columnDefs = list(list(targets = 2, width = '20%'),
                                                 list(targets = 6, width = '150px'))),
                filter = 'top')
  )
  
  output$education <- DT::renderDataTable(
   Education %>% 
     datatable(options = list(pageLength = 25), filter = 'top')
  )
  output$youtube <- DT::renderDataTable(
    Youtube %>%
      datatable(options = list(pageLength = 25), filter = 'top')
  )
  output$online <- DT::renderDataTable(
    Online %>%
      datatable(options = list(pageLength = 25,
                               escape = F,
                               columnDefs = list(list(targets = c(2,6), width = '30%'))),
                filter = 'top')
  )
  output$auto <- DT::renderDataTable(
    All_auto %>%
      datatable(options = list(pageLength = 25), filter = 'top')
  )
  
  output$real_estate <- DT::renderDataTable(
    real_estate %>%
      datatable(options = list(pageLength = 25), filter = 'top')
  )
  
  output$containers <- DT::renderDataTable(
    containers %>%
      datatable(options = list(pageLength = 25), filter = 'top')
  )
  
  output$food <- DT::renderDataTable(
    food %>%
      datatable(options = list(pageLength = 25), filter = 'top')
  )
  
  output$hair <- DT::renderDataTable(
    hair %>%
      datatable(options = list(pageLength = 25), filter = 'top')
  )
  
  output$other <- DT::renderDataTable(
    Other %>%
      datatable(options = list(pageLength = 25,
                               escape = F,
                               columnDefs = list(list(targets = c(2,8), width = '30%'),
                                                 list(targets = 6, width = '10%'))),
                filter = 'top')
  )
}

shinyApp(ui = ui, server = server)
