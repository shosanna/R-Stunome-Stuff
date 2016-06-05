# initialize empty list
urls <- list()

# Getting URL of profile pictures for all likers
for(id in listOfActiveUsers) {
  result <- tryCatch({
    url <- getProfilePictureUrl(id,token)
    if(url!="") {
      urls <- c(urls, url)
    }
  }, error = function(errorCondition) {
    print("error")
  }) 
}