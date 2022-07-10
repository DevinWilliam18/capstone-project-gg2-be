class DetailOrdersController < ApplicationController
  before_action :get_ord
  before_action :set_detail, only: [:update, :show, :destroy]
  
  def index
    @details = @order.detail_orders
    render json: @details
  end

  def show
    render json: @detail
  end

  def create
    @detail = @order.detail_orders.build(detail_params)
    
    if @detail.save
      render json: @detail      
    else
      render json: @detail.errors
    end
    
  end

  def update
    if @detail.update(detail_params)
      render json: @detail      
    else
      render json: @detail.errors
    end

  end

  def destroy
    @detail.destroy
  end

  private
  def get_ord
    @order = Order.find(params[:order_id])
  end

   def set_detail
    @detail = @order.detail_orders.find(params[:id])
   end

   def detail_params
    params.require(:detail_order).permit(:food_id, :quantity) 
   end
   
end
