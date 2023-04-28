#' Uploads assignments to course data frame
#' 
#' Must be used after createAssignments().
#' @param courseName Name of course.
#' @returns Course data frame filled with inputted assignments.


uploadAssignments <- function(courseName) {

  assign(courseName, responses, envir = .GlobalEnv)
  
  remove(responses, inherits = TRUE)
  
}
