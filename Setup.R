library(httr)

fbID <- read.csv("keys.csv", sep = ",", strip.white = TRUE, stringsAsFactors = FALSE)[[1]][[6]]
fbSecret <- read.csv("keys.csv", sep = ",", strip.white = TRUE, stringsAsFactors = FALSE)[[1]][[8]]
token <- fbOAuth(app_id=fbID, app_secret=fbSecret)
  
#####################################################

# table of all likers
tbl <- read.csv("czechitas_likes.csv")
# table of all likers based on frequency
tblFreq <- data.frame(table(tbl$from_id))
# limiting dataset based on frequency of likes
activeUsers <- subset(tblFreq, Freq > 5)
listOfActiveUsers <- as.vector(activeUsers$Var1)
