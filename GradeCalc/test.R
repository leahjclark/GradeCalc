#Test Script

#Create course weights data frame using course name, categories, and their respective weights in decimal format
createCourseWeights("PSY2012", c("Papers", "Quizzes", "Midterm", "Final"), c(0.2,0.4,0.2,0.2))

#Input assignments using Shiny app form
createAssignments()

#Upload assignments into course data frame
uploadAssignments("PSY2012")

#Calculate final grade for course using assignment data frame and category data frame
calcGrade(PSY2012, PSY2012Categories)

#Different example, use to calculate when all grades except final have been completed
#Will calculate needed grade on final to reach the desired grade
calculateFinalGradeNeeded(72,76,0.15)


