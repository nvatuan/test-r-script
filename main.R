devtools::install_github("StevenMMortimer/googlesites")

GoogleAuthClientId <- Sys.getenv("GOOGLE_OAUTH_CLIENT_ID")
GoogleAuthClientSecret <- Sys.getenv("GOOGLE_OAUTH_CLIENT_SECRET")

if (is.null(GoogleAuthClientId) || is.null(GoogleAuthClientSecret)) {
  stop("GoogleAuthClientId or GoogleAuthClientSecret is empty. Please set the environment variables.")
}

library(googlesites)
options(googlesites.site_domain = "site") # or your Apps domain
options(googlesites.site_name = "my-site")

library(googleAuthR)
options(googleAuthR.client_id = GoogleAuthClientId)
options(googleAuthR.client_secret = GoogleAuthClientSecret)
# or you can use the package default client
options(googleAuthR.client_id = getOption("googlesites.client_id"))
options(googleAuthR.client_secret = getOption("googlesites.client_secret"))
options(googleAuthR.scopes.selected = "https://sites.google.com/feeds/")
gar_auth()
