class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    erb :index
  end

  post '/recipes' do 
    recipe = Recipe.create(params)
    
    recipe.save
    redirect to "/recipes/#{recipe.id}"
  end

  get '/recipes/new' do 
    erb :new
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    # binding.pry
    recipe = Recipe.find_by_id(params[:id])
    recipe.update(params[:recipe])
    
    redirect to "/recipes/#{recipe.id}"
  end
end
