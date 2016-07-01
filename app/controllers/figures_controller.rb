require 'pry'
class FiguresController < ApplicationController
  # set :views, '../views/figures'

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.title_ids = params[:figure][:title_ids] # creates a new figure_title object
    if params[:landmark][:name]
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end
    if params[:title][:name]
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end
    @figure.save
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure])
    erb :'landmarks/show'
  end
end
