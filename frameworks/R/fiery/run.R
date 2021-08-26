library(fiery)
library(routr)

app <- Fire$new(host = "0.0.0.0")

plaintext <- function(server, request, response, keys, ...) {
  response <- request$respond()
  response$status <- 200L
  response$body <- server$get_data('hello')
  response$type <- "text/plain"
  return(FALSE)
}

json <- function(server, request, response, keys, ...) {
  response <- request$respond()
  response$status <- 200L
  response$body <- jsonlite::toJSON(list("message" = server$get_data('hello')), auto_unbox = TRUE, pretty = FALSE)
  response$type <- "application/json"
  return(FALSE)
}

hello <- function(request, response, keys, ...) {
  response <- request$respond()
  response$status <- 200L
  response$body <- "hello"
  response$type <- "text/plain"
  return(FALSE)
}

router <- RouteStack$new()
route <- Route$new()
router$add_route(route, 'main')

route$add_handler('get', '/', hello)
route$add_handler('get', '/plaintext', plaintext)
route$add_handler('get', '/json', json)

app$attach(router)

# Setup the data every time it starts
app$on('start', function(server, ...) {
  server$set_data('hello', "Hello, World!")
  message("start Server")
})

app$header('Server', 'fiery-v1.1.3')

app$start(block = TRUE)
