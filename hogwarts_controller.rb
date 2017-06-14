require("sinatra")
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('models/student.rb')
require_relative('models/house.rb')

# INDEX action 3 of 7.
get "/students" do
  @students = Student.all()
  erb(:index)
end

# NEW action 1 of 7. Must be above the SHOW route!
# There is a link in layout.erb that takes you to the Order form.
get "/students/new" do
  @houses = House.all()
  erb(:new)
end

# # SHOW action 4 of 7.
# get "/students/:id" do
#   @student = Student.find(params["id"].to_i)
#   erb(:show)
# end

# CREATE action 2 of 7.
post "/students" do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end