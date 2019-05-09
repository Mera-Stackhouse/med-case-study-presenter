class Api::V1::CasesController < ApplicationController

  before_action :get_case, only: [:update, :destroy]

  def index
    @cases = Case.all
    render json: @cases
  end

  def create
    @case = Case.create(case_params)
    params[:ids].each {|id|
       CasesCategory.create({case: @case, category_id: id.to_i})
    }
    render json: @case
  end

  def update
    @case.update(case_params)
    if @case.save
      render json: @case, status: :accepted
    else
      render json: { errors: @case.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @case.destroy
  end

  private

  def case_params
    params.permit(:title, :body)
  end

  def get_case
    @case = Case.find(params[:id])
  end

end
