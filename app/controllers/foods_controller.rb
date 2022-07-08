class FoodsController < ApplicationController
    before_action :get_resto, only: [:show, :create]
    before_action :set_food, only: [:show, :update, :destroy]

    def index
        @foods = Food.all
        
        if params[:letter].is_a?(Integer)
            #should add join table
            @foods = Food.by_id_province(params[:letter])
        elsif params[:letter].is_a?(String)
            @foods = Food.by_name(params[:letter])
        end

       render json: @foods
    end

    def show
        if @resto.nil?
            @food = Food.find(params[:id])
        end
        
       render json: @food
    end
    
    def create
        @food = @resto.foods.build(food_params)
        
        if @food.save
            render json: @food, status: :created, location: @resto
        else
            render json: @food.errors, status: :unprocessable_entity 
        end
        
    end

    def update

        if @food.update(food_params)
            render json: @food, status: :ok
        else
            render json: @food.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @food.destroy
    end
    

    private
    def get_resto
        @resto = GarbageProducer.find(params[:garbage_producer_id])
    end

     def set_food
        @food = @resto.foods.find(params[:id])
     end

     def food_params
        params.require(:food).permit(:food_name, :food_quantity, :food_desc, :expiration_date, :condition_id)
     end
     
end


#referenece : https://scoutapm.com/blog/rails-nested-routes