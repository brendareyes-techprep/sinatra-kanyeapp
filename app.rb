require "sinatra"
require "sinatra/reloader"
require "http"
require "json"


get("/") do
  erb(:home)
end

get("/quote_form") do
  erb(:quote_form)
end

get("/quote_result") do
  kanye_url = "https://api.kanye.rest"
  @raw_response = HTTP.get(kanye_url).to_s
  @parsed_response = JSON.parse(@raw_response)
  @quote = @parsed_response.fetch("quote")
  erb(:quote_result)
end
