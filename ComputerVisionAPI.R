library(httr)

apiURL = "https://api.projectoxford.ai/vision/v1.0/analyze?visualFeatures=Categories,Faces"
apiKey <- read.csv("keys.csv", sep = ",", strip.white = TRUE, stringsAsFactors = FALSE)[[1]][[10]]
CVData <- list()

# Getting gender and age based on photo for all likers
for (photoUrl in urls) {
  print("Getting response from Computer Vision API")
  
  body = list(url = photoUrl)
  faceResponse = POST(
    url = apiURL, 
    content_type('application/json'), add_headers(.headers = c('Ocp-Apim-Subscription-Key' = apiKey)),
    body = body,
    encode = 'json'
  )
  
  CVData <- append(CVData, list(faceResponse))
  # sleep for rate limits
  Sys.sleep(2)
}