require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#  get '/' do 
#   erb :index 
#  end 

 get '/recipes/new' do #create
  erb :new 
 end 

 get '/recipes' do 
  @recipes = Recipe.all 
  erb :index
end 

 post '/recipes' do #create
  recipe = Recipe.new(params)
  recipe.save 
   
  redirect "/recipes/#{recipe.id}"
 end 

 get '/recipes/:id' do 
  @recipe = Recipe.find(params[:id])
  erb :show
 end 

 get '/recipes/:id/edit' do 
  @recipe = Recipe.find(params[:id])
  erb :edit
 end 

 patch '/recipes/:id' do 
  @recipe = Recipe.find(params[:id])
  @recipe.name = params[:name]
  @recipe.ingredients = params[:ingredients]
  @recipe.cook_time = params[:cook_time]
  @recipe.save 
  redirect "/recipes/#{@recipe.id}"
 end 

 delete '/recipes/:id' do 
  @recipe = Recipe.find(params[:id])
  @recipe.destroy 
  redirect '/recipes'
 end 

end
