class NutritionsController < ApplicationController
  allow_unauthenticated_access only: [ :create ]
  skip_forgery_protection

  def create
    @nutrition = Nutrition.new(add_nutrition_params.merge(user: @current_user))

    if @nutrition.save
      respond_to do |format|
        format.json { render json: { Success: true, Message: "Nutrition created successfully", nutrition: @nutrition }, status: :created }
      end
    end
  end

  private

  def add_nutrition_params
    params.permit(:calories, :protein, :carbs)
  end
end
