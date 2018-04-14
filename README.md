# blog-on-rails
My first web-app made with Ruby on Rails framework

The project was carried out according to the recommendations from this resource:
https://www.theodinproject.com/courses/web-development-101/lessons/ruby-on-rails

# Notes:
Give the author administrator rights (rails console): 
````ruby
author = Author.find(id)
author.update_attribute(:is_admin, true)
````
