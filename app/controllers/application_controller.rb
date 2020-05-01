require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/' do 
    "This is a list for recipes." 
  end 

  get '/recipes/new' do 
    @recipe = Recipe.new
    erb :new
  end

  get 'recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end

  post 'recipes/new' do 
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    Recipe.save
    redirect to "/recipes/#{recipe.id}"
  end


end
