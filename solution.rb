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

post '/checkTask/' do
	
	Tarea.update(params[:n])

	redirect to('/')
end

post '/deleteTask/' do
	
	Tarea.destroy(params[:n])

	redirect to('/')
end

post '/findTask/' do
	var = Tarea.all

	@found = []

	var.each do |task|
		if task["title"].downcase.include? params[:look].downcase
			@found << task
		end
	end

	erb :found

	# redirect to('/')
end



