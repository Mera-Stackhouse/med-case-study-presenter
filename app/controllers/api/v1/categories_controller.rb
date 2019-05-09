class Api::V1::CategoriesController < ApplicationController

    before_action :get_cat, only: [:show]

    def index
      @categories = Category.all
      render json: @categories
    end

    def show
      render json: @category
    end

    private

    def get_cat
      @category = Category.find(params[:id])
    end

end
