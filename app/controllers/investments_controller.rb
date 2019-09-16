# frozen_string_literal: true

class InvestmentsController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  before_action :authenticate_investor!, except: [:index]
  def index
    @investments = Investment.page(params[:page]).per_page(5)
    @invested_amount = Investment.all.sum(:invested_amount)
    @sought_amount = Entrepreneur.all.sum(:amount_sought)
    render :index
  end

  def new
    @entrepreneur = Entrepreneur.find(params[:entrepreneur_id])
    @investment = @entrepreneur.investments.new
    render :new
  end

  def create
    # @investor = Investor.find(params[:investor_id])
    @investor = current_investor.id
    @entrepreneur = Entrepreneur.find(params[:entrepreneur_id])
    @investment = @entrepreneur.investments.new(investment_params)

    if @investment.save
      redirect_to entrepreneur_path(@entrepreneur)
    else
      render :new
    end
  end

  private

  def investment_params
    params.require(:investment).permit(:entrepreneur_id, :investor_id, :invested_amount)
  end

    def link(text, target, attributes = {})
      attributes['data-remote'] = true
      super
    end
end
