require 'sinatra'
require "make_todo"

get '/' do

	@allTasks = Tarea.all

	erb :newtask

end

get '/todas' do

	var = Tarea.all

	"#{var}"

end

post '/' do
	
	var = Tarea.create("#{params[:task]}")

	"Tarea: #{params[:task]} : Creada. Estado: #{var}"

	redirect to('/')
end


# get '/' do
# 	"Hola"
# 	erb :forma
# end

# post '/' do
# 	"¡Hola #{params[:nombre]}"
# end