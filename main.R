#-------------------------------------------------------------------------------
# Entry point to Oriondrive API by Linn Friberg (https://github.com/linfri)
#-------------------------------------------------------------------------------

library(plumber)

port <- Sys.getenv("PORT")
server <- plumb("oriondrive.R")
server$run(
  host = "0.0.0.0",
  port = as.numeric(port),
  docs = TRUE
)
