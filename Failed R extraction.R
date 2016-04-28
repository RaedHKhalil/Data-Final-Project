# Load packages we're going to need
packages <- c("data.table","rvest","dplyr","lubridate","pipeR","scales","ggplot2","stringr","corrplot","png","jsonlite","tidyr","caTools","Metrics")
lapply(packages,require,character.only=T)

# Define the URL of the page we're going to scrape
url <- 'https://www.twitch.tv/directory/all'

page <- read_html('https://www.twitch.tv/directory/all')

# find all nodes with a class of "listing_row_price"
listings <- html_nodes(page, css = '.info')

# Rip that table out of the page
projectdata <- url %>% read_html() %>% html_nodes(listings) %>% as.data.frame()

# That didn't work, so let's try to get the selector for each individual piece of information we want then
# Let's try to make the first one work and then replicate it to the rest

css1 <- '#ember1108 > div > div > div.meta > p.info'

projectdata <- url %>% read_html() %>% html_nodes(css1) %>% as.data.frame()

# But that didn't work either and after tickering with it for a while, I just decided to use another tool to scrape 