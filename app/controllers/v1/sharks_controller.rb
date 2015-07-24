class V1::SharksController < ApplicationController

  def index
    @sharks = Shark.all
  end
  
  def show
    @shark = Shark.find_by(id: params[:id])
  end

  def create
    @shark = Shark.new(common_name: params[:common_name], latin_name: params[:latin_name], habitat_range: params[:habitat_range], attacks_on_humans: params[:attacks_on_humans], suitability_as_pet: false)
    if @shark.save
    else
      render json: {errors: @shark.errors.full_messages}, status: 422
    end
  end

  def update
    @shark = Shark.find_by(id: params[:id])
    if @shark.update(common_name: params[:common_name], latin_name: params[:latin_name], habitat_range: params[:habitat_range], attacks_on_humans: params[:attacks_on_humans], suitability_as_pet: false)
    else
      render json: {errors: @shark.errors.full_messages}, status: 422
    end
  end

  def destroy
    Shark.find_by(id: params[:id]).destroy
  end
end
