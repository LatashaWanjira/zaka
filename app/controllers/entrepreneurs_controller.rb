# frozen_string_literal: true

# before_action :authenticate_admin!, except: %i[index show]
class EntrepreneursController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @entrepreneurs = Entrepreneur.all
    render :index
  end

  def show
    @entrepreneur = Entrepreneur.find(params[:id])
    @investments = @entrepreneur.investments.sum(:invested_amount)
    render :show
  end

  def new
    @entrepreneur = Entrepreneur.new
    render :new
  end

  def create
    @entrepreneur = Entrepreneur.new(entrepreneur_params)
    if @entrepreneur.save
      redirect_to entrepreneurs_path
    else
      render :new
    end
  end

  def edit
    @entrepreneur = Entrepreneur.find(params[:id])
    render :edit
  end

  def update
    @entrepreneur = Entrepreneur.find(params[:id])
    if @entrepreneur.update(entrepreneur_params)
      redirect_to entrepreneur_path
    else
      render :edit
    end
  end

  def destroy
    @entrepreneur = Entrepreneur.find(params[:id])
    @entrepreneur.destroy
    redirect_to entrepreneurs_path
  end

  private

  def entrepreneur_params
    params.require(:entrepreneur).permit(:business_name, :entrepreneur_name, :amount_sought, :business_summary, :funding_purpose, :location, images: [])
  end
end
