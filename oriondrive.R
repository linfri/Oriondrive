library(bhappyr)
library(dplyr)
library(tuneR)
library(aws.polly)
library(httr)

generateOneVoice <- function(n = 3, workdir, voice = "Joanna") {
  
  if (workdir == "") stop("Specify working directory!")
  if (!file.exists("aws_key.txt")) stop("AWS key is missing!")
  if (!file.exists("aws_secret.txt")) stop("AWS secret key is missing!")
  if (!file.exists("deepai_key.txt")) stop("DeepAI key is missing!")
  
  accessKey <- readLines("aws_key.txt")
  secretKey <- readLines("aws_secret.txt")
  apiKey <- readLines("deepai_key.txt")
  Sys.setenv(
    "AWS_ACCESS_KEY_ID" = accessKey,
    "AWS_SECRET_ACCESS_KEY" = secretKey
  )

  # setwd(workdir)

  phraseList <- vector("character", length = n)
  fileNames <- vector("character", length = n)
  waveBind <- new("Wave", stereo = TRUE, samp.rate = 22050, bit = 16, pcm = TRUE)

  headers <- c("api-key" = apiKey)

  for (i in 1:n) {
    files <- list("text" = capture.output(generateHappyFeedback()))
    print(paste0("API request #", i, "..."))
    res <- httr::POST(
      url = "https://api.deepai.org/api/text-generator",
      httr::add_headers(.headers = headers), body = files
    )
    phraseListTemp <- content(res)
    phraseList[i] <- phraseListTemp[["output"]]
    waveVec <- synthesize(phraseList[i], voice = voice)
    fileNames[i] <- paste0(tempfile(), ".wav")
    writeWave(waveVec, fileNames[i])
  }

  for (i in 1:n) {
    waveVec <- stereo(readWave(fileNames[i]), readWave(fileNames[i]))
    silentVec <- silence(
      duration = runif(1, 50000, 120000),
      samp.rate = 22050, bit = 16,
      stereo = TRUE, pcm = TRUE
    )
    waveBind <- bind(waveBind, waveVec, silentVec)
  }

  bindPath <- paste0(basename(tempfile(pattern = "Voice")), ".wav")
  writeWave(waveBind, bindPath)
  return(print(paste0("Voice file saved in ", bindPath)))
}

generateVoice <- function(j = 3, n = 3, workdir = getwd()) {
  for (i in 1:j) {
    generateOneVoice(n, workdir)
  }

  return(print("Voices generated!"))
}
