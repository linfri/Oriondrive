#-------------------------------------------------------------------------------
# Oriondrive API by Linn Friberg (https://github.com/linfri)
#-------------------------------------------------------------------------------

# Loading necessary packages

if(!require("pacman")) install.packages("pacman")
pacman::p_load(tuneR, httr, aws.polly, remotes, plumber)

if(!require("bhappyr")) remotes::install_github("LudvigOlsen/bhappyr")
pacman::p_load(bhappyr)

#* @apiTitle Oriondrive API
#* @apiDescription As of now, a very basic and Hello World-like API. The only endpoint within the API so far serves a WAV file with generated "amusing feedback" phrase completed by DeepAI GPT2 model.

#' Default GET response.
#' @get /
function() {
  list(status = "Alright, it works! If you want to get a generated WAV file, GET request to /wav is your way to go")
}

#' Serves a wav file with "amusing feedback" completed by DeepAI GPT2 model.
#' @serializer contentType list(type="application/octet-stream")
#' @get /wav

generateVoice <- function(res) {
  
  # Checking whether the keys exist (AWS and DeepAI)
  if (!file.exists("aws_key.txt")) stop("AWS key is missing!")
  if (!file.exists("aws_secret.txt")) stop("AWS secret key is missing!")
  if (!file.exists("deepai_key.txt")) stop("DeepAI key is missing!")
  
  # Loading the keys
  accessKey <- readLines("aws_key.txt")
  secretKey <- readLines("aws_secret.txt")
  apiKey <- readLines("deepai_key.txt")
  Sys.setenv(
    "AWS_ACCESS_KEY_ID" = accessKey,
    "AWS_SECRET_ACCESS_KEY" = secretKey
  )
  
  # Generating the initial phrase and completing it with DeepAI API
  headers <- c("api-key" = apiKey)
  phrase <- list("text" = capture.output(generateHappyFeedback()))
  postReq <- httr::POST(
    url = "https://api.deepai.org/api/text-generator",
    httr::add_headers(.headers = headers), body = phrase
  )
  
  # Synthesizing the phrase
  phraseReq <- httr::content(postReq)
  waveVec <- synthesize(phraseReq[["output"]], voice = "Joanna")
  
  # Serving the file
  tFile <- tempfile()
  writeWave(waveVec, tFile)
  res$setHeader("Content-Disposition", "attachment; filename=output.wav")
  readBin(tFile, "raw", n = file.info(tFile)$size)
  
}

