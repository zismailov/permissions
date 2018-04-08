# REQUIREMENTS

# INSTALLATION
`bundle install`

# TESTING
`rspec`

# RUNNING
`rails s`

# CURL

create user: `bin/curl_user`

create permissions: `bin/curl_permissions`


# ruby

```ruby
require 'net/http'
require 'uri'

# Permission
uri = URI.parse("http://localhost:3000/api/v1/permissions")
request = Net::HTTP::Post.new(uri)
request.set_form_data(
  "entity[id]" => "ID",
  "entity[type]" => "[User|Role]",
  "permissions[action]" => "ACTION",
  "permissions[value]" => "[true|false]",
)

# User
uri = URI.parse("http://localhost:3000/api/v1/users")
request = Net::HTTP::Post.new(uri)
request.set_form_data(
  "user[email]" => "Email",
  "user[username]" => "Username",
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
