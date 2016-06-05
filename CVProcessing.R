# Initialize lists for storing genders and ages
genders <- c()
ages <- c()
usedFileNames <- c()

i <- 0
for (item in CVData) {
  i <- i + 1
  if (length(content(item)$faces) > 0) {
    gender <- content(item)$faces[[1]]$gender
    age <- content(item)$faces[[1]]$age
    
    genderCode <- 0
    if (is.integer(age) && is.character(gender)) {
      # Converting males to 0 and females to 1 for easier processing
      if (gender == "Female") { genderCode <- 1 }
      
      genders <- c(genders, genderCode)
      ages <- c(ages, age)
      
      usedFileNames <- c(usedFileNames, paste0(listOfActiveUsers[[i]], ".jpg", sep=""))
      
      print("uspech")
    }
  } else {
    print("neuspech")
  }
  
  Sys.sleep(2)
}

finalResult <- cbind(usedFileNames, genders, ages)
frameResult <- as.data.frame(finalResult)

fileName <- "photos-genders-ages.tsv"
write.table(frameResult, fileName, row.names=FALSE, sep="\t", quote=FALSE)
