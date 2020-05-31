class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  
  get '/recipes' do
    erb :index
  end
  
  get '/recipes/new' do
    erb :new
  end
  
  get '/recipes/:id' do
    id = params[:id]
    @recipe = Recipe.find_by_id(id)
    erb :recipe
  end
  
  get '/recipes/:id/edit' do
    id = params[:id]
    @recipe = Recipe.find_by_id(id)
    erb :edit
  end
  
  post '/recipes' do
    name = params[:name]
    ingredients = params[:ingredients]
    cook_time = params[:cook_time]
    @recipe = Recipe.create(name: name, ingredients: ingredients, cook_time: cook_time)
    id = @recipe.id
    redirect "/recipes/#{id}"
  end
  
  patch '/recipes/:id' do
    id = params[:id]
    name = params[:name]
    ingredients = params[:ingredients]
    cook_time = params[:cook_time]
    
    @recipe = Recipe.find_by_id(id)
    @recipe.name = name
    @recipe.ingredients = ingredients
    @recipe.cook_time = cook_time
    @recipe.save
    
    redirect "/recipes/#{id}"
  end
  
  delete '/recipes/:id' do #destroy action
    id = params[:id]
    @recipe = Recipe.find_by_id(id)
    @recipe.delete
  end
  
end
