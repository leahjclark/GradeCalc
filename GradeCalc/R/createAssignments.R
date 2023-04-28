#' Creates course assignments using Shiny form
#' 
#' Input all course assignments for all categories at once. Then use uploadAssignments().
#' @returns Form responses. 

#This section of code is partially sampled from a tutorial provided by Dean Attali. It was edited to request the grade data from the user and to store the data locally as per the needs of this package. 
#Here are the two blogs I referenced: https://deanattali.com/2015/06/14/mimicking-google-form-shiny/
#https://deanattali.com/blog/shiny-persistent-data-storage/

createAssignments <- function() {

  
  # Define the fields we want to save from the form
  fields <- c("AssignmentName", "AssignmentGrade", "CategoryName")
  
  # Save a response
  # ---- This is one of the two functions we will change for every storage type ----
  saveData <- function(data) {
    data <- as.data.frame(t(data))
    if (exists("responses")) {
      responses <<- rbind(responses, data)
    } else {
      responses <<- data
    }
  }
  
  # Load all previous responses
  # ---- This is one of the two functions we will change for every storage type ----
  loadData <- function() {
    if (exists("responses")) {
      responses
    }
  }
  
  # Shiny app with 3 fields that the user can submit data for
  shinyApp(
    ui = fluidPage(
      DT::dataTableOutput("course", width = 300), tags$hr(),
      textInput("AssignmentName", "Assignment Name", ""),
      textInput("AssignmentGrade", "Assignment Grade", ""),
      textInput("CategoryName", "Category Name", ""),
      actionButton("submit", "Submit")
    ),
    server = function(input, output, session) {
      
      # Whenever a field is filled, aggregate all form data
      formData <- reactive({
        data <- sapply(fields, function(x) input[[x]])
        data
      })
      
      # When the Submit button is clicked, save the form data
      observeEvent(input$submit, {
        saveData(formData())
      })
      
      # Show the previous responses
      # (update with current response when Submit is clicked)
      output$course <- DT::renderDataTable({
        input$submit
        loadData()
      })     
    }
  )
  
}
