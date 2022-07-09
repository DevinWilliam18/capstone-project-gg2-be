class OrdersController < ApplicationController
    before_action :get_org
    before_action :set_order, only: [:show, :update, :destroy]

    def index
        @orders = @org.orders

        render json: @orders
    end

    
    def show
        render json: @order
    end

    def create
        @order = @org.orders.build
        if @order.save
            render json: @order, status: :created
        else
            render json: @order.errors, status: :unprocessable_entity
        end
    end

    def update
        if @order.update(params.require(:order).permit(:status))
            render json: @order, status: :ok
        else
            render json: @order.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @order.destroy
    end

    private
    def get_org
        @org = Volunteer.find(params[:volunteer_id])
    end
     
     def set_order
         @order = @org.orders.find(params[:id])
     end

     

    #  def order_params
    #      params.require(:order).permit()
    #  end
end
