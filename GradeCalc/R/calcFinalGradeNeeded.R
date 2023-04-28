#' Calculate grade needed on a final for a course
#' 
#' @param currentGrade Current course grade.
#' @param goalGrade Grade you would like to achieve.
#' @param finalWeight Weight of the final.
#' @returns Grade needed on final to achieve desired course grade.
#' @examples
#' calculateFinalGradeNeeded(87, 92, 0.2)


calculateFinalGradeNeeded <- function(currentGrade, goalGrade, finalWeight) {
  
  leftoverWeight <- 1 - finalWeight
  
  finalGrade <- (goalGrade - (currentGrade * leftoverWeight))/finalWeight
  
  finalGrade <- round(finalGrade, 2)
  
  finalGrade
  
}
