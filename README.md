# blog-on-rails
My first web-app made with Ruby on Rails framework

The project was carried out according to the recommendations from this resource:
https://www.theodinproject.com/courses/web-development-101/lessons/ruby-on-rails

# Notes:
Give the author administrator rights (rails console):

In production: 
````ruby
author = Author.find(id)
author.update_attribute(:is_admin, true)
````

Because of using SQLite in development enviroment #update_attribute will not work properly. So, there is solution:

In development:
````ruby
#setting new password is needed because otherwise there is "rollback transaction" due to password validation in Author model
author = Author.find(id)
author.is_admin = true
author.password = "password" 
author.password_confirmation = "password"
author.save
````
