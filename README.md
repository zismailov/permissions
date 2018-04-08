# REQUIREMENTS

# INSTALLATION
`bundle install`

# TESTING
`rspec`

# RUNNING
`rails s`

# CURL
POST: bin/curl

GET: http://localhost:3000/api/v1/permissions/action_permitted?entity[type]=[User|Role]&entity[id]=ID&permissions[action]=ACTION



```ruby
require 'net/http'
require 'uri'

uri = URI.parse("http://localhost:3000/api/v1/permissions")
request = Net::HTTP::Post.new(uri)
request.set_form_data(
  "entity[id]" => "ID",
  "entity[type]" => "[User|Role]",
  "permissions[action]" => "ACTION",
  "permissions[value]" => "[true|false]",
)

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# response.code
# response.body
```
