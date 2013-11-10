class DealsController < ApplicationController
  include CurrentCart

  before_action :admin_user, only: [:index, :edit, :create, :update, :destroy ]
  before_action :set_cart

  def new
    @deal = Deal.new
    @companies = Company.all
  end

  def index
    @deals = Deal.order("deal_date desc").limit(10).includes(:city)
  end

  def show
    @deal = Deal.find(params[:id])
  end

  
  
  def edit
    @deal = Deal.find(params[:id])
  end

  def create
    @deal = Deal.new(deal_params)
      if @deal.save
        flash[:notice] = "Deal has been created."
        redirect_to deals_path
      else
        render :new
    end
  end

  def update
    @deal = Deal.find(params[:id])
    if @deal.update(deal_params)
      flash[:notice] = "Deal successfully updated!"
      redirect_to deals_path
    else
      render :edit
    end
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to deals_url, alert: 'Deal successfully deleted!'
  end

  def who_bought
    @deal = Deal.find(params[:id])
    @latest_order = @deal.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end

  private
  def deal_params 
    params.require(:deal).
    permit(:name, :blurb_title, :blurb, :deal_type, :photo, 
        :regular_price, :initial_discount, :max_discount, :max_threshold, 
        :tipping_point, :deal_date, :end_date, :city_id, :deal_price, :approved)
  end
end