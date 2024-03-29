require('sinatra')
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/student')
require_relative('./models/house')
also_reload('./models/*')

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  @houses = House.all()
  erb(:new)
end

post '/students/new' do
  @student = Student.new(params)
  @student.save()
  @house = @student.house()
  erb(:created)
end
