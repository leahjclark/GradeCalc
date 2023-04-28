#' Creates course categories data frame
#' 
#' @param courseName Name of course. Do not include spaces or anything that would not be allowed in a variable name
#' @param categoryNames Character vector containing category names for given course.
#' @param categoryWeights Character vector containing respective weights for each category for given course. Format as decimal.
#' @returns Course Categories data frame.
#' @examples
#' createCourseWeights("PSY2012", c("Papers", "Quizzes", "Midterm", "Final"), c(0.2,0.4,0.2,0.2))

createCourseWeights <- function(courseName, categoryNames, categoryWeights) {
  
  #Check if weights add up to 0, if not, give error
  try(if(sum(categoryWeights) != 1) stop("--- Weights do not total to 1. Please provide in decimal format ---"))
  
  #Make category name & weight dataframe
  categories <- data.frame(categoryNames, categoryWeights)
  colnames(categories) <- c("CategoryName", "CategoryWeight")
  name <- paste(courseName, "Categories", sep = "")
  assign(name, categories, envir = .GlobalEnv)
  
}

