class V2::SharksController < ApplicationController

  def index
    @sharks = Shark.all
  end
  
  def show
    @shark = Shark.find_by(id: params[:id])
  end

  def create
    @shark = Shark.create(common_name: params[:common_name], latin_name: params[:latin_name], habitat_range: params[:habitat_range], attacks_on_humans: params[:attacks_on_humans], suitability_as_pet: false)
    
    render :show
  end

  def update
    @shark = Shark.find_by(id: params[:id])
    @shark.update(common_name: params[:common_name], latin_name: params[:latin_name], habitat_range: params[:habitat_range], attacks_on_humans: params[:attacks_on_humans], suitability_as_pet: false)
    render :show
  end

  def destroy
    Shark.find_by(id: params[:id]).destroy
    render nil
  end
end
