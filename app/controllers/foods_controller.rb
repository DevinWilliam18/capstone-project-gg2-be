class FoodsController < ApplicationController
    before_action :set_food, only: %i[ show update destroy]

    def index
        @foods = Food.all
        if params[:controller] == 'garbage_producers'
            if params[:letter].is_a?(String)
                @foods = Food.where(garbage_producer_id: params[:controller][:id]).by_name(params[:letter])
            else
                @foods = Food.where(garbage_producer_id: params[:controller][:id])  
            end
            
        else
            if params[:letter].is_a?(Integer)
                #should add join table
                @foods = Food.by_id_province(params[:letter])
            elsif params[:letter].is_a?(String)
                @foods = Food.by_name(params[:letter])
            else
                @foods = Food.all
            end
        end

       render json: @foods

    end

    def show
       render json: @food
    end
    
    def create
        
    end

    # def update
    #     @object = Object.find(params[:id])
    #     if @object.update_attributes(params[:object])
    #       flash[:success] = "Object was successfully updated"
    #       redirect_to @object
    #     else
    #       flash[:error] = "Something went wrong"
    #       render 'edit'
    #     end
    # end
    
    private
     def set_food
        if params[:controller] == 'garbage producers'
            @food = Food.where(garbage_producer_id: params[:garbage_producer_id]).find(params[:id])    
        else
            @food = Food.find(params[:id])
        end
     end

     def food_params
        params.require(:food).permit(:food_name, :food_quantity, :food_desc, :expiration_date, :condition_id, :garbage_producer_id)
     end


end
