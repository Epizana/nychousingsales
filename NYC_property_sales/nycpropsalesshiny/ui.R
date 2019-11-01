

dashboardPage(
  skin = 'black',
  dashboardHeader(title = h4(HTML("New York City <br/>Housing Sales" ))),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Price", tabName ="meanpricemenu", icon = icon("chart-line")),
      menuItem("Condo Unit Returns", tabName ="condoreturnmenu", icon = icon("chart-line")),
      menuItem("Building Share Returns", tabName ="buildreturnmenu", icon = icon("chart-line")),
      menuItem("Popular Neighborhoods", tabName ="nabesmenu", icon = icon("chart-line")),
      menuItem("Popular Buildings", tabName ="bldgsnmenu", icon = icon("chart-line")),
      br(),
      br(),
      box(
        status = "primary", background = 'black', solidHeader = F,
        collapsible = T,
        
        # splitLayout(
        #   sliderInput("slider", "Year", 2004, min = 2004, max = 2019, step = 1, sep = "")),
        #splitLayout(
        pickerInput(inputId = 'boroughname', label = "1. Select Borough", 
                    selected = 'Choose All',
                    choices = boroughnames,
                    options = list( size = 6, style = "btn-primary")),
        pickerInput(inputId = 'nabename', label = "2. Select Neighborhood", 
                    selected = 'Choose All',
                    choices = nabenames,
                    options = list( size = 10, style = "btn-success")),
        pickerInput(inputId = 'typename', label = "3. Select Type", 
                    selected = 'Choose All',
                    choices = typenames,
                    options = list( size = 10, style = "btn-warning")),
        pickerInput(inputId = 'constructname', label = "4. Select Construction", 
                    selected = 'Choose All',
                    choices = constructnames,
                    options = list( size = 10, style = "btn-danger")),
        width = "25%", height = "25%")
    ),

    sidebarUserPanel("Emanuel Pizana" #possible image,
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "meanpricemenu",
        # fluidRow(
        #       infoBoxOutput("maxBox"),
        #       infoBoxOutput("minBox"),
        #       infoBoxOutput("avgBox")
        #         ),
        fluidRow(
          box(plotlyOutput("meanprices"),
          #box(plotlyOutput("cumprices"),
          width = "50%", height = "50%"),
          box(plotlyOutput("pricechange"),
              #box(plotlyOutput("cumprices"),
              width = "50%", height = "50%")
        ),
        br()
      ),
      tabItem(tabName = "condoreturnmenu",
        # fluidRow(
        #       infoBoxOutput("maxBox"),
        #       infoBoxOutput("minBox"),
        #       infoBoxOutput("avgBox")
        #         ),
        fluidRow(
          box(plotlyOutput("condoreturns"),
             width = "100%", height = "50%"),
          box(plotlyOutput("bororeturns"),
             width = "100%", height = "50%")

        )
      ),
      tabItem(tabName = "buildreturnmenu",
        # fluidRow(
        #       infoBoxOutput("maxBox"),
        #       infoBoxOutput("minBox"),
        #       infoBoxOutput("avgBox")
        #         ),
        fluidRow(
          box(plotlyOutput("buildreturns"),
             width = "100%", height = "50%"),
          box(plotOutput("builddensity"),
              width = "100%", height = "50%")

        ))




          # box(htmlOutput("map"), height = 300),
          # box(htmlOutput("hist"), height = 300)
    ) 
  )
      # tabItem(tabName = "data",
      #   fluidRow(box(DT::dataTableOutput("table"), width = 12)))
)
  



