library(plumber)

#* Return health is ok
#* @serializer text
#* @get /healthz
function() {
  "ok"
}

#* Return for hello world.
#* @serializer text
#* @get /plaintext
function() {
  "Hello, World!"
}

#* Return for hello world using json
#* @serializer unboxedJSON
#* @get /json
function() {
  list("message" = "Hello, World!")
}

#* @filter add server header
function(res){
    res$setHeader("Server", "Rplumber-v1.0.0")
  plumber::forward()
}