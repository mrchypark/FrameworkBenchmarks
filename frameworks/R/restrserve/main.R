library(RestRserve)
app = Application$new()

hw = "Hello, World!"

app$add_get(
  path = "/healthz", 
  FUN = function(.req, .res) {
    .res$set_body("OK")
  })

app$add_get(
  path = "/json", 
  FUN = function(.req, .res) {
    result = list("message" = hw)
    .res$set_content_type("application/json")
    .res$set_body(result)
  })

app$add_get(
  path = "/plaintext", 
  FUN = function(.req, .res) {
    result = hw
    .res$set_body(result)
  })


date_middleware = Middleware$new(
  process_response = function(.req, .res) {
    # compress body
    .res$set_header("Date", paste(format(Sys.time(), "%a, %d %b %Y %H:%M:%S", tz = "gmt"), "GMT"))
  },
  id = "date_header"
)
app$append_middleware(date_middleware)

backend = BackendRserve$new()
backend$start(app, http_port = 8080)