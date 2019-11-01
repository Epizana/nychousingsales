

shinyServer(function(input, output, session){
  
  selection = combined
  selection3 = buildtx
  
  observe({
  	updatePickerInput(
  		session, 'nabename',
  		choices = 
  		  if (input$boroughname == 'Choose All') {
  		    nabenames
  		} else
  		  append(unique(combined[combined$borough == input$boroughname, 'neighborhood']),'Choose All'),
  		selected = 'Choose All'
  		)})

  observe({
    updatePickerInput(
      session, 'constructname',
      choices = 
        if (input$typename == 'Choose All') {
          append(unique(combined[combined$borough == input$boroughname & combined$neighborhood == input$nabename, 'construction']), 'Choose All')
      } else
          append(unique(combined[combined$borough == input$boroughname & combined$neighborhood == input$nabename & combined$type == input$typename, 'construction']),'Choose All'),
      selected = 'Choose All'
      )})
  
  boroandnabe = reactive({

  	if (input$boroughname == 'Choose All' & input$nabename == 'Choose All') {
  		#selection = combined
  		selection
  		#selection3 = buildtx
  		#selection3
  		#typeconstruct()
	  } else if (input$boroughname != 'Choose All' & input$nabename == 'Choose All') {
		  selection = combined %>% filter(., borough == input$boroughname)
		  selection
		  #selection3 = buildtx %>% filter(., borough == input$boroughname)
		  #selection3
		  #typeconstruct()
	  } else if (input$boroughname != 'Choose All' & input$nabename != 'Choose All') {
		  selection = combined %>% filter(., borough == input$boroughname, neighborhood == input$nabename)
		  selection
		  #selection3 = buildtx %>% filter(., borough == input$boroughname, neighborhood == input$nabename)
		  #selection3
		  #typeconstruct()
	  }
  })

  
  # typeconstruct = reactive({
  #     if (input$typename == 'Choose All' & input$constructname == 'Choose All') {
  #       selection
  #       #selection3
  #     } else if (input$typename != 'Choose All' & input$constructname == 'Choose All') {
  #       selection = selection %>% filter(., type == input$typename)
  #       selection
  #       #selection3 = selection3 %>% filter(., type == input$typename)
  #       #selection3
  #     } else if (input$typename == 'Choose All' & input$constructname != 'Choose All') {
  #       selection = selection %>% filter(., construction == input$constructname)
  #       selection
  #       #selection3 = selection3 %>% filter(., construction == input$constructname)
  #       #selection3
  #     } else {
  #       selection = selection %>% filter(., type == input$typename, construction == input$constructname)
  #       selection
  #       #selection3 = selection3 %>% filter(., type == input$typename, construction == input$constructname)
  #       #selection3
  #     }
    
  # })
  
  
  #this reactive will be called when all filters (borough, neighborhood, type, construction
  #are needed in tandem.
  fourfilters = reactive({

    if ((input$typename == 'Choose All') & (input$constructname == 'Choose All')) {
      return(boroandnabe())
    } else if ((input$typename != 'Choose All') & (input$constructname == 'Choose All')) {
      selection = boroandnabe() %>% filter(., type == input$typename)
      selection
    } else if ((input$constructname != 'Choose All') & (input$typename == 'Choose All')) {
      selection = boroandnabe() %>% filter(., construction == input$constructname)
      selection
    } else {
      selection = boroandnabe() %>% filter(., type == input$typename, construction == input$constructname)
      selection
    }  
  })


  condosales = reactive({
    
    if ((input$boroughname == 'Choose All' & input$nabename == 'Choose All') & input$constructname == 'Choose All') {
      selection1 = condotx
      selection1
    } else if (input$boroughname != 'Choose All' & input$nabename == 'Choose All') {
      selection1 = condotx %>% filter(., borough == input$boroughname)
      selection1
    } else {
      selection1 = condotx %>% filter(., borough == input$boroughname, neighborhood == input$nabename)
      selection1
    }
  })


  buildingsales = reactive({
    if (input$boroughname == 'Choose All' & input$nabename == 'Choose All') {
      #selection = combined
      #selection
      selection3 = buildtx
      selection3
      
    } else if (input$boroughname != 'Choose All' & input$nabename == 'Choose All') {
      #selection = combined %>% filter(., borough == input$boroughname)
      #selection
      selection3 = buildtx %>% filter(., borough == input$boroughname)
      selection3
      #typeconstruct()
    } else if (input$typename != 'Choose All' & input$nabename != 'Choose All') {
      selection = buildtx %>% filter(., borough == input$boroughname, neighborhood == input$nabename)
      selection
      #selection3 = buildtx %>% filter(., borough == input$boroughname, neighborhood == input$nabename)
      #selection3
      #typeconstruct()
    }
    
    # if ((input$boroughname == 'Choose All' & input$nabename == 'Choose All') & (input$typename == 'Choose All' & input$constructname == 'Choose All')) {
    #   selection2 = buildtx
    #   selection2
    # } else if (input$boroughname != 'Choose All' & input$nabename == 'Choose All') {
    #   selection2 = buildtx %>% filter(., borough == input$boroughname)
    #   selection2
    # } else if (input$boroughname != 'Choose All' & input$nabename != 'Choose All') {                 
    #   selection2 = buildtx %>% filter(., borough == input$boroughname, neighborhood == input$nabename)
    #   selection2
    # }
  
  })

  
  pricetx = reactive({
    if (input$boroughname == 'Choose All' & input$nabename == 'Choose All') {
      #selection = combined
      #selection
      selection4 = prctblbduil
      selection4
      
    } else if (input$boroughname != 'Choose All' & input$nabename == 'Choose All') {
      #selection = combined %>% filter(., borough == input$boroughname)
      #selection
      selection4 = prctblbduil%>% filter(., borough == input$boroughname)
      selection4
      #typeconstruct()
    } else if (input$typename != 'Choose All' & input$nabename != 'Choose All') {
      selection4 = prctblbduil %>% filter(., borough == input$boroughname, neighborhood == input$nabename)
      selection4
      #selection3 = buildtx %>% filter(., borough == input$boroughname, neighborhood == input$nabename)
      #selection3
      #typeconstruct()
    }
    
    # if ((input$boroughname == 'Choose All' & input$nabename == 'Choose All') & (input$typename == 'Choose All' & input$constructname == 'Choose All')) {
    #   selection2 = buildtx
    #   selection2
    # } else if (input$boroughname != 'Choose All' & input$nabename == 'Choose All') {
    #   selection2 = buildtx %>% filter(., borough == input$boroughname)
    #   selection2
    # } else if (input$boroughname != 'Choose All' & input$nabename != 'Choose All') {                 
    #   selection2 = buildtx %>% filter(., borough == input$boroughname, neighborhood == input$nabename)
    #   selection2
    # }
    
  })  
  
  
  
  output$pricechange <- renderPlotly(
    pricetx() %>% plot_ly(., x = ~bdays, y = ~bprice_change, color = ~type) %>% 
    layout(title = "Price Change vs. Holding Days",
           xaxis = list(title = 'Total Holding Days'),
           yaxis = list(title = 'Aggregate Price Change'))
    
  )
  
  
  


  output$meanprices <- renderPlotly(
    #fourfilters
    fourfilters() %>% group_by(.,sale.year) %>% summarise(., mean_price = mean((sale.price))) %>%
      plot_ly(., x = ~sale.year, y = ~mean_price, type = 'scatter', mode = 'lines') %>% 
        layout(title = "Average Price Over Time",
             xaxis = list(title = 'Sale Year'),
             yaxis = list(title = 'Average Price $'))
    )
  
  output$condoreturns <- renderPlotly(
    condosales() %>% head(., 10) %>%
      plot_ly(., x = ~annual_return, y = ~reorder(main_address, annual_return), type = 'bar', orientation = 'h',
               marker = list(color = 'rgba(50, 171, 96, 0.6)',
               line = list(color = 'rgba(50, 171, 96, 1.0)', width = 1))) %>%
        layout(title = '10 Highest Returns by Condo Unit',
               yaxis = list(title = 'Unit',showgrid = FALSE, showline = FALSE, showticklabels = TRUE, domain= c(0, 0.85)),
               xaxis = list(title = 'Annualized Return (%)', zeroline = FALSE, showline = FALSE, showticklabels = TRUE, showgrid = TRUE))
    
    )
  
  output$bororeturns <- renderPlotly(
    condosales() %>% filter(., (annual_return < .2) & (annual_return > -.15)) %>% 
       plot_ly(., y = ~annual_return, color = ~borough, type = "box") %>%
        layout(title = 'Spread of Condo Returns by Borough (outlier adj.)',
               yaxis = list(title = 'Annualized Return',showgrid = FALSE, showline = FALSE, showticklabels = TRUE),
               xaxis = list(zeroline = FALSE, showline = FALSE, showticklabels = FALSE))
    )
  
  

  output$buildreturns <- renderPlotly(
    buildingsales() %>% head(., 10) %>%
      plot_ly(., x = ~bannual_return, y = ~reorder(building_address, bannual_return), type = 'bar', orientation = 'h',
               marker = list(color = 'rgba(50, 171, 96, 0.6)',
               line = list(color = 'rgba(50, 171, 96, 1.0)', width = 1))) %>%
        layout(title = '10 Highest Returns by Building Address',
               yaxis = list(title = 'Building',showgrid = FALSE, showline = FALSE, showticklabels = TRUE, domain= c(0, 0.85)),
               xaxis = list(title = 'Annualized Return (%)', zeroline = FALSE, showline = FALSE, showticklabels = TRUE, showgrid = TRUE))
   )

  output$builddensity <- renderPlot(
   buildingsales() %>% ggplot () +
    geom_density(aes(x = bannual_return, fill = type, alpha = .05)) +
    coord_cartesian(xlim = c(0, .5)) +
    xlab("") + 
    ylab("") + 
    theme_bw() + 
    ggtitle("Density of Annualized Returns Less than 5%")
   
  )

   
 
    
  
  
 
  
  
#   
    
#       
#   
#   
# 	
})




