##### R Script to import zwift FIT files #####

url <-  'https://secure.zwift.com/auth/realms/zwift/tokens/access/codes'
baseurl <- 'https://us-or-rly101.zwift.com'

get_zwift_activities <- function(un,pw,limit){

  #get the profile
  headers <- list( "client_id" = "Zwift_Mobile_Link",
                   "username" = un,
                   "password" =  pw,
                   "grant_type" = "password"
  )

  res <- httr::POST(url, body = headers, encode = "form")
  auth <- jsonlite::fromJSON(rawToChar(res$content))

  #get the profile
  headers <- c(
    "Accept" = 'application/json',
    "Authorization" = paste0("Bearer ",auth$access_token),
    "User-Agent" = "Zwift/115 CFNetwork/758.0.2 Darwin/15.0.0"
  )

  res <- httr::GET(paste0(baseurl,'/api/profiles/me'), httr::add_headers(headers))
  profile <- jsonlite::fromJSON(rawToChar(res$content))

  #get the activities
  res <- httr::GET(paste0(baseurl,'/api/profiles/',profile$id,
                    "/activities/?start=0&limit=",limit),
             httr::add_headers(headers))
  acts <- jsonlite::fromJSON(rawToChar(res$content))

  return(acts)

}

download_zwift <- function(un,pw,fitid,fn){

  #get the profile
  headers <- list( "client_id" = "Zwift_Mobile_Link",
                   "username" = un,
                   "password" =  pw,
                   "grant_type" = "password"
  )

  res <- httr::POST(url, body = headers, encode = "form")
  auth <- jsonlite::fromJSON(rawToChar(res$content))

  #get the profile
  headers <- c(
    "Accept" = 'application/json',
    "Authorization" = paste0("Bearer ",auth$access_token),
    "User-Agent" = "Zwift/115 CFNetwork/758.0.2 Darwin/15.0.0"
  )

  res <- httr::GET(paste0(baseurl,'/api/profiles/me'), httr::add_headers(headers))
  profile <- jsonlite::fromJSON(rawToChar(res$content))

  #download the activity
  res <- httr::GET(paste0(baseurl,'/api/profiles/',profile$id,
                    "/activities/",fitid),
             httr::add_headers(headers))
  act <- jsonlite::fromJSON(rawToChar(res$content))

  fit_url <- paste0('https://',act$fitFileBucket,'.s3.amazonaws.com/',act$fitFileKey)
  download.file(fit_url,fn, mode = "wb")

}
