# blog-on-rails
My first web-app made with Ruby on Rails framework

The project was carried out according to the recommendations from this resource:
http://codenamecrud.ru/basics-of-web-development/project-ruby-on-rails

# Notes:
Give the author administrator rights (rails console): 
````ruby
#setting new password is needed because otherwise there is "rollback transaction" due to password validation in Author model
author = Author.find(id)
author.is_admin = true
author.password = "password" 
author.password_confirmation = "password"
author.save
````
