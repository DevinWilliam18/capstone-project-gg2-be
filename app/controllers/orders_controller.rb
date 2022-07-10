class OrdersController < ApplicationController
    before_action :get_org
    before_action :set_order, only: [:show, :update, :destroy]
    before_action :update_status, only: [:update]

    def index
        @orders = nil
        if @org.nil? == false
            @orders = @org.orders            
        end

        render json: @orders
    end

    
    def show
        if @org.nil?
            @order = Order.find(params[:id])
        end
        
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
        if @update_order.update(params.require(:order).permit(:status))
            if @update_order[:status] == "CONFIRMED"
                @update_order[:finished_time] = DateTime.now.in_time_zone('Jakarta')
                @update_order.update(order_update_params)
            end
            
            render json: @update_order, status: :ok
        else
            render json: @update_order.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @order.destroy
    end

    
    

    private
    def get_org
        @org = nil
        if params[:volunteer_id].nil?
            @org = nil
        else
            @org = Volunteer.find(params[:volunteer_id])    
        end
        
    end
     
     def set_order
        if @org.nil?
            @order = nil
        else
            @order = @org.orders.find(params[:id])   
        end
         
     end
     
     def order_update_params
         params.require(:order).permit(:status, :finished_time)
     end
     def update_status
        @update_order = Order.find(params[:id])
    end
end
